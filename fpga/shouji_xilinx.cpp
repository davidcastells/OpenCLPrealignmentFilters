#include "adapter_xilinx.cl"

#ifdef ENTRY_TYPE_2
        #define WORD_BITS 1024
        #define ap_uint_onesHigh ap_uint_1024_onesHigh
        #define ap_uint_printBinHigh ap_uint_1024_printBinHigh
        #define ap_uint_pop_count ap_uint_1024_pop_count
	#define ap_uint_range_high_32 ap_uint_1024_range_high_32
#else
        #define WORD_BITS 512
        #define ap_uint_onesHigh ap_uint_512_onesHigh
        #define ap_uint_printBinHigh ap_uint_512_printBinHigh
        #define ap_uint_pop_count ap_uint_512_pop_count
	#define ap_uint_range_high_32 ap_uint_512_range_high_32

#endif



#ifndef SHOUJI_WINDOW_SIZE
#define SHOUJI_WINDOW_SIZE	4
#endif


unsigned int countZeros(unsigned int xpart, int size);


unsigned int ap_uint_1024_range_high_32(ap_uint<WORD_BITS> w, int from, int size)
{
	return w(1024-1-from, 1024-1-from-size);
}

unsigned int ap_uint_512_range_high_32(ap_uint<WORD_BITS> w, int from, int size)
{
	return w(512-1-from, 512-1-from-size);
}


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




unsigned int shouji(ap_uint<WORD_BITS> pattern,  int plen, ap_uint<WORD_BITS> text,  int tlen)
{
	ap_uint<WORD_BITS> acum = 0;

#ifdef FPGA_DEBUG
	for (int i=-SHOUJI_THRESHOLD; i <= SHOUJI_THRESHOLD; i++)
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

	ap_uint<WORD_BITS> dist[SHOUJI_THRESHOLD*2+1];

	for (int i=-SHOUJI_THRESHOLD; i <= SHOUJI_THRESHOLD; i++)
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
			

		dist[i+SHOUJI_THRESHOLD] = xorBases(shifted_pattern, text);
		

#ifdef FPGA_DEBUG
		printf("shift [%2d] =", i);
		ap_uint_printBinHigh(dist[i+SHOUJI_THRESHOLD], plen);
		printf("\n");
#endif
	}



	
	for (int k=0; k < plen - SHOUJI_WINDOW_SIZE ; k++)
	{
#pragma HLS UNROLL
		unsigned int maxz = 0;
		int cb = 1;

		for (int i=-SHOUJI_THRESHOLD; i <= SHOUJI_THRESHOLD; i++)
		{
			unsigned int xpart = ap_uint_range_high_32(dist[i], k, SHOUJI_WINDOW_SIZE);

#ifdef FPGA_DEBUG
			printf("shift [%2d] =", i);
			ap_uint_printBinHigh(dist, plen);
			printf("\n");

			printf("xpart (%d << %d) ", < % printf("%d",k); % >, i);
			printWordBin(xpart, SHOUJI_WINDOW_SIZE);
			printf("\n");
#endif

			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				cb = xpart_hb;
			}
		}
		

		//ap_uint_1024_or_high_bit(AP_UINT_PTR(acum), <%printf("%d",k);%>, cb);
		acum |= (cb) ? 1 << k : 0;
	}

#ifdef FPGA_DEBUG
	printf("acum       =");
	ap_uint_1024_printBinHigh(acum, plen);
	printf("\n");
#endif

	return ap_uint_pop_count(acum);
}



unsigned int computeDistance(ap_uint<WORD_BITS> pattern,  int plen, ap_uint<WORD_BITS> text,  int tlen)
{
	return shouji(pattern,  plen, text,  plen);
}





void printWordBin(unsigned int x, unsigned int size)
{
	for (int i=0; i < size; i++)
	{
		int v = (x >> size-1-i) & 0x1;
		printf("%d", v);
	}
}





unsigned int countZeros(unsigned int xpart, int size)
{
#if (SHOUJI_WINDOW_SIZE == 4)
	int b0 = (xpart >> 0) & 0x1;
	int b1 = (xpart >> 1) & 0x1;
	int b2 = (xpart >> 2) & 0x1;
	int b3 = (xpart >> 3) & 0x1;
	int nb0 = b0 ^ 0x1;
	int nb1 = b1 ^ 0x1;
	int nb2 = b2 ^ 0x1;
	int nb3 = b3 ^ 0x1;

	return nb0 + nb1 + nb2 + nb3;
#else
	#error We only support Shouji Window Size = 4 by now
#endif
}



