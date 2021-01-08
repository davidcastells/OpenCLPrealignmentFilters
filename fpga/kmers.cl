#include "../adapter.cl"


#define KMER_K	5


int get_bit(unsigned int w, int bit)
{
	return (w >> bit) & 1;
}

/**
* @param len length of the sequence in bases
*/
void printSequenceInInt(unsigned int w, int size, int len)
{
	char sym[]={'A','C','G', 'T'};
	
	
	for (int i=0; i < len; i++)
	{
	   int last = size - 1 - (i * BASE_SIZE);
	   unsigned char isym = get_bit(w, last - 0 ) << 1 | get_bit(w, last -1);  
           printf("%c", sym[isym]);	   
	}

}

/**
* A KMER will be surely < 32 bits , so we can store it in a single word
* @param bases 512 bitmap with the bases (in Big Endian order, the first base is in bits (511,510)
* @param offset starting offset (in bases)
*/
unsigned int getKmerIndex(ap_uint_512 bases, int offset)
{
	unsigned int r = 0;
	unsigned int mask = (1 << (KMER_K*BASE_SIZE)) -1;

	int highest_bit = 512 - 1 - BASE_SIZE * offset;
	int lowest_bit = highest_bit + 1 - KMER_K * BASE_SIZE;

	int wordidx0 = highest_bit / 32;
	int bitidx0 = highest_bit % 32;
  
	int wordidx1 = lowest_bit / 32;
	int bitidx1 = lowest_bit % 32;

	unsigned int high_word = ap_uint_512_getDword(bases, wordidx0);
	unsigned int low_word = ap_uint_512_getDword(bases, wordidx1);

	if (wordidx0 == wordidx1)
	{
		// the same word, just shift right to put lowest bit in position 0
		// w0 |     [h        l]       |
		// w1 |     [h        l]       |
  		r = (low_word >> bitidx1) & mask;
	}
	else
	{
		// different word, the high bit is in position bitidx0 and should be in KMER_K * BASE_SIZE -1 
		// w0 |                    [h  |
		// w1 |     l]                 |
		r = ((high_word << (KMER_K * BASE_SIZE -1 - bitidx0)) | (low_word >> bitidx1)) & mask;
	}

#ifdef FPGA_DEBUG
	printf("kmer[%d]=", offset);
	printSequenceInInt(r, KMER_K * BASE_SIZE, KMER_K);
	printf(" (%d)", r);
	printf("\n");
#endif

	return r;
}

/**
* WARNING ASSUMING KMER_K = 5
*/
unsigned int computeFingerprintDistance(ap_uint_1024 pattern, ap_uint_1024 text)
{
	unsigned int d = ap_uint_1024_manhattan_distance_a_and_not_b(pattern, text);
	
	return (d+KMER_K-1)/KMER_K;
}

void computeKmerFingerprint(ap_uint_512 bases, int len, ap_uint_1024p fingerprint)
{
	ap_uint_1024_zero(fingerprint);

#ifndef DISABLE_FINGERPRINT_LOOP_UNROLLING
	#pragma unroll
#endif
	for (int i=0; i < (len-KMER_K+1); i++)
    	{
        	unsigned int kmer_index = getKmerIndex(bases,i);
				
		// this is the same as above
		ap_uint_1024_or_bit(fingerprint, kmer_index, 1);
	}
}

unsigned int kmers(ap_uint_512 pattern, int plen, ap_uint_512 text, int tlen)
{
	ap_uint_1024 pattern_kmer_fingerprint;
	ap_uint_1024 text_kmer_fingerprint;

	computeKmerFingerprint(pattern, plen, AP_UINT_PTR(pattern_kmer_fingerprint));
	computeKmerFingerprint(text, tlen, AP_UINT_PTR(text_kmer_fingerprint));

#ifdef FPGA_DEBUG
	printf("P-f=");
	ap_uint_1024_printBinHigh(pattern_kmer_fingerprint, 1024);
	printf("\n");
	printf("T-f=");
	ap_uint_1024_printBinHigh(text_kmer_fingerprint, 1024);
	printf("\n");
#endif

	unsigned int d = computeFingerprintDistance(pattern_kmer_fingerprint, text_kmer_fingerprint);

	return d;
}



unsigned int computeDistance(ap_uint_512 pattern,  int plen, ap_uint_512 text, int tlen)
{
	return kmers(pattern, plen, text,  plen);
}

