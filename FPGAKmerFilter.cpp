/*
 * Copyright (C) 2020 Universitat Autonoma de Barcelona - David Castells-Rufas <david.castells@uab.cat>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */


/* 
 * File:   FPGAKmerFilter.cpp
 * Author: dcr
 * 
 * Created on February 20, 2020, 6:04 PM
 */

#include "FPGAKmerFilter.h"
#include "PerformanceLap.h"
#include "TextUtils.h"
// #include "benchmark/benchmark_edit_alg.h"

#define WORKLOAD_TASK_SIZE  3
#define INDEX_SIZE          2
#define BASE_SIZE           2
#define LOAD_BASES_ALIGNMENT_BITS   512

#define KMER_K          5
#define KMER_K_BITS     (KMER_K*BASE_SIZE)
#define KMER_BINS       (1 << KMER_K_BITS)

/**
 * Compute the number of bytes required to store the number of bases, considering
 * that we require memory alignment
 * @param bases
 * @return 
 */
unsigned int alignedSequenceSize(int bases)
{
    unsigned int lenBits = bases * BASE_SIZE;         // length in bases
    unsigned int lenAlignedUnits = ((lenBits  + (LOAD_BASES_ALIGNMENT_BITS-1)) / LOAD_BASES_ALIGNMENT_BITS) * LOAD_BASES_ALIGNMENT_BITS; // round up

    unsigned int lenAlignedUnitsBytes = lenAlignedUnits / 8;
    return lenAlignedUnitsBytes;
}

FPGAKmerFilter::FPGAKmerFilter() {
}



FPGAKmerFilter::~FPGAKmerFilter() {
}

void FPGAKmerFilter::addInput(string pattern, string text) 
{
    int pl = pattern.size();
    int tl = text.size();
    
    
    m_basesPattern.push_back(pattern);
    m_basesText.push_back(text);
    m_basesPatternLength.push_back(pl);
    m_basesTextLength.push_back(tl);

}

#define dna_encode_valid(c)   (((c == 'A') || (c == 'a'))? 0: ((c == 'C') || (c == 'c'))? 1: ((c == 'G') || (c == 'g'))? 2: 3)



string FPGAKmerFilter::decodeSequence(unsigned char* pattern, unsigned int offset, unsigned len)
{
	char* sym[]={"A", "C", "G", "T"};

	string bases = "";
	int j = 0;
	for (int i=0; i < len; j++ )
	{
		unsigned char v = pattern[j];

		for (int k=0; (k < 4) && (i < len); k++, i++)
		{
			int isym = (v >> (6-k*2)) & 0x3;
			bases.append(sym[isym]);			
		}
	}

	return bases;
}

void FPGAKmerFilter::encodeSequence(string bases, unsigned int basesLength, unsigned char* pattern, unsigned int offset)
{
    assert(bases.size() == basesLength);
    	int start = offset;

    // round the number of bases to a byte multiple
    int basesWithPaddingBytes = (basesLength * BASE_SIZE + 7) / 8;  //number of bytes required to store the bases
    int basesWithPadding = basesWithPaddingBytes * 8 / BASE_SIZE;   // number of basesincluding the passing 
    int paddingBases = basesWithPadding - basesLength;
    
    // add the padding to the base array
    for (int i=0; i < paddingBases; i++)
        bases.append("A");  // any character would do
    
    unsigned int gi;
    
    // now write the sequence to the memory
    for ( gi = 0; gi < basesLength; )    // gi is incremented in byte filling
    {
        // encode 4 bases in big endian
        unsigned char c = 0;
        for (int i=0; i < (8/BASE_SIZE); i++)
        {
            c = c << 2;
            c |= dna_encode_valid(bases[gi]);
		gi++;
        }

//        printf("t[%d]==%02X (gi=%d)\n", offset, (int) c, gi);

	pattern[offset] = c;
        offset++;
    }
        
//    printf("bases length=%d start offset: %d end offset = %d gi=%d\n", basesLength, start, offset, gi);

}

void FPGAKmerFilter::encodeEntry( unsigned char* pPattern, unsigned int offset, string pattern, string text )
{
	int pl = pattern.size();
	int tl = text.size();

	assert(pl < 256);
	assert(tl < 256);

	pPattern[offset + 0] = pl;
	pPattern[offset + 1] = tl;

	int baseByteIdx;
	int baseBitIdx;

	int alignedTextStart = 2 + (((pl * 2) + 7) / 8) ;

	for (int i=0; i < pl; i++)
	{
		int bc = dna_encode_valid(pattern[i]);
		baseByteIdx = i / 4;
		baseBitIdx = (3 - i%4) * 2;
		
		unsigned char vset = bc << baseBitIdx;
		unsigned char mask = 3 << baseBitIdx;
		unsigned char nmask = ~mask;
	
		pPattern[offset + 2 + baseByteIdx] = (pPattern[offset + 2 + baseByteIdx] & nmask) | vset; 
	}

	for (int i=0; i < tl; i++)
	{
		int bc = dna_encode_valid(text[i]);
		baseByteIdx = i / 4;
		baseBitIdx = (3 - i%4) * 2;
		
		unsigned char vset = bc << baseBitIdx;
		unsigned char mask = 3 << baseBitIdx;
		unsigned char nmask = ~mask;
	
		pPattern[offset + alignedTextStart  + baseByteIdx] = (pPattern[offset + alignedTextStart + baseByteIdx] & nmask) | vset; 
	}
}


void FPGAKmerFilter::setVerbose(bool verbose)
{
	m_verbose = verbose;
}

void FPGAKmerFilter::computeAll(int realErrors)
{
    // allocate memory buffers
    //size_t requiredPatternMemory = countRequiredMemory(m_basesPatternLength);    
    //size_t requiredTextMemory = countRequiredMemory(m_basesTextLength);
    
    size_t requiredEntryMemory = m_basesPatternLength.size() * (512/8);

    unsigned char* pattern = (unsigned char*) alignedMalloc(requiredEntryMemory);
    unsigned int* workload = (unsigned int*) alignedMalloc(m_basesTextLength.size() * sizeof(unsigned int) * WORKLOAD_TASK_SIZE);
    
    // now fill
    unsigned int poff = 0;  // pattern offset
    unsigned int toff = 0;  // text offset
    
    for (int i=0; i < m_basesPatternLength.size(); i++)
    {
        // fill the workload
        workload[i*WORKLOAD_TASK_SIZE+0] = i;   // pattern
        workload[i*WORKLOAD_TASK_SIZE+1] = i;   // text
        
        // fill the pattern
//        patternIdx[i*INDEX_SIZE+0] = poff;   // pattern offset
//        patternIdx[i*INDEX_SIZE+1] = m_basesPatternLength[i];

	encodeEntry(pattern, i*(512/8), m_basesPattern[i],  m_basesText[i]);
 
//printf("Pattern: %s\n", m_basesPattern[i].c_str());       
 //printf("Pattern: %s\n", m_original[i]->pattern);       
//encodeSequence(m_basesPattern[i], m_basesPatternLength[i], pattern, poff);

//string debug = decodeSequence(pattern, poff, m_basesPatternLength[i]);
//printf("Decoded: %s\n", debug.c_str());
        
//        poff += alignedSequenceSize(m_basesPatternLength[i]);
        
        // fill the text
//        textIdx[i*INDEX_SIZE+0] = toff;
//        textIdx[i*INDEX_SIZE+1] = m_basesTextLength[i];
//     printf("Text: %s\n", m_basesText[i].c_str());   
//        encodeSequence(m_basesText[i], m_basesTextLength[i], text, toff);
        
//        toff += alignedSequenceSize(m_basesTextLength[i]);
    }

//    printf("Invoke kernel\n");

    invokeKernel(pattern, requiredEntryMemory, workload, m_basesPatternLength.size());
    
	int FP = 0;
	int FN = 0;
	int total = m_basesPatternLength.size();
    for (int i=0; i < total; i++)
    {
        bool accepted;
        unsigned int detectedErrors = workload[i*WORKLOAD_TASK_SIZE+2];


	if (m_verbose)
	        printf("[%d] distance=%d max error=%d\n", i, detectedErrors, m_threshold);
//        my_benchmark_check(m_original[i], m_basesPattern[i], m_basesText[i], accepted);


	if ((detectedErrors <= m_threshold) && (realErrors > m_threshold)) 	
		FP++;
	
	if ((detectedErrors > m_threshold) && (realErrors <= m_threshold))
		FN++;
    }

    printf("FP: %d (%0.2f %%)  FN: %d (%0.2f %%)\n", FP, (FP*100.0/total), FN, (FN*100.0/total));

    // free all
    alignedFree(pattern);
    
}

void FPGAKmerFilter::setReportTime(bool reportTime)
{
   m_reportTime = reportTime;
}

void FPGAKmerFilter::invokeKernel(unsigned char* pattern, unsigned int patternSize, unsigned int* workload, unsigned int tasks)
{
    cl_int ret;
    
    PerformanceLap lap;
    
    m_memPattern = clCreateBuffer(m_context, CL_MEM_READ_WRITE, patternSize, NULL, &ret);
    SAMPLE_CHECK_ERRORS(ret);

    m_memWorkload = clCreateBuffer(m_context, CL_MEM_READ_WRITE, tasks*WORKLOAD_TASK_SIZE*sizeof(unsigned int), NULL, &ret);
    SAMPLE_CHECK_ERRORS(ret);

    lap.start();

    ret = clEnqueueWriteBuffer(m_queue, m_memPattern, CL_TRUE, 0, patternSize, pattern, 0, NULL, NULL);
    SAMPLE_CHECK_ERRORS(ret);
    
    ret = clEnqueueWriteBuffer(m_queue, m_memWorkload, CL_TRUE, 0, tasks*WORKLOAD_TASK_SIZE*sizeof(unsigned int), workload, 0, NULL, NULL);
    SAMPLE_CHECK_ERRORS(ret);

    ret = clSetKernelArg(m_kmerKernel, 0, sizeof(cl_mem), (void *)&m_memPattern);
    SAMPLE_CHECK_ERRORS(ret);
    
    ret = clSetKernelArg(m_kmerKernel, 1, sizeof(cl_mem), (void *)&m_memWorkload);
    SAMPLE_CHECK_ERRORS(ret);

    ret = clSetKernelArg(m_kmerKernel, 2, sizeof(cl_int), (void *)&tasks);
    SAMPLE_CHECK_ERRORS(ret);

    lap.stop();
    if (m_reportTime)
        printf("Argument Setting= %f seconds\n", lap.lap());
    
    lap.start();
    
    // send the events to the FPGA
    size_t wgSize[3] = {1, 1, 1};
    size_t gSize[3] = {1, 1, 1};

    ret = clEnqueueNDRangeKernel(m_queue, m_kmerKernel, 1, NULL, gSize, wgSize, 0, NULL, NULL);
    SAMPLE_CHECK_ERRORS(ret);
    
    ret = clFinish(m_queue);
    SAMPLE_CHECK_ERRORS(ret);
    
    lap.stop();
    
    if (m_reportTime)
        printf("Kernel time= %f seconds\n", lap.lap());
    
    lap.start();
    
    ret = clEnqueueReadBuffer(m_queue, m_memWorkload, CL_TRUE, 0, tasks*WORKLOAD_TASK_SIZE*sizeof(unsigned int), workload, 0, NULL, NULL);
    SAMPLE_CHECK_ERRORS(ret);
    
    
    ret = clReleaseMemObject(m_memPattern);
    SAMPLE_CHECK_ERRORS(ret);
    
    ret = clReleaseMemObject(m_memWorkload);
    SAMPLE_CHECK_ERRORS(ret);

    lap.stop();
    
    if (m_reportTime)
        printf("Result fetch= %f seconds\n", lap.lap());

}


size_t FPGAKmerFilter::countRequiredMemory(vector<int>& len)
{
    size_t total = 0;
    
    for (int i=0; i  < len.size(); i++)
    {
        int bases = len[i];
        
        total += alignedSequenceSize(bases);
    }
    
    return total;
}


void FPGAKmerFilter::destroy()
{
    
}

void FPGAKmerFilter::initOpenCL(int platform_id)
{

    cl_uint spi = platform_id;
    cl_uint sdi = 0;

    if (m_verbose)
        cout << "[OCLFPGA] initialization (version compiled "  << __DATE__  << " "  << __TIME__ << ")" << endl;
    
    try
    {
        if(!setCwdToExeDir()) 
        {
            if (m_verbose)
                cout << "[OCLFPGA] ### ERROR ### Failed to change dir" << endl;
            return;
        }

        m_platform = selectPlatform(spi);

        if (m_verbose)
            cout << "[*] Platform Selected [OK] " << endl;
        
        m_deviceId = selectDevice(m_platform, sdi);

        if (m_verbose)
            cout << "[*] Device Selected [OK] " << endl;


        m_context = createContext(m_platform, m_deviceId);

        if (m_verbose)
            cout << "[*] Context Created [OK] " << endl;

        m_queue = createQueue(m_deviceId, m_context, 0);

        if (m_verbose)
            cout << "[*] Queue Created [OK] " << endl;

//        m_queue2 = createQueue(m_deviceId, m_context, 0);
//
//        if (m_verbose)
//            cout << "[*] Queue 2 Created [OK] " << endl;

        m_openCLFilesPath = ".";

        if (m_verbose)
            cout << "Default Path=  " << m_openCLFilesPath << endl;


//        initKernels();

    }
    catch (Error& err)
    {
        printf("%s\n", err.what());
        exit(0);
    }
}

void FPGAKmerFilter::finalizeOpenCL()
{
    //finalizeKernels();
    cl_int err;
    
    err = clReleaseContext(m_context);   
    SAMPLE_CHECK_ERRORS(err);
    
    
}

void FPGAKmerFilter::initKernels(int version, string openCLKernelType, int threshold)
{
    cl_int ret;
    
    m_openCLKernelVersion = version;
    m_threshold = threshold;
    
    if (m_verbose)
    {
        printf("Reading Kernel files\n");
    }

    string platformName = getPlatformName(m_platform);
        
    printf("[OCLFPGA] Platform Name = %s\n", platformName.c_str());

    uint64 t0, tf;

    perfCounter(&t0);

    // NVIDIA devices should work with binaries (PTX)

    const unsigned char* pKernels[10]; 
    size_t pKernelSizes[10];
    cl_int pStatus[10];

    memset(pKernels, 0, sizeof(pKernels));
    memset(pKernelSizes, 0, sizeof(pKernelSizes));

    int kernelCount = 0;

    std::string fullPath  = m_openCLFilesPath.c_str() + format("/fpga/%s.aocx", openCLKernelType.c_str());

    printf("Opening %s\n", fullPath.c_str());

    setCwd(m_openCLFilesPath.c_str());

    int sysret = system("pwd");

    printf("Create Program From Binary...\n");

    m_program = createProgramFromBinary(m_context, fullPath.c_str(), &m_deviceId, 1); 

    printf("[OK]\n");

    printf("Compiling...\n");
    fflush(stdout);

    //ret = clBuildProgram(program, 1, &device, "-g -s", NULL, NULL);   // in Windows
    ret = clBuildProgram(m_program, 1, &m_deviceId, NULL, NULL, NULL);

    printf("[OK]\n");
    fflush(stdout);

    perfCounter(&tf);

    printf("[INFO] Kernel Compilation Time: %f\n", (float) secondsBetweenLaps(t0, tf));

    //if (ret == CL_BUILD_PROGRAM_FAILURE) 
    {
        // Determine the size of the log
        size_t log_size;
        ret = clGetProgramBuildInfo(m_program, m_deviceId, CL_PROGRAM_BUILD_LOG, 0, NULL, &log_size);

        // Allocate memory for the log
        char *log = (char *) malloc(log_size);

        // Get the log
        ret = clGetProgramBuildInfo(m_program, m_deviceId, CL_PROGRAM_BUILD_LOG, log_size, log, NULL);

        // Print the log
        printf("%s\n", log);
    }

    SAMPLE_CHECK_ERRORS(ret);

    for (int i=0; i < kernelCount; i++)
    {
        free((void*)pKernels[i]);
    }

    fflush(stderr);
    fflush(stdout);

    //string allCode = m_addSourceCode + "\n" + m_mulSourceCode;

    m_kmerKernel = clCreateKernel(m_program, "kmer", &ret);
    SAMPLE_CHECK_ERRORS(ret);


        
    fflush(stderr);
    fflush(stdout);
}

void FPGAKmerFilter::finalizeKernels()
{
    cl_int ret;
    
    
    
    ret = clReleaseKernel(m_kmerKernel);
    SAMPLE_CHECK_ERRORS(ret);
    
    ret = clReleaseProgram(m_program);
    SAMPLE_CHECK_ERRORS(ret);

}
