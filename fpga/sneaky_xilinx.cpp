#include "adapter_xilinx.cl"

#ifdef ENTRY_TYPE_2
	#define WORD_BITS 1024
	#define ap_uint_onesHigh ap_uint_1024_onesHigh
	#define ap_uint_printBinHigh ap_uint_1024_printBinHigh
	#define ap_uint_pop_count ap_uint_1024_pop_count
	#define ap_uint_range ap_uint_1024_range
#else
	#define WORD_BITS 512
	#define ap_uint_onesHigh ap_uint_512_onesHigh
	#define ap_uint_printBinHigh ap_uint_512_printBinHigh
	#define ap_uint_pop_count ap_uint_512_pop_count
	#define ap_uint_range ap_uint_512_range
#endif


#ifndef SNEAKY_THRESHOLD
#define SNEAKY_THRESHOLD	3
#endif


#ifndef SNEAKY_WINDOW_SIZE
#define SNEAKY_WINDOW_SIZE	8
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


void printBin32(unsigned int r, int size);

/**
* A KMER will be surely < 32 bits , so we can store it in a single word
* @param bases 512 bitmap with the bases (in Big Endian order, the first base is in bits (511,510)
* @param offset starting offset (in bases)
*/
unsigned int ap_uint_512_range(ap_uint<512> bases, int start, int end)
{
	unsigned int r = 0;
	unsigned int size = end-start;
	unsigned int mask = (1 << (size)) -1;

	int highest_bit = 512 - 1 - start;
	int lowest_bit = 512 - 1 - end;

	return bases(highest_bit, lowest_bit);
}


unsigned int ap_uint_1024_range(ap_uint<1024> bases, int start, int end)
{
	unsigned int r = 0;
	unsigned int size = end-start;
	unsigned int mask = (1 << (size)) -1;

	int highest_bit = 1024 - 1 - start;
	int lowest_bit = 1024 - 1 - end;

	return bases(highest_bit, lowest_bit);
}


unsigned int fastclz(unsigned int v)
{
 int x = (0 != (v >> 16)) * 16;
 x += (0 != (v >> (x + 8))) * 8;
 x += (0 != (v >> (x + 4))) * 4;
 x += (0 != (v >> (x + 2))) * 2;
 x += (0 != (v >> (x + 1)));
 x += (0 != (v >> x));
 return 32 - x;
}

/**
* Count the number of leading zeros
*/
unsigned int CLZ_32(unsigned int part, int size)
{
	int c = fastclz(part);

	return c  -(32-size);	
}

/**
* Print a number of 32 bits in binary
*/
void printBin32(unsigned int r, int size)
{
	unsigned fbmask = 1 << (size-1);

	for (int i=0; i < size; i++)
	{
		printf("%d", (r & fbmask)?1:0);
		r = r << 1;
	} 
}



unsigned int LeftOnes(unsigned int x)
{
	unsigned int r = 0;
	
	for (int i=0; i < 32; i++)
	{
#pragma HLS UNROLL
		unsigned int b= ((x >> i) > 0) ? 1 : 0;
				
		r |= ((b&1) << i);		// bits in LSB order
	}
	
	return r;
}

unsigned int sneaky(ap_uint<WORD_BITS> pattern,  int plen, ap_uint<WORD_BITS> text,  int tlen)
{
	unsigned int EE = 0;

	for (int w=0; w < plen/SNEAKY_WINDOW_SIZE; w++)
	{
		
		if (w < plen/SNEAKY_WINDOW_SIZE)
        {
#pragma HLS UNROLL
		unsigned int kstart = w*SNEAKY_WINDOW_SIZE;
		unsigned int kend = (w+1) * SNEAKY_WINDOW_SIZE;

		unsigned int XP[SNEAKY_THRESHOLD*2+1];
		
		for (int s=-SNEAKY_THRESHOLD; s <= SNEAKY_THRESHOLD; s++)
		{
#pragma HLS UNROLL
			ap_uint<WORD_BITS> shifted_pattern;
			if (s < 0)
			{
				shifted_pattern = pattern << (-s)*BASE_SIZE;
			}
			else if (s==0)
			{
				shifted_pattern = pattern;
			}
			else
			{
				// > 0
				shifted_pattern = pattern >> s*BASE_SIZE;
			}

			ap_uint<512> dist = xorBases(shifted_pattern, text);

			XP[s+SNEAKY_THRESHOLD] = ap_uint_range(dist, kstart, kend);
		}
		
		unsigned int LZ[8];
		
		for (int i=0; i<8; i++)
		{
#pragma HLS UNROLL
			unsigned int mask = (1 << (8-i)) -1;
			unsigned int AC = mask;
			
			
			for (int s=0; s < 2*SNEAKY_THRESHOLD+1; s++)
			{
#pragma HLS UNROLL

				unsigned int CX = LeftOnes(XP[s] & mask);
				AC = AC & CX;
			}
			
			LZ[i] = CLZ_32(AC, 8-i);
		}
		
		unsigned int EDITS[8];
		
		// Level 0 (1 bit)
		if (LZ[0] == 0)
			EDITS[0] = 1;
		else
			EDITS[0] = 0;
		
		// Level 1 (2 bits)
		if (LZ[1] == 0)
			EDITS[1] = EDITS[0] + 1;
		else if (LZ[1] == 1)
			EDITS[1] = 1;
		else
			EDITS[1] = 0;
		
		// Level 2
		if (LZ[2] == 0)
			EDITS[2] = EDITS[1] + 1;
		else if (LZ[2] == 1)
			EDITS[2] = EDITS[0] + 1;
		else if (LZ[2] == 2)
			EDITS[2] = 1;
		else
			EDITS[2] = 0;
		
		// Level 3
		if (LZ[3] == 0)
			EDITS[3] = EDITS[2] + 1;
		else if (LZ[3] == 1)
			EDITS[3] = EDITS[1] + 1;
		else if (LZ[3] == 2)
			EDITS[3] = EDITS[0] + 1;
		else if (LZ[3] == 3)
			EDITS[3] = 1;
		else 
			EDITS[3] = 0;
		
		// Level 4
		if (LZ[4] == 0)
			EDITS[4] = EDITS[3] +1;
		else if (LZ[4] == 1)
			EDITS[4] = EDITS[2] + 1;
		else if (LZ[4] == 2)
			EDITS[4] = EDITS[1] + 1;
		else if (LZ[4] == 3)
			EDITS[4] = EDITS[0] + 1;
		else if (LZ[4] == 4)
			EDITS[4] = 1;
		else
			EDITS[4] = 0;
		
		// Level 5
		if (LZ[5] == 0)
			EDITS[5] = EDITS[4] +1;
		else if (LZ[5] == 1)
			EDITS[5] = EDITS[3] +1;
		else if (LZ[5] == 2)
			EDITS[5] = EDITS[2] +1;
		else if (LZ[5] == 3)
			EDITS[5] = EDITS[1] +1;
		else if (LZ[5] == 4)
			EDITS[5] = EDITS[0] +1;
		else if (LZ[5] == 5)
			EDITS[5] = 1;
		else
			EDITS[5] = 0;
		
		// Level 6
		if (LZ[6] == 0)
			EDITS[6] = EDITS[5] +1;
		else if (LZ[6] == 1)
			EDITS[6] = EDITS[4] +1;
		else if (LZ[6] == 2)
			EDITS[6] = EDITS[3] +1;
		else if (LZ[6] == 3)
			EDITS[6] = EDITS[2] +1;
		else if (LZ[6] == 4)
			EDITS[6] = EDITS[1] +1;
		else if (LZ[6] == 5)
			EDITS[6] = EDITS[0] +1;
		else if (LZ[6] == 6)
			EDITS[6] = 1;
		else
			EDITS[6] = 0;
		
		// Level 7
		if (LZ[7] == 0)
			EDITS[7] = EDITS[6] +1;
		else if (LZ[7] == 1)
			EDITS[7] = EDITS[5] +1;
		else if (LZ[7] == 2)
			EDITS[7] = EDITS[4] +1;
		else if (LZ[7] == 3)
			EDITS[7] = EDITS[3] +1;
		else if (LZ[7] == 4)
			EDITS[7] = EDITS[2] +1;
		else if (LZ[7] == 5)
			EDITS[7] = EDITS[1] +1;
		else if (LZ[7] == 6)
			EDITS[7] = EDITS[0] +1;
		else if (LZ[7] == 7)
			EDITS[7] = 1;
		else
			EDITS[7] = 0;
		
		
		EE = EE + EDITS[7];
	}
	}

	return EE;
}



unsigned int computeDistance(ap_uint<WORD_BITS> pattern,  int plen, ap_uint<WORD_BITS> text,  int tlen)
{
	return sneaky(pattern,  plen, text,  plen);
}



