#include "adapter_xilinx.cl"

#ifdef ENTRY_TYPE_2
	#define WORD_BITS 1024
	#define ap_uint_onesHigh ap_uint_1024_onesHigh
	#define ap_uint_printBinHigh ap_uint_1024_printBinHigh
	#define ap_uint_pop_count ap_uint_1024_pop_count
#else
	#define WORD_BITS 512
	#define ap_uint_onesHigh ap_uint_512_onesHigh
	#define ap_uint_printBinHigh ap_uint_512_printBinHigh
	#define ap_uint_pop_count ap_uint_512_pop_count
#endif


ap_uint<WORD_BITS> xorBases(ap_uint<WORD_BITS> p, ap_uint<WORD_BITS> t)
{
	ap_uint<WORD_BITS> ret;

	for (int i=0; i < WORD_BITS/BASE_SIZE; i++)
	{
#pragma HLS UNROLL

		int dstidx = WORD_BITS - 1 -i;
		int srcidx0 = WORD_BITS - 1 -i*2;
		int srcidx1 = WORD_BITS - 2 -i*2;

		int dst = (p[srcidx0] ^ t[srcidx0]) | (p[srcidx1] ^ t[srcidx1]);
		ret[dstidx] = dst;
	}

	return ret;
}


ap_uint<WORD_BITS> removeShortZeros(ap_uint<WORD_BITS> x)
{
	ap_uint<WORD_BITS> r = x;

	for (int i=0; i < WORD_BITS/BASE_SIZE; i++)
	{
#pragma HLS UNROLL
		int idx = 512 - 1 -i;
		// check for valid index, return 1 if invalid
		int xp1 = (idx < (WORD_BITS-1))? x.test(idx+1) : 1;
		int xp2 = (idx < (WORD_BITS-2))? x.test(idx+2) : 1;
		int xm1 = (idx > 0)? x.test(idx-1) : 1;
		int xm2 = (idx > 1)? x.test(idx-2) : 1;
		int dst = x[idx]  | (xp1 & xm1) | (xp2 & xm1) | (xp1 & xm2);
		r[idx] = dst;
	}

	return r;	
}


unsigned int shd(ap_uint<WORD_BITS> pattern,  int plen, ap_uint<WORD_BITS> text,  int tlen)
{
	ap_uint<WORD_BITS> acum;
	acum = ap_uint_onesHigh( plen);

#ifdef FPGA_DEBUG
	for (int i=-SHD_THRESHOLD; i <= SHD_THRESHOLD; i++)
	{
		ap_uint<WORD_BITS> shifted_pattern;
		if (i < 0)
		{
			shifted_pattern = pattern << (-i)*BASE_SIZE;
		}
		else if (i==0)
		{
			shifted_pattern = pattern;
		}
		else
		{
			// > 0
			shifted_pattern = pattern >> i*BASE_SIZE;
		}

		printf("shift [%2d] =", i);
		printSequence(shifted_pattern, plen);
		printf("\n");
	}
#endif

	for (int i=-SHD_THRESHOLD; i <= SHD_THRESHOLD; i++)
	{
	#pragma HLS UNROLL

		ap_uint<WORD_BITS> shifted_pattern;
		if (i < 0)
		{
			shifted_pattern = pattern << (-i)*BASE_SIZE;
		}
		else if (i==0)
		{
			shifted_pattern = pattern;
		}
		else
		{
			// > 0
			shifted_pattern = pattern >>  i*BASE_SIZE;
		}
		ap_uint<WORD_BITS> dist2;
		ap_uint<WORD_BITS> dist;
			
		//xorBases(shifted_pattern, text, AP_UINT_PTR(dist));
		dist2 = xorBases(shifted_pattern, text);
		dist = removeShortZeros(dist2);

#ifdef FPGA_DEBUG
		printf("shift [%2d] =", i);
		ap_uint_printBinHigh(dist, plen);
		printf("\n");
#endif

		acum = dist & acum;


#ifdef FPGA_DEBUG

		printf("acum       =");
		ap_uint_printBinHigh(acum, plen);
		printf("\n");
#endif
	}

	return ap_uint_pop_count(acum);
}



unsigned int computeDistance(ap_uint<WORD_BITS> pattern,  int plen, ap_uint<WORD_BITS> text,  int tlen)
{
	return shd(pattern,  plen, text,  plen);
}





