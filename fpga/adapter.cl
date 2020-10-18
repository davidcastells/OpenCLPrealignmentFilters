#include "my_ap_uint.h"

#define WORKLOAD_TASK_SIZE  3
#define INDEX_SIZE          2
#define BASE_SIZE           2


unsigned int computeTask(__global unsigned char* restrict pairs, unsigned int pi);
unsigned int computeDistance(ap_uint_512 pattern, int plen, ap_uint_512 text,  int tlen);
void printSequence(ap_uint_512 w, int len);



/**
 * from version 11 we assume that pattern index, and text index is the same worload index  
 */
void doWorkloadTask(__global unsigned char* restrict pairs ,
                    /*__global*/ unsigned int* workload, unsigned int wi, unsigned int li)
{
    unsigned int pi = wi; // workload[wi*WORKLOAD_TASK_SIZE+0];
    unsigned int ti = wi; // workload[wi*WORKLOAD_TASK_SIZE+1];

    
    unsigned int d = computeTask(pairs,  pi);
    
#ifdef FPGA_DEBUG
    printf("[FPGA] pi=%d  ", pi);
    printf(" task %d = %d\n", wi, d);
#endif
    
    //workload[wi*WORKLOAD_TASK_SIZE+2] = d;
    workload[li] = d;
}


__kernel void kmer(__global unsigned char* restrict pairs ,
		   __global unsigned int* workload, 
		   unsigned int workloadLength)
{
#ifdef FPGA_DEBUG
	// test_my_ap_uint();
#endif

	#define WORKLOAD_CHUNK 1024*16
	unsigned int workload_result[WORKLOAD_CHUNK];
	
    for (int i=0; i < workloadLength; /*i++*/)
    {
    	int base_i = i;
        int li;
	
    	// compute to local memory
    	for (li=0; (li < WORKLOAD_CHUNK) && (i < workloadLength); li++, i++)
	{
	   doWorkloadTask(pairs, workload_result, i, li);
	}
		
	// transfer the results back to the main table
	for (int ti=0; ti < li; ti++)
		workload[(base_i + ti)*WORKLOAD_TASK_SIZE+2] = workload_result[ti];
     }
}

#ifdef FPGA_DEBUG
void readBigEndian512bits(__global unsigned char* restrict p, ap_uint_512p ret)
{
    ap_uint_512_zero(ret);
    
    #pragma unroll
    for (int i=0; i < 512/8; i++)
    {
        // ret |= p[i] << (i * 8);
        // ap_uint_512_shift_left_self(8, ret);
        ap_uint_512_setHighByteConcurrent(ret, i, p[i]);

	// printf("[%d] = 0x%02X\n", i, p[i]);
    }   

    printf("Long Word: ");
    ap_uint_512_print(AP_UINT_FROM_PTR(ret));
    printf("\n");
}

#else
void readBigEndian512bits(__global unsigned char* restrict p, ap_uint_512p ret)
{
    ap_uint<512> v;
    ap_uint_512_zero(AP_UINT_PTR(v));

    #pragma unroll
    for (int i=0; i < 512/8; i++)
    {
	int byteIdx = 512/8 - 1 - i;


	ap_uint<512> incoming = p[i];

        v |= incoming << (byteIdx*8);

	unsigned int v2 = (v >> (byteIdx*8)) & 0xFF;

	//printf("[%d] (%d) = 0x%02X - in word = 0x%02X\n", i, byteIdx, p[i], v2);
    }

    *ret =  v;
}
#endif
    



#ifdef FPGA_DEBUG
void readPairs(__global unsigned char* restrict pattern , unsigned int pi, ap_uint_512p ret)
{
    unsigned int offset = pi * 512 /  8;
    
    readBigEndian512bits(&pattern[offset], ret);  
}
#else
void readPairs(__global unsigned char* restrict pattern , unsigned int pi, ap_uint_512p ret)
{
    unsigned int offset = pi * (512 / 8);	// bytes of the next entry
    
    readBigEndian512bits(&pattern[offset], ret);   
}
#endif



unsigned int computeTask(__global unsigned char* restrict pairs,
                 unsigned int pi)
{
	int d = 0;

	ap_uint_512 pairs_word;
	
	ap_uint_512 pattern_word;
	ap_uint_512 text_word;

#ifdef FPGA_DEBUG
	readPairs(pairs, pi, AP_UINT_PTR(pairs_word));

	int pl = ap_uint_512_getHighByte(pairs_word, 0);
	int tl = ap_uint_512_getHighByte(pairs_word, 1);
#else
	readPairs(pairs, pi, AP_UINT_PTR(pairs_word));

	//printf("Long Word: ");
        //ap_uint_512_print(pairs_word);
        //printf("\n");

	//int pl = (pairs_word >> (512-8)) & 0xFF;
	//int tl = (pairs_word >> (512-16)) & 0xFF;

	int pl = ap_uint_512_getHighByte(pairs_word, 0);
	int tl = ap_uint_512_getHighByte(pairs_word, 1);

#endif

	

#ifdef FPGA_DEBUG
	printf("pattern len: %d\ttext len: %d\n", pl, tl);
#endif
	int alignedTextStart = 8 + 8 + (((pl * BASE_SIZE) + 7) / 8) * 8;

	ap_uint_512_shift_left(pairs_word, 8+8, AP_UINT_PTR(pattern_word));
	ap_uint_512_shift_left(pairs_word, alignedTextStart, AP_UINT_PTR(text_word));


#ifdef FPGA_DEBUG
	printf("T:   ");
	printSequence(text_word, tl);
	printf("\n");
	printf("P:   ");        
	printSequence(pattern_word, pl);
	printf("\n");
#endif

	/*printf("T:   ");
	ap_uint_512_print(text_word);
	printf("\n");
	printf("P:   ");        
	ap_uint_512_print(pattern_word);
	printf("\n");*/


	d = computeDistance(pattern_word,  pl, text_word,  tl);	// we just compare pattern
	
	return d;
}

/**
* we assume the sequence is left aligned to the 512 bits word, and stored in Most Significant Bit First order
* @param w
* @param offset
* @param len	length in bases
*/
void printSequence(ap_uint_512 w, int len)
{
	char sym[]={'A','C','G', 'T'};
	
	
	for (int i=0; i < len; i++)
	{
	   int last = 512 - 1 - (i * BASE_SIZE);
	   unsigned char isym = ap_uint_512_get_bit(w, last - 0 ) << 1 | ap_uint_512_get_bit(w, last -1);  
           printf("%c", sym[isym]);	   
	}

}
