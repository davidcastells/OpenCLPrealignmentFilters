
#include "xilinx_ap_uint.h"

#ifndef PREPROCESSING
#include <stdio.h>
#else
__hash__ include <stdio.h>
#endif


//#define WORKLOAD_TASK_SIZE  3  @deprecated, this will be assumed to be 1, it has little sense to have indexing (as originally thought)

#define INDEX_SIZE          2
#define BASE_SIZE           2


#ifndef WORKLOAD_CHUNK
#define WORKLOAD_CHUNK 1024*16
#endif

#ifdef ENTRY_TYPE_0
unsigned int computeTaskEntryType0(ap_uint<512> pairs_word);
unsigned int computeDistance(ap_uint<512> pattern, int plen, ap_uint<512> text, int tlen);
void printSequence512(ap_uint<512> w, int len);
#endif

#ifdef ENTRY_TYPE_1
unsigned int computeTaskEntryType1(ap_uint<512> pairs_word_p, ap_uint<512> pairs_word_t);
unsigned int computeDistance(ap_uint<512> pattern, int plen, ap_uint<512> text, int tlen);
void printSequence512(ap_uint<512> w, int len);
#endif

#ifdef ENTRY_TYPE_2
unsigned int computeTaskEntryType2(ap_uint<512> pairs_word_p0, ap_uint<512> pairs_word_p1, ap_uint<512> pairs_word_t0, ap_uint<512> pairs_word_t1);
unsigned int computeDistance(ap_uint<1024> pattern, int plen, ap_uint<1024> text, int tlen);
void printSequence512(ap_uint<512> w, int len);
void printSequence1024(ap_uint<1024> w, int len);
#endif







extern "C" {
// __kernel 
void kmer( ap_uint<512>* pairs ,
	   ap_uint<512>* workload, 
	   unsigned int workloadLength)

#pragma HLS_INTERFACE m_axi port = pairs
#pragma HLS_INTERFACE m_axi port = workload
#pragma HLS_INTERFACE s_axilite port = workloadLength 
{
#ifdef FPGA_DEBUG
    printf("[FPGA] kernel invoked\n");
	// test_my_ap_uint();
#endif

	
    ap_uint<32> workload_result[WORKLOAD_CHUNK];
	
    for (int i=0; i < workloadLength; /*i++*/) // i is incremented in the following loop
    {
    	int base_i = i;
        int li;		// local memory index

#ifdef FPGA_DEBUG
	printf("load pair %d\n", i);
#endif
	
    	// compute to local memory
    	for (li=0; (li < WORKLOAD_CHUNK) && (i < workloadLength); i+=8)
	{
	    #pragma HLS PIPELINE

	    ap_uint<512> pw[8];

	    // create read bursts (8*512/8 = 512 bytes)
	    for (int j=0; j < 8; j++)
            {
		#pragma HLS PIPELINE
		pw[j] = ap_uint_512_byteReversal(pairs[i+j]);

#ifdef FPGA_DEBUG
		printf("pw[%d]=", j);
		printSequence512(pw[j], 256);
		printf("\n");
#endif
	    }

	    int tj = 0;
            for (int sj=0 ; sj < 8; tj++)
	    {
		#pragma HLS PIPELINE


#ifdef ENTRY_TYPE_0
                workload_result[li+tj] = computeTaskEntryType0(pw[sj]);
		sj++;
#endif

#ifdef ENTRY_TYPE_1
		workload_result[li+tj] = computeTaskEntryType1(pw[sj], pw[sj+1]);
		sj += 2;
#endif

#ifdef ENTRY_TYPE_2
		workload_result[li+tj] = computeTaskEntryType2(pw[sj], pw[sj+1], pw[sj+2], pw[sj+3]);
		sj += 4;
#endif

#ifdef FPGA_DEBUG
		printf("workload: %d distance=%d\n", li+tj, workload_result[li+tj]);
#endif

	    }
	    li += tj;
	}
		
	// transfer the results back to the main table
	// li will contain the number of (32 bits) words
#ifdef FPGA_DEBUG
	printf("Number of computed pairs: %d\n", li);
#endif
	li = (li+15) / 16 ; // this is the number of 512 words
#ifdef FPGA_DEBUG
	printf("Number of required 512 bits words: %d\n", li);
#endif

	for (int ti=0; ti < li; ti+=8)
	{
	    #pragma HLS PIPELINE

	    ap_uint<512> pw[8];

	    // create write burst (128*32/8 = 512 bytes)
	    for (int j=0; j < 8; j++)
	    {
	        #pragma HLS PIPELINE
		
		pw[j](511, 480) = workload_result[ti*128+j*16+0];
		pw[j](479, 448) = workload_result[ti*128+j*16+1];
		pw[j](447, 416) = workload_result[ti*128+j*16+2];
		pw[j](415, 384) = workload_result[ti*128+j*16+3];
		pw[j](383, 352) = workload_result[ti*128+j*16+4];
		pw[j](351, 320) = workload_result[ti*128+j*16+5];
		pw[j](319, 288) = workload_result[ti*128+j*16+6];
		pw[j](287, 256) = workload_result[ti*128+j*16+7];

		pw[j](255, 224) = workload_result[ti*128+j*16+8];
		pw[j](223, 192) = workload_result[ti*128+j*16+9];
		pw[j](191, 160) = workload_result[ti*128+j*16+10];
		pw[j](159, 128) = workload_result[ti*128+j*16+11];
		pw[j](127,  96) = workload_result[ti*128+j*16+12];
		pw[j](95 ,  64) = workload_result[ti*128+j*16+13];
		pw[j](65 ,  32) = workload_result[ti*128+j*16+14];
		pw[j](31 ,   0) = workload_result[ti*128+j*16+15];
	    
		//#pragma HLS PIPELINE

		// write the 512 bit word to the global memory
		// 512 bytes require 8 (512 bit) words 
		workload[base_i + ti*8 + j ] = ap_uint_512_uintReversal(pw[j]);

#ifdef FPGA_DEBUG
		// printf("workload[%d]=", base_i + ti*8 + j);
		for (int k=0; k < 16; k++)
			 printf("workload_result[%d] = %d\n", ti*128+j*16+k, (int) workload_result[ti*128+j*16+k]);
		printf("\n");
#endif
	    }
        }
    }
}

} // extern "C"






#ifdef ENTRY_TYPE_0


// both words are encoded in a single 512 bits (256 bases) words
unsigned int computeTaskEntryType0(ap_uint<512> pairs_word)
{
	int d = 0;

	
	ap_uint<512> pattern_word;
	ap_uint<512> text_word;


#ifdef PATTERN_LEN
	unsigned char pl = PATTERN_LEN;
	unsigned char tl = TEXT_LEN;
#else
	unsigned char pl = ap_uint_512_getHighByte(pairs_word, 0);
	unsigned char tl = ap_uint_512_getHighByte(pairs_word, 1);
#endif

#ifdef FPGA_DEBUG
	unsigned char pl2 = ap_uint_512_getHighByte(pairs_word, 0);
	unsigned char tl2 = ap_uint_512_getHighByte(pairs_word, 1);
	printf("pattern len: %d\ttext len: %d\n", pl2, tl2);
#endif
	int alignedTextStart = 1 + 1 + (((pl * BASE_SIZE) + 7) / 8) ;	// in bytes

	pattern_word = pairs_word << (2*8);
	text_word = pairs_word << (alignedTextStart*8);


#ifdef FPGA_DEBUG
        printf("WORD:");
	printSequence512(pairs_word, 256);
	printf("\n");
	printf("T:   ");
	printSequence512(text_word, tl);
	printf("\n");
	printf("P:   ");        
	printSequence512(pattern_word, pl);
	printf("\n");
#endif


	d = computeDistance(pattern_word,  pl, text_word,  tl);	// we just compare pattern
	
	return d;
}
#endif



#ifdef ENTRY_TYPE_1


unsigned int computeTaskEntryType1(ap_uint<512> pairs_word_p, ap_uint<512> pairs_word_t)
{
	int d = 0;

	// ap_uint_512 pairs_word_p;
	// ap_uint_512 pairs_word_t;
	
	ap_uint<512> pattern_word;
	ap_uint<512> text_word;

	// readPairs(pairs, pi, AP_UINT_PTR(pairs_word_p), AP_UINT_PTR(pairs_word_t));

#ifdef PATTERN_LEN
	unsigned char pl = PATTERN_LEN;
	unsigned char tl = TEXT_LEN;
#else
	unsigned char pl = ap_uint_512_getHighByte(pairs_word_p, 0);
	unsigned char tl = ap_uint_512_getHighByte(pairs_word_t, 0);
#endif

#ifdef FPGA_DEBUG
	printf("pattern len: %d\ttext len: %d\n", pl, tl);
#endif
	//int alignedTextStart = 1 + 1 + (((pl * BASE_SIZE) + 7) / 8) ;	// in bytes

	pattern_word = pairs_word_p << 1*8; //, AP_UINT_PTR(pattern_word));
	text_word = pairs_word_t << 1*8; //, AP_UINT_PTR(text_word));


#ifdef FPGA_DEBUG
	printf("T:   ");
	printSequence512(text_word, tl);
	printf("\n");
	printf("P:   ");        
	printSequence512(pattern_word, pl);
	printf("\n");
#endif


	d = computeDistance(pattern_word,  pl, text_word,  tl);	// we just compare pattern
	
	return d;
}
#endif



#ifdef ENTRY_TYPE_2

unsigned int computeTaskEntryType2(ap_uint<512> p0, ap_uint<512> p1, ap_uint<512> t0, ap_uint<512> t1)
{
	int d = 0;

	ap_uint<1024> p0big = p0;
	ap_uint<1024> p1big = p1;
	ap_uint<1024> t0big = t0;
	ap_uint<1024> t1big = t1;

	ap_uint<1024> pairs_word_p = (p0big << 512) | p1big;
	ap_uint<1024> pairs_word_t = (t0big << 512) | t1big;
	
#ifdef FPGA_DEBUG
	printf("T(raw): ");
	printSequence1024(pairs_word_t, 512);
	printf("\n");

	printf("t0:");
	printSequence512(t0, 256);
	printf("\n");
	printf("t1:");
	printSequence512(t1, 256);
	printf("\n");

	//printf("P(raw): ");
	//printSequence1024(pairs_word_t, 512);
	//printf("\n");
#endif

	ap_uint<1024> pattern_word;
	ap_uint<1024> text_word;


#ifdef PATTERN_LEN
	unsigned int pl = PATTERN_LEN;
	unsigned int tl = TEXT_LEN;
#else
	unsigned int pl = ap_uint_1024_getHighByte(pairs_word_p, 0);
	unsigned int tl = ap_uint_1024_getHighByte(pairs_word_t, 0);
#endif

#ifdef FPGA_DEBUG
	printf("pattern len: %d\ttext len: %d\n", pl, tl);
#endif

	pattern_word = pairs_word_p << 1*8;
	text_word = pairs_word_t << 1*8;


#ifdef FPGA_DEBUG
	printf("T:   ");
	printSequence1024(text_word, tl);
	printf("\n");
	printf("P:   ");        
	printSequence1024(pattern_word, pl);
	printf("\n");
#endif

	d = computeDistance(pattern_word,  pl, text_word,  tl);	// we just compare pattern
	
	return d;
}
#endif

/**
* we assume the sequence is left aligned to the 512 bits word, and stored in Most Significant Bit First order
* @param w
* @param offset
* @param len	length in bases
*/
void printSequence512(ap_uint<512> w, int len)
{
	char sym[]={'A','C','G', 'T'};
	
	
	for (int i=0; i < len; i++)
	{
	   int last = 512 - 1 - (i * BASE_SIZE);
	   unsigned char isym = w(last, last - 1); // (w[last - 0] << 1) | w[last -1];  
           printf("%c", sym[isym]);	   
	}

}

/**
* we assume the sequence is left aligned to the 512 bits word, and stored in Most Significant Bit First order
* @param w
* @param offset
* @param len	length in bases
*/
void printSequence1024(ap_uint<1024> w, int len)
{
	char sym[]={'A','C','G', 'T'};
	
	
	for (int i=0; i < len; i++)
	{
	   int last = 1024 - 1 - (i * BASE_SIZE);
	   unsigned char isym = w(last, last - 1); // (w[last-0] << 1) | w[last-1];  
           printf("%c", sym[isym]);	   
	}

}
