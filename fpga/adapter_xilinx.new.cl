
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


#define MEMORY_BURSTS 512	// 512 Bytes
const int LEN_512_BIT_BURSTS	(MEMORY_BURSTS / (512/8))
const int LEN_32_BIT_BURSTS	(MEMORY_BURSTS / (32/8))



// Read Data from Global Memory and write into Stream inStream
static void read_input(ap_uint<512>* pairs, hls::stream<ap_uint<512>>& inStream, int size) 
{
// Auto-pipeline is going to apply pipeline to this loop
mem_rd:
    for (int i = 0; i < size; i++) 
    {
#pragma HLS LOOP_TRIPCOUNT min=LEN_512_BIT_BURSTS max=LEN_512_BIT_BURSTS
        // Blocking write command to inStream
        inStream << pairs[i];
    }
}

// Read Input data from inStream and write the result into outStream
static void compute_distance(hls::stream<ap_uint<512>>& pairs, hls::stream<unsigned int>& outStream, int size) 
{
// Auto-pipeline is going to apply pipeline to this loop
execute:
    for (int i = 0; i < size; i++) 
    {
#pragma HLS LOOP_TRIPCOUNT min=LEN_512_BIT_BURSTS max=LEN_512_BIT_BURSTS
        // Blocking read command from inStream and Blocking write command
        // to outStream
	ap_uint<512> pw = pairs.read();
	unsigned int d = computeTaskEntryType0(pw);
        outStream << d;
    }
}

// Read result from outStream and write the result to Global Memory
static void write_result(unsigned int* out, hls::stream<unsigned int>& outStream, int size) 
{
// Auto-pipeline is going to apply pipeline to this loop
mem_wr:
    for (int i = 0; i < size; i++) 
    {
#pragma HLS LOOP_TRIPCOUNT min=LEN_32_BIT_BURSTS max=LEN_32_BIT_BURSTS
        // Blocking read command to inStream
        out[i] = outStream.read();
    }
}


extern "C" {
// __kernel 
void kmer( ap_uint<512>* pairs ,
	   unsigned int* workload, 
	   unsigned int workloadLength)

#pragma HLS_INTERFACE m_axi port = pairs
#pragma HLS_INTERFACE m_axi port = workload
#pragma HLS_INTERFACE s_axilite port = workloadLength 
{
#ifdef FPGA_DEBUG
    printf("[FPGA] kernel invoked\n");
#endif

    static hls::stream<ap_uint<512>> inStream("input_stream");
    static hls::stream<unsigned int> outStream("output_stream");
#pragma HLS STREAM variable=inStream depth=LEN_512_BIT_BURSTS
#pragma HLS_STREAM variable=outStream depth=LEN_32_BIT_BURSTS


    #pragma HLS dataflow
    read_input(pairs, inStream, workloadLength);
    compute_distance(inStream, outStream, workloadLength);
    write_result(workload, outStream, workloadLength);


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
