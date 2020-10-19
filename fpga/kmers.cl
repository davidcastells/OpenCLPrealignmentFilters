#include "adapter.cl"


#define KMER_K	5


int get_bit(unsigned int w, int bit)
{
	return (w >> bit) & 1;
}

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

unsigned int getKmerIndex(ap_uint_512 bases, int offset)
{
	unsigned int r = 0;

	for (int i = 0; i < KMER_K*BASE_SIZE; i++)
	{
		int idx = offset*BASE_SIZE + i;

		r = (r << 1) | ap_uint_512_get_bit_high(bases, idx);
	}

	//printf("kmer [%05X] = ", r);
	//printSequenceInInt(r, 10, KMER_K);
	//printf("\n");

	return r;
}

/**
* WARNING ASSUMING KMER_K = 5
*/
unsigned int computeFingerprintDistance(ap_uint_1024 pattern, ap_uint_1024 text)
{
	unsigned int d = 0;

	for (int i=0; i < 1024; i++)
	{
		int bp = ap_uint_1024_get_bit(pattern, i);
		int bt = ap_uint_1024_get_bit(text, i);

		if (bp & ~bt)
			d++;	
	}

	return (d+KMER_K-1)/KMER_K;
}

void computeKmerFingerprint(ap_uint_512 bases, int len, ap_uint_1024p fingerprint)
{
	ap_uint_1024_zero(fingerprint);

	for (int i=0; i < (len-KMER_K+1); i++)
    	{
        	unsigned int kmer_index = getKmerIndex(bases,i);
		//ap_uint_1024 decoded_kmer;
		//ap_uint_1024_decode(kmer_index, KMER_K*2, AP_UINT_PTR(decoded_kmer));
		//ap_uint_1024_or_self(fingerprint, decoded_kmer);
		
		// this is the same as above
		ap_uint_1024_or_bit(AP_UINT_PTR(fingerprint), kmer_index, 1);
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
#ifdef PATTERN_LEN
	return kmers(pattern, PATTERN_LEN, text,  TEXT_LEN);
#else
	return kmers(pattern, plen, text,  plen);
#endif
}

