#include "adapter.cl"

#ifndef SNEAKY_THRESHOLD
#define SNEAKY_THRESHOLD	3
#endif


#ifndef SNEAKY_WINDOW_SIZE
#define SNEAKY_WINDOW_SIZE	8
#endif




void xorBases(ap_uint_512 p, ap_uint_512 t, ap_uint_512p r);
void printBin32(unsigned int r, int size);

/**
* A KMER will be surely < 32 bits , so we can store it in a single word
* @param bases 512 bitmap with the bases (in Big Endian order, the first base is in bits (511,510)
* @param offset starting offset (in bases)
*/
unsigned int ap_uint_512_range(ap_uint_512 bases, int start, int end)
{
	unsigned int r = 0;
	unsigned int size = end-start;
	unsigned int mask = (1 << (size)) -1;

	int highest_bit = 512 - 1 - start;
	int lowest_bit = 512 - 1 - end;

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
		// different word, the high bit is in position bitidx0 and should be in size -1 
		// w0 |                    [h  |
		// w1 |     l]                 |
		r = ((high_word << (size -1 - bitidx0)) | (low_word >> bitidx1)) & mask;
	}

#ifdef FPGA_DEBUG
	printf("range[%d,%d]=", start, end, r);
	printBin32(r, size);
	printf("\n");
#endif

	return r;
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
	
	#pragma unroll
	for (int i=0; i < 32; i++)
	{
		unsigned int b= ((x >> i) > 0) ? 1 : 0;
				
		r |= ((b&1) << i);		// bits in LSB order
	}
	
	return r;
}

unsigned int sneaky(ap_uint_512 pattern,  int plen, ap_uint_512 text,  int tlen)
{
	unsigned int EE = 0;

//#ifdef PATTERN_LENGTH 
//#pragma unroll
//#endif
	//#pragma unroll
	
	{
		int w=0;
		if (w < plen/SNEAKY_WINDOW_SIZE)
        {
		unsigned int kstart = w*SNEAKY_WINDOW_SIZE;
		unsigned int kend = (w+1) * SNEAKY_WINDOW_SIZE;

		unsigned int XP[SNEAKY_THRESHOLD*2+1];
		
		#pragma unroll
		for (int s=-SNEAKY_THRESHOLD; s <= SNEAKY_THRESHOLD; s++)
		{
			ap_uint_512 shifted_pattern;
			if (s < 0)
			{
				ap_uint_512_shift_left(pattern, (-s), AP_UINT_PTR(shifted_pattern));
			}
			else if (s==0)
			{
				ap_uint_512_set(AP_UINT_PTR(shifted_pattern), pattern);
			}
			else
			{
				// > 0
				ap_uint_512_shift_right(pattern, s, AP_UINT_PTR(shifted_pattern));
			}

			ap_uint_512 dist;
		
			xorBases(shifted_pattern, text, AP_UINT_PTR(dist));

			XP[s+SNEAKY_THRESHOLD] = ap_uint_512_range(dist, kstart, kend);
		}
		
		unsigned int LZ[8];
		
		#pragma unroll
		for (int i=0; i<8; i++)
		{
			unsigned int mask = (1 << (8-i)) -1;
			unsigned int AC = mask;
			
			
			#pragma unroll
			for (int s=0; s < 2*SNEAKY_THRESHOLD+1; s++)
			{
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
	{
		int w=1;
		if (w < plen/SNEAKY_WINDOW_SIZE)
        {
		unsigned int kstart = w*SNEAKY_WINDOW_SIZE;
		unsigned int kend = (w+1) * SNEAKY_WINDOW_SIZE;

		unsigned int XP[SNEAKY_THRESHOLD*2+1];
		
		#pragma unroll
		for (int s=-SNEAKY_THRESHOLD; s <= SNEAKY_THRESHOLD; s++)
		{
			ap_uint_512 shifted_pattern;
			if (s < 0)
			{
				ap_uint_512_shift_left(pattern, (-s), AP_UINT_PTR(shifted_pattern));
			}
			else if (s==0)
			{
				ap_uint_512_set(AP_UINT_PTR(shifted_pattern), pattern);
			}
			else
			{
				// > 0
				ap_uint_512_shift_right(pattern, s, AP_UINT_PTR(shifted_pattern));
			}

			ap_uint_512 dist;
		
			xorBases(shifted_pattern, text, AP_UINT_PTR(dist));

			XP[s+SNEAKY_THRESHOLD] = ap_uint_512_range(dist, kstart, kend);
		}
		
		unsigned int LZ[8];
		
		#pragma unroll
		for (int i=0; i<8; i++)
		{
			unsigned int mask = (1 << (8-i)) -1;
			unsigned int AC = mask;
			
			
			#pragma unroll
			for (int s=0; s < 2*SNEAKY_THRESHOLD+1; s++)
			{
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
	{
		int w=2;
		if (w < plen/SNEAKY_WINDOW_SIZE)
        {
		unsigned int kstart = w*SNEAKY_WINDOW_SIZE;
		unsigned int kend = (w+1) * SNEAKY_WINDOW_SIZE;

		unsigned int XP[SNEAKY_THRESHOLD*2+1];
		
		#pragma unroll
		for (int s=-SNEAKY_THRESHOLD; s <= SNEAKY_THRESHOLD; s++)
		{
			ap_uint_512 shifted_pattern;
			if (s < 0)
			{
				ap_uint_512_shift_left(pattern, (-s), AP_UINT_PTR(shifted_pattern));
			}
			else if (s==0)
			{
				ap_uint_512_set(AP_UINT_PTR(shifted_pattern), pattern);
			}
			else
			{
				// > 0
				ap_uint_512_shift_right(pattern, s, AP_UINT_PTR(shifted_pattern));
			}

			ap_uint_512 dist;
		
			xorBases(shifted_pattern, text, AP_UINT_PTR(dist));

			XP[s+SNEAKY_THRESHOLD] = ap_uint_512_range(dist, kstart, kend);
		}
		
		unsigned int LZ[8];
		
		#pragma unroll
		for (int i=0; i<8; i++)
		{
			unsigned int mask = (1 << (8-i)) -1;
			unsigned int AC = mask;
			
			
			#pragma unroll
			for (int s=0; s < 2*SNEAKY_THRESHOLD+1; s++)
			{
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
	{
		int w=3;
		if (w < plen/SNEAKY_WINDOW_SIZE)
        {
		unsigned int kstart = w*SNEAKY_WINDOW_SIZE;
		unsigned int kend = (w+1) * SNEAKY_WINDOW_SIZE;

		unsigned int XP[SNEAKY_THRESHOLD*2+1];
		
		#pragma unroll
		for (int s=-SNEAKY_THRESHOLD; s <= SNEAKY_THRESHOLD; s++)
		{
			ap_uint_512 shifted_pattern;
			if (s < 0)
			{
				ap_uint_512_shift_left(pattern, (-s), AP_UINT_PTR(shifted_pattern));
			}
			else if (s==0)
			{
				ap_uint_512_set(AP_UINT_PTR(shifted_pattern), pattern);
			}
			else
			{
				// > 0
				ap_uint_512_shift_right(pattern, s, AP_UINT_PTR(shifted_pattern));
			}

			ap_uint_512 dist;
		
			xorBases(shifted_pattern, text, AP_UINT_PTR(dist));

			XP[s+SNEAKY_THRESHOLD] = ap_uint_512_range(dist, kstart, kend);
		}
		
		unsigned int LZ[8];
		
		#pragma unroll
		for (int i=0; i<8; i++)
		{
			unsigned int mask = (1 << (8-i)) -1;
			unsigned int AC = mask;
			
			
			#pragma unroll
			for (int s=0; s < 2*SNEAKY_THRESHOLD+1; s++)
			{
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
	{
		int w=4;
		if (w < plen/SNEAKY_WINDOW_SIZE)
        {
		unsigned int kstart = w*SNEAKY_WINDOW_SIZE;
		unsigned int kend = (w+1) * SNEAKY_WINDOW_SIZE;

		unsigned int XP[SNEAKY_THRESHOLD*2+1];
		
		#pragma unroll
		for (int s=-SNEAKY_THRESHOLD; s <= SNEAKY_THRESHOLD; s++)
		{
			ap_uint_512 shifted_pattern;
			if (s < 0)
			{
				ap_uint_512_shift_left(pattern, (-s), AP_UINT_PTR(shifted_pattern));
			}
			else if (s==0)
			{
				ap_uint_512_set(AP_UINT_PTR(shifted_pattern), pattern);
			}
			else
			{
				// > 0
				ap_uint_512_shift_right(pattern, s, AP_UINT_PTR(shifted_pattern));
			}

			ap_uint_512 dist;
		
			xorBases(shifted_pattern, text, AP_UINT_PTR(dist));

			XP[s+SNEAKY_THRESHOLD] = ap_uint_512_range(dist, kstart, kend);
		}
		
		unsigned int LZ[8];
		
		#pragma unroll
		for (int i=0; i<8; i++)
		{
			unsigned int mask = (1 << (8-i)) -1;
			unsigned int AC = mask;
			
			
			#pragma unroll
			for (int s=0; s < 2*SNEAKY_THRESHOLD+1; s++)
			{
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
	{
		int w=5;
		if (w < plen/SNEAKY_WINDOW_SIZE)
        {
		unsigned int kstart = w*SNEAKY_WINDOW_SIZE;
		unsigned int kend = (w+1) * SNEAKY_WINDOW_SIZE;

		unsigned int XP[SNEAKY_THRESHOLD*2+1];
		
		#pragma unroll
		for (int s=-SNEAKY_THRESHOLD; s <= SNEAKY_THRESHOLD; s++)
		{
			ap_uint_512 shifted_pattern;
			if (s < 0)
			{
				ap_uint_512_shift_left(pattern, (-s), AP_UINT_PTR(shifted_pattern));
			}
			else if (s==0)
			{
				ap_uint_512_set(AP_UINT_PTR(shifted_pattern), pattern);
			}
			else
			{
				// > 0
				ap_uint_512_shift_right(pattern, s, AP_UINT_PTR(shifted_pattern));
			}

			ap_uint_512 dist;
		
			xorBases(shifted_pattern, text, AP_UINT_PTR(dist));

			XP[s+SNEAKY_THRESHOLD] = ap_uint_512_range(dist, kstart, kend);
		}
		
		unsigned int LZ[8];
		
		#pragma unroll
		for (int i=0; i<8; i++)
		{
			unsigned int mask = (1 << (8-i)) -1;
			unsigned int AC = mask;
			
			
			#pragma unroll
			for (int s=0; s < 2*SNEAKY_THRESHOLD+1; s++)
			{
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
	{
		int w=6;
		if (w < plen/SNEAKY_WINDOW_SIZE)
        {
		unsigned int kstart = w*SNEAKY_WINDOW_SIZE;
		unsigned int kend = (w+1) * SNEAKY_WINDOW_SIZE;

		unsigned int XP[SNEAKY_THRESHOLD*2+1];
		
		#pragma unroll
		for (int s=-SNEAKY_THRESHOLD; s <= SNEAKY_THRESHOLD; s++)
		{
			ap_uint_512 shifted_pattern;
			if (s < 0)
			{
				ap_uint_512_shift_left(pattern, (-s), AP_UINT_PTR(shifted_pattern));
			}
			else if (s==0)
			{
				ap_uint_512_set(AP_UINT_PTR(shifted_pattern), pattern);
			}
			else
			{
				// > 0
				ap_uint_512_shift_right(pattern, s, AP_UINT_PTR(shifted_pattern));
			}

			ap_uint_512 dist;
		
			xorBases(shifted_pattern, text, AP_UINT_PTR(dist));

			XP[s+SNEAKY_THRESHOLD] = ap_uint_512_range(dist, kstart, kend);
		}
		
		unsigned int LZ[8];
		
		#pragma unroll
		for (int i=0; i<8; i++)
		{
			unsigned int mask = (1 << (8-i)) -1;
			unsigned int AC = mask;
			
			
			#pragma unroll
			for (int s=0; s < 2*SNEAKY_THRESHOLD+1; s++)
			{
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
	{
		int w=7;
		if (w < plen/SNEAKY_WINDOW_SIZE)
        {
		unsigned int kstart = w*SNEAKY_WINDOW_SIZE;
		unsigned int kend = (w+1) * SNEAKY_WINDOW_SIZE;

		unsigned int XP[SNEAKY_THRESHOLD*2+1];
		
		#pragma unroll
		for (int s=-SNEAKY_THRESHOLD; s <= SNEAKY_THRESHOLD; s++)
		{
			ap_uint_512 shifted_pattern;
			if (s < 0)
			{
				ap_uint_512_shift_left(pattern, (-s), AP_UINT_PTR(shifted_pattern));
			}
			else if (s==0)
			{
				ap_uint_512_set(AP_UINT_PTR(shifted_pattern), pattern);
			}
			else
			{
				// > 0
				ap_uint_512_shift_right(pattern, s, AP_UINT_PTR(shifted_pattern));
			}

			ap_uint_512 dist;
		
			xorBases(shifted_pattern, text, AP_UINT_PTR(dist));

			XP[s+SNEAKY_THRESHOLD] = ap_uint_512_range(dist, kstart, kend);
		}
		
		unsigned int LZ[8];
		
		#pragma unroll
		for (int i=0; i<8; i++)
		{
			unsigned int mask = (1 << (8-i)) -1;
			unsigned int AC = mask;
			
			
			#pragma unroll
			for (int s=0; s < 2*SNEAKY_THRESHOLD+1; s++)
			{
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
	{
		int w=8;
		if (w < plen/SNEAKY_WINDOW_SIZE)
        {
		unsigned int kstart = w*SNEAKY_WINDOW_SIZE;
		unsigned int kend = (w+1) * SNEAKY_WINDOW_SIZE;

		unsigned int XP[SNEAKY_THRESHOLD*2+1];
		
		#pragma unroll
		for (int s=-SNEAKY_THRESHOLD; s <= SNEAKY_THRESHOLD; s++)
		{
			ap_uint_512 shifted_pattern;
			if (s < 0)
			{
				ap_uint_512_shift_left(pattern, (-s), AP_UINT_PTR(shifted_pattern));
			}
			else if (s==0)
			{
				ap_uint_512_set(AP_UINT_PTR(shifted_pattern), pattern);
			}
			else
			{
				// > 0
				ap_uint_512_shift_right(pattern, s, AP_UINT_PTR(shifted_pattern));
			}

			ap_uint_512 dist;
		
			xorBases(shifted_pattern, text, AP_UINT_PTR(dist));

			XP[s+SNEAKY_THRESHOLD] = ap_uint_512_range(dist, kstart, kend);
		}
		
		unsigned int LZ[8];
		
		#pragma unroll
		for (int i=0; i<8; i++)
		{
			unsigned int mask = (1 << (8-i)) -1;
			unsigned int AC = mask;
			
			
			#pragma unroll
			for (int s=0; s < 2*SNEAKY_THRESHOLD+1; s++)
			{
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
	{
		int w=9;
		if (w < plen/SNEAKY_WINDOW_SIZE)
        {
		unsigned int kstart = w*SNEAKY_WINDOW_SIZE;
		unsigned int kend = (w+1) * SNEAKY_WINDOW_SIZE;

		unsigned int XP[SNEAKY_THRESHOLD*2+1];
		
		#pragma unroll
		for (int s=-SNEAKY_THRESHOLD; s <= SNEAKY_THRESHOLD; s++)
		{
			ap_uint_512 shifted_pattern;
			if (s < 0)
			{
				ap_uint_512_shift_left(pattern, (-s), AP_UINT_PTR(shifted_pattern));
			}
			else if (s==0)
			{
				ap_uint_512_set(AP_UINT_PTR(shifted_pattern), pattern);
			}
			else
			{
				// > 0
				ap_uint_512_shift_right(pattern, s, AP_UINT_PTR(shifted_pattern));
			}

			ap_uint_512 dist;
		
			xorBases(shifted_pattern, text, AP_UINT_PTR(dist));

			XP[s+SNEAKY_THRESHOLD] = ap_uint_512_range(dist, kstart, kend);
		}
		
		unsigned int LZ[8];
		
		#pragma unroll
		for (int i=0; i<8; i++)
		{
			unsigned int mask = (1 << (8-i)) -1;
			unsigned int AC = mask;
			
			
			#pragma unroll
			for (int s=0; s < 2*SNEAKY_THRESHOLD+1; s++)
			{
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
	{
		int w=10;
		if (w < plen/SNEAKY_WINDOW_SIZE)
        {
		unsigned int kstart = w*SNEAKY_WINDOW_SIZE;
		unsigned int kend = (w+1) * SNEAKY_WINDOW_SIZE;

		unsigned int XP[SNEAKY_THRESHOLD*2+1];
		
		#pragma unroll
		for (int s=-SNEAKY_THRESHOLD; s <= SNEAKY_THRESHOLD; s++)
		{
			ap_uint_512 shifted_pattern;
			if (s < 0)
			{
				ap_uint_512_shift_left(pattern, (-s), AP_UINT_PTR(shifted_pattern));
			}
			else if (s==0)
			{
				ap_uint_512_set(AP_UINT_PTR(shifted_pattern), pattern);
			}
			else
			{
				// > 0
				ap_uint_512_shift_right(pattern, s, AP_UINT_PTR(shifted_pattern));
			}

			ap_uint_512 dist;
		
			xorBases(shifted_pattern, text, AP_UINT_PTR(dist));

			XP[s+SNEAKY_THRESHOLD] = ap_uint_512_range(dist, kstart, kend);
		}
		
		unsigned int LZ[8];
		
		#pragma unroll
		for (int i=0; i<8; i++)
		{
			unsigned int mask = (1 << (8-i)) -1;
			unsigned int AC = mask;
			
			
			#pragma unroll
			for (int s=0; s < 2*SNEAKY_THRESHOLD+1; s++)
			{
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
	{
		int w=11;
		if (w < plen/SNEAKY_WINDOW_SIZE)
        {
		unsigned int kstart = w*SNEAKY_WINDOW_SIZE;
		unsigned int kend = (w+1) * SNEAKY_WINDOW_SIZE;

		unsigned int XP[SNEAKY_THRESHOLD*2+1];
		
		#pragma unroll
		for (int s=-SNEAKY_THRESHOLD; s <= SNEAKY_THRESHOLD; s++)
		{
			ap_uint_512 shifted_pattern;
			if (s < 0)
			{
				ap_uint_512_shift_left(pattern, (-s), AP_UINT_PTR(shifted_pattern));
			}
			else if (s==0)
			{
				ap_uint_512_set(AP_UINT_PTR(shifted_pattern), pattern);
			}
			else
			{
				// > 0
				ap_uint_512_shift_right(pattern, s, AP_UINT_PTR(shifted_pattern));
			}

			ap_uint_512 dist;
		
			xorBases(shifted_pattern, text, AP_UINT_PTR(dist));

			XP[s+SNEAKY_THRESHOLD] = ap_uint_512_range(dist, kstart, kend);
		}
		
		unsigned int LZ[8];
		
		#pragma unroll
		for (int i=0; i<8; i++)
		{
			unsigned int mask = (1 << (8-i)) -1;
			unsigned int AC = mask;
			
			
			#pragma unroll
			for (int s=0; s < 2*SNEAKY_THRESHOLD+1; s++)
			{
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
	{
		int w=12;
		if (w < plen/SNEAKY_WINDOW_SIZE)
        {
		unsigned int kstart = w*SNEAKY_WINDOW_SIZE;
		unsigned int kend = (w+1) * SNEAKY_WINDOW_SIZE;

		unsigned int XP[SNEAKY_THRESHOLD*2+1];
		
		#pragma unroll
		for (int s=-SNEAKY_THRESHOLD; s <= SNEAKY_THRESHOLD; s++)
		{
			ap_uint_512 shifted_pattern;
			if (s < 0)
			{
				ap_uint_512_shift_left(pattern, (-s), AP_UINT_PTR(shifted_pattern));
			}
			else if (s==0)
			{
				ap_uint_512_set(AP_UINT_PTR(shifted_pattern), pattern);
			}
			else
			{
				// > 0
				ap_uint_512_shift_right(pattern, s, AP_UINT_PTR(shifted_pattern));
			}

			ap_uint_512 dist;
		
			xorBases(shifted_pattern, text, AP_UINT_PTR(dist));

			XP[s+SNEAKY_THRESHOLD] = ap_uint_512_range(dist, kstart, kend);
		}
		
		unsigned int LZ[8];
		
		#pragma unroll
		for (int i=0; i<8; i++)
		{
			unsigned int mask = (1 << (8-i)) -1;
			unsigned int AC = mask;
			
			
			#pragma unroll
			for (int s=0; s < 2*SNEAKY_THRESHOLD+1; s++)
			{
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
	{
		int w=13;
		if (w < plen/SNEAKY_WINDOW_SIZE)
        {
		unsigned int kstart = w*SNEAKY_WINDOW_SIZE;
		unsigned int kend = (w+1) * SNEAKY_WINDOW_SIZE;

		unsigned int XP[SNEAKY_THRESHOLD*2+1];
		
		#pragma unroll
		for (int s=-SNEAKY_THRESHOLD; s <= SNEAKY_THRESHOLD; s++)
		{
			ap_uint_512 shifted_pattern;
			if (s < 0)
			{
				ap_uint_512_shift_left(pattern, (-s), AP_UINT_PTR(shifted_pattern));
			}
			else if (s==0)
			{
				ap_uint_512_set(AP_UINT_PTR(shifted_pattern), pattern);
			}
			else
			{
				// > 0
				ap_uint_512_shift_right(pattern, s, AP_UINT_PTR(shifted_pattern));
			}

			ap_uint_512 dist;
		
			xorBases(shifted_pattern, text, AP_UINT_PTR(dist));

			XP[s+SNEAKY_THRESHOLD] = ap_uint_512_range(dist, kstart, kend);
		}
		
		unsigned int LZ[8];
		
		#pragma unroll
		for (int i=0; i<8; i++)
		{
			unsigned int mask = (1 << (8-i)) -1;
			unsigned int AC = mask;
			
			
			#pragma unroll
			for (int s=0; s < 2*SNEAKY_THRESHOLD+1; s++)
			{
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
	{
		int w=14;
		if (w < plen/SNEAKY_WINDOW_SIZE)
        {
		unsigned int kstart = w*SNEAKY_WINDOW_SIZE;
		unsigned int kend = (w+1) * SNEAKY_WINDOW_SIZE;

		unsigned int XP[SNEAKY_THRESHOLD*2+1];
		
		#pragma unroll
		for (int s=-SNEAKY_THRESHOLD; s <= SNEAKY_THRESHOLD; s++)
		{
			ap_uint_512 shifted_pattern;
			if (s < 0)
			{
				ap_uint_512_shift_left(pattern, (-s), AP_UINT_PTR(shifted_pattern));
			}
			else if (s==0)
			{
				ap_uint_512_set(AP_UINT_PTR(shifted_pattern), pattern);
			}
			else
			{
				// > 0
				ap_uint_512_shift_right(pattern, s, AP_UINT_PTR(shifted_pattern));
			}

			ap_uint_512 dist;
		
			xorBases(shifted_pattern, text, AP_UINT_PTR(dist));

			XP[s+SNEAKY_THRESHOLD] = ap_uint_512_range(dist, kstart, kend);
		}
		
		unsigned int LZ[8];
		
		#pragma unroll
		for (int i=0; i<8; i++)
		{
			unsigned int mask = (1 << (8-i)) -1;
			unsigned int AC = mask;
			
			
			#pragma unroll
			for (int s=0; s < 2*SNEAKY_THRESHOLD+1; s++)
			{
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
	{
		int w=15;
		if (w < plen/SNEAKY_WINDOW_SIZE)
        {
		unsigned int kstart = w*SNEAKY_WINDOW_SIZE;
		unsigned int kend = (w+1) * SNEAKY_WINDOW_SIZE;

		unsigned int XP[SNEAKY_THRESHOLD*2+1];
		
		#pragma unroll
		for (int s=-SNEAKY_THRESHOLD; s <= SNEAKY_THRESHOLD; s++)
		{
			ap_uint_512 shifted_pattern;
			if (s < 0)
			{
				ap_uint_512_shift_left(pattern, (-s), AP_UINT_PTR(shifted_pattern));
			}
			else if (s==0)
			{
				ap_uint_512_set(AP_UINT_PTR(shifted_pattern), pattern);
			}
			else
			{
				// > 0
				ap_uint_512_shift_right(pattern, s, AP_UINT_PTR(shifted_pattern));
			}

			ap_uint_512 dist;
		
			xorBases(shifted_pattern, text, AP_UINT_PTR(dist));

			XP[s+SNEAKY_THRESHOLD] = ap_uint_512_range(dist, kstart, kend);
		}
		
		unsigned int LZ[8];
		
		#pragma unroll
		for (int i=0; i<8; i++)
		{
			unsigned int mask = (1 << (8-i)) -1;
			unsigned int AC = mask;
			
			
			#pragma unroll
			for (int s=0; s < 2*SNEAKY_THRESHOLD+1; s++)
			{
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
	{
		int w=16;
		if (w < plen/SNEAKY_WINDOW_SIZE)
        {
		unsigned int kstart = w*SNEAKY_WINDOW_SIZE;
		unsigned int kend = (w+1) * SNEAKY_WINDOW_SIZE;

		unsigned int XP[SNEAKY_THRESHOLD*2+1];
		
		#pragma unroll
		for (int s=-SNEAKY_THRESHOLD; s <= SNEAKY_THRESHOLD; s++)
		{
			ap_uint_512 shifted_pattern;
			if (s < 0)
			{
				ap_uint_512_shift_left(pattern, (-s), AP_UINT_PTR(shifted_pattern));
			}
			else if (s==0)
			{
				ap_uint_512_set(AP_UINT_PTR(shifted_pattern), pattern);
			}
			else
			{
				// > 0
				ap_uint_512_shift_right(pattern, s, AP_UINT_PTR(shifted_pattern));
			}

			ap_uint_512 dist;
		
			xorBases(shifted_pattern, text, AP_UINT_PTR(dist));

			XP[s+SNEAKY_THRESHOLD] = ap_uint_512_range(dist, kstart, kend);
		}
		
		unsigned int LZ[8];
		
		#pragma unroll
		for (int i=0; i<8; i++)
		{
			unsigned int mask = (1 << (8-i)) -1;
			unsigned int AC = mask;
			
			
			#pragma unroll
			for (int s=0; s < 2*SNEAKY_THRESHOLD+1; s++)
			{
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
	{
		int w=17;
		if (w < plen/SNEAKY_WINDOW_SIZE)
        {
		unsigned int kstart = w*SNEAKY_WINDOW_SIZE;
		unsigned int kend = (w+1) * SNEAKY_WINDOW_SIZE;

		unsigned int XP[SNEAKY_THRESHOLD*2+1];
		
		#pragma unroll
		for (int s=-SNEAKY_THRESHOLD; s <= SNEAKY_THRESHOLD; s++)
		{
			ap_uint_512 shifted_pattern;
			if (s < 0)
			{
				ap_uint_512_shift_left(pattern, (-s), AP_UINT_PTR(shifted_pattern));
			}
			else if (s==0)
			{
				ap_uint_512_set(AP_UINT_PTR(shifted_pattern), pattern);
			}
			else
			{
				// > 0
				ap_uint_512_shift_right(pattern, s, AP_UINT_PTR(shifted_pattern));
			}

			ap_uint_512 dist;
		
			xorBases(shifted_pattern, text, AP_UINT_PTR(dist));

			XP[s+SNEAKY_THRESHOLD] = ap_uint_512_range(dist, kstart, kend);
		}
		
		unsigned int LZ[8];
		
		#pragma unroll
		for (int i=0; i<8; i++)
		{
			unsigned int mask = (1 << (8-i)) -1;
			unsigned int AC = mask;
			
			
			#pragma unroll
			for (int s=0; s < 2*SNEAKY_THRESHOLD+1; s++)
			{
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
	{
		int w=18;
		if (w < plen/SNEAKY_WINDOW_SIZE)
        {
		unsigned int kstart = w*SNEAKY_WINDOW_SIZE;
		unsigned int kend = (w+1) * SNEAKY_WINDOW_SIZE;

		unsigned int XP[SNEAKY_THRESHOLD*2+1];
		
		#pragma unroll
		for (int s=-SNEAKY_THRESHOLD; s <= SNEAKY_THRESHOLD; s++)
		{
			ap_uint_512 shifted_pattern;
			if (s < 0)
			{
				ap_uint_512_shift_left(pattern, (-s), AP_UINT_PTR(shifted_pattern));
			}
			else if (s==0)
			{
				ap_uint_512_set(AP_UINT_PTR(shifted_pattern), pattern);
			}
			else
			{
				// > 0
				ap_uint_512_shift_right(pattern, s, AP_UINT_PTR(shifted_pattern));
			}

			ap_uint_512 dist;
		
			xorBases(shifted_pattern, text, AP_UINT_PTR(dist));

			XP[s+SNEAKY_THRESHOLD] = ap_uint_512_range(dist, kstart, kend);
		}
		
		unsigned int LZ[8];
		
		#pragma unroll
		for (int i=0; i<8; i++)
		{
			unsigned int mask = (1 << (8-i)) -1;
			unsigned int AC = mask;
			
			
			#pragma unroll
			for (int s=0; s < 2*SNEAKY_THRESHOLD+1; s++)
			{
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
	{
		int w=19;
		if (w < plen/SNEAKY_WINDOW_SIZE)
        {
		unsigned int kstart = w*SNEAKY_WINDOW_SIZE;
		unsigned int kend = (w+1) * SNEAKY_WINDOW_SIZE;

		unsigned int XP[SNEAKY_THRESHOLD*2+1];
		
		#pragma unroll
		for (int s=-SNEAKY_THRESHOLD; s <= SNEAKY_THRESHOLD; s++)
		{
			ap_uint_512 shifted_pattern;
			if (s < 0)
			{
				ap_uint_512_shift_left(pattern, (-s), AP_UINT_PTR(shifted_pattern));
			}
			else if (s==0)
			{
				ap_uint_512_set(AP_UINT_PTR(shifted_pattern), pattern);
			}
			else
			{
				// > 0
				ap_uint_512_shift_right(pattern, s, AP_UINT_PTR(shifted_pattern));
			}

			ap_uint_512 dist;
		
			xorBases(shifted_pattern, text, AP_UINT_PTR(dist));

			XP[s+SNEAKY_THRESHOLD] = ap_uint_512_range(dist, kstart, kend);
		}
		
		unsigned int LZ[8];
		
		#pragma unroll
		for (int i=0; i<8; i++)
		{
			unsigned int mask = (1 << (8-i)) -1;
			unsigned int AC = mask;
			
			
			#pragma unroll
			for (int s=0; s < 2*SNEAKY_THRESHOLD+1; s++)
			{
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
	{
		int w=20;
		if (w < plen/SNEAKY_WINDOW_SIZE)
        {
		unsigned int kstart = w*SNEAKY_WINDOW_SIZE;
		unsigned int kend = (w+1) * SNEAKY_WINDOW_SIZE;

		unsigned int XP[SNEAKY_THRESHOLD*2+1];
		
		#pragma unroll
		for (int s=-SNEAKY_THRESHOLD; s <= SNEAKY_THRESHOLD; s++)
		{
			ap_uint_512 shifted_pattern;
			if (s < 0)
			{
				ap_uint_512_shift_left(pattern, (-s), AP_UINT_PTR(shifted_pattern));
			}
			else if (s==0)
			{
				ap_uint_512_set(AP_UINT_PTR(shifted_pattern), pattern);
			}
			else
			{
				// > 0
				ap_uint_512_shift_right(pattern, s, AP_UINT_PTR(shifted_pattern));
			}

			ap_uint_512 dist;
		
			xorBases(shifted_pattern, text, AP_UINT_PTR(dist));

			XP[s+SNEAKY_THRESHOLD] = ap_uint_512_range(dist, kstart, kend);
		}
		
		unsigned int LZ[8];
		
		#pragma unroll
		for (int i=0; i<8; i++)
		{
			unsigned int mask = (1 << (8-i)) -1;
			unsigned int AC = mask;
			
			
			#pragma unroll
			for (int s=0; s < 2*SNEAKY_THRESHOLD+1; s++)
			{
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
	{
		int w=21;
		if (w < plen/SNEAKY_WINDOW_SIZE)
        {
		unsigned int kstart = w*SNEAKY_WINDOW_SIZE;
		unsigned int kend = (w+1) * SNEAKY_WINDOW_SIZE;

		unsigned int XP[SNEAKY_THRESHOLD*2+1];
		
		#pragma unroll
		for (int s=-SNEAKY_THRESHOLD; s <= SNEAKY_THRESHOLD; s++)
		{
			ap_uint_512 shifted_pattern;
			if (s < 0)
			{
				ap_uint_512_shift_left(pattern, (-s), AP_UINT_PTR(shifted_pattern));
			}
			else if (s==0)
			{
				ap_uint_512_set(AP_UINT_PTR(shifted_pattern), pattern);
			}
			else
			{
				// > 0
				ap_uint_512_shift_right(pattern, s, AP_UINT_PTR(shifted_pattern));
			}

			ap_uint_512 dist;
		
			xorBases(shifted_pattern, text, AP_UINT_PTR(dist));

			XP[s+SNEAKY_THRESHOLD] = ap_uint_512_range(dist, kstart, kend);
		}
		
		unsigned int LZ[8];
		
		#pragma unroll
		for (int i=0; i<8; i++)
		{
			unsigned int mask = (1 << (8-i)) -1;
			unsigned int AC = mask;
			
			
			#pragma unroll
			for (int s=0; s < 2*SNEAKY_THRESHOLD+1; s++)
			{
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
	{
		int w=22;
		if (w < plen/SNEAKY_WINDOW_SIZE)
        {
		unsigned int kstart = w*SNEAKY_WINDOW_SIZE;
		unsigned int kend = (w+1) * SNEAKY_WINDOW_SIZE;

		unsigned int XP[SNEAKY_THRESHOLD*2+1];
		
		#pragma unroll
		for (int s=-SNEAKY_THRESHOLD; s <= SNEAKY_THRESHOLD; s++)
		{
			ap_uint_512 shifted_pattern;
			if (s < 0)
			{
				ap_uint_512_shift_left(pattern, (-s), AP_UINT_PTR(shifted_pattern));
			}
			else if (s==0)
			{
				ap_uint_512_set(AP_UINT_PTR(shifted_pattern), pattern);
			}
			else
			{
				// > 0
				ap_uint_512_shift_right(pattern, s, AP_UINT_PTR(shifted_pattern));
			}

			ap_uint_512 dist;
		
			xorBases(shifted_pattern, text, AP_UINT_PTR(dist));

			XP[s+SNEAKY_THRESHOLD] = ap_uint_512_range(dist, kstart, kend);
		}
		
		unsigned int LZ[8];
		
		#pragma unroll
		for (int i=0; i<8; i++)
		{
			unsigned int mask = (1 << (8-i)) -1;
			unsigned int AC = mask;
			
			
			#pragma unroll
			for (int s=0; s < 2*SNEAKY_THRESHOLD+1; s++)
			{
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
	{
		int w=23;
		if (w < plen/SNEAKY_WINDOW_SIZE)
        {
		unsigned int kstart = w*SNEAKY_WINDOW_SIZE;
		unsigned int kend = (w+1) * SNEAKY_WINDOW_SIZE;

		unsigned int XP[SNEAKY_THRESHOLD*2+1];
		
		#pragma unroll
		for (int s=-SNEAKY_THRESHOLD; s <= SNEAKY_THRESHOLD; s++)
		{
			ap_uint_512 shifted_pattern;
			if (s < 0)
			{
				ap_uint_512_shift_left(pattern, (-s), AP_UINT_PTR(shifted_pattern));
			}
			else if (s==0)
			{
				ap_uint_512_set(AP_UINT_PTR(shifted_pattern), pattern);
			}
			else
			{
				// > 0
				ap_uint_512_shift_right(pattern, s, AP_UINT_PTR(shifted_pattern));
			}

			ap_uint_512 dist;
		
			xorBases(shifted_pattern, text, AP_UINT_PTR(dist));

			XP[s+SNEAKY_THRESHOLD] = ap_uint_512_range(dist, kstart, kend);
		}
		
		unsigned int LZ[8];
		
		#pragma unroll
		for (int i=0; i<8; i++)
		{
			unsigned int mask = (1 << (8-i)) -1;
			unsigned int AC = mask;
			
			
			#pragma unroll
			for (int s=0; s < 2*SNEAKY_THRESHOLD+1; s++)
			{
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
	{
		int w=24;
		if (w < plen/SNEAKY_WINDOW_SIZE)
        {
		unsigned int kstart = w*SNEAKY_WINDOW_SIZE;
		unsigned int kend = (w+1) * SNEAKY_WINDOW_SIZE;

		unsigned int XP[SNEAKY_THRESHOLD*2+1];
		
		#pragma unroll
		for (int s=-SNEAKY_THRESHOLD; s <= SNEAKY_THRESHOLD; s++)
		{
			ap_uint_512 shifted_pattern;
			if (s < 0)
			{
				ap_uint_512_shift_left(pattern, (-s), AP_UINT_PTR(shifted_pattern));
			}
			else if (s==0)
			{
				ap_uint_512_set(AP_UINT_PTR(shifted_pattern), pattern);
			}
			else
			{
				// > 0
				ap_uint_512_shift_right(pattern, s, AP_UINT_PTR(shifted_pattern));
			}

			ap_uint_512 dist;
		
			xorBases(shifted_pattern, text, AP_UINT_PTR(dist));

			XP[s+SNEAKY_THRESHOLD] = ap_uint_512_range(dist, kstart, kend);
		}
		
		unsigned int LZ[8];
		
		#pragma unroll
		for (int i=0; i<8; i++)
		{
			unsigned int mask = (1 << (8-i)) -1;
			unsigned int AC = mask;
			
			
			#pragma unroll
			for (int s=0; s < 2*SNEAKY_THRESHOLD+1; s++)
			{
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
	{
		int w=25;
		if (w < plen/SNEAKY_WINDOW_SIZE)
        {
		unsigned int kstart = w*SNEAKY_WINDOW_SIZE;
		unsigned int kend = (w+1) * SNEAKY_WINDOW_SIZE;

		unsigned int XP[SNEAKY_THRESHOLD*2+1];
		
		#pragma unroll
		for (int s=-SNEAKY_THRESHOLD; s <= SNEAKY_THRESHOLD; s++)
		{
			ap_uint_512 shifted_pattern;
			if (s < 0)
			{
				ap_uint_512_shift_left(pattern, (-s), AP_UINT_PTR(shifted_pattern));
			}
			else if (s==0)
			{
				ap_uint_512_set(AP_UINT_PTR(shifted_pattern), pattern);
			}
			else
			{
				// > 0
				ap_uint_512_shift_right(pattern, s, AP_UINT_PTR(shifted_pattern));
			}

			ap_uint_512 dist;
		
			xorBases(shifted_pattern, text, AP_UINT_PTR(dist));

			XP[s+SNEAKY_THRESHOLD] = ap_uint_512_range(dist, kstart, kend);
		}
		
		unsigned int LZ[8];
		
		#pragma unroll
		for (int i=0; i<8; i++)
		{
			unsigned int mask = (1 << (8-i)) -1;
			unsigned int AC = mask;
			
			
			#pragma unroll
			for (int s=0; s < 2*SNEAKY_THRESHOLD+1; s++)
			{
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
	{
		int w=26;
		if (w < plen/SNEAKY_WINDOW_SIZE)
        {
		unsigned int kstart = w*SNEAKY_WINDOW_SIZE;
		unsigned int kend = (w+1) * SNEAKY_WINDOW_SIZE;

		unsigned int XP[SNEAKY_THRESHOLD*2+1];
		
		#pragma unroll
		for (int s=-SNEAKY_THRESHOLD; s <= SNEAKY_THRESHOLD; s++)
		{
			ap_uint_512 shifted_pattern;
			if (s < 0)
			{
				ap_uint_512_shift_left(pattern, (-s), AP_UINT_PTR(shifted_pattern));
			}
			else if (s==0)
			{
				ap_uint_512_set(AP_UINT_PTR(shifted_pattern), pattern);
			}
			else
			{
				// > 0
				ap_uint_512_shift_right(pattern, s, AP_UINT_PTR(shifted_pattern));
			}

			ap_uint_512 dist;
		
			xorBases(shifted_pattern, text, AP_UINT_PTR(dist));

			XP[s+SNEAKY_THRESHOLD] = ap_uint_512_range(dist, kstart, kend);
		}
		
		unsigned int LZ[8];
		
		#pragma unroll
		for (int i=0; i<8; i++)
		{
			unsigned int mask = (1 << (8-i)) -1;
			unsigned int AC = mask;
			
			
			#pragma unroll
			for (int s=0; s < 2*SNEAKY_THRESHOLD+1; s++)
			{
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
	{
		int w=27;
		if (w < plen/SNEAKY_WINDOW_SIZE)
        {
		unsigned int kstart = w*SNEAKY_WINDOW_SIZE;
		unsigned int kend = (w+1) * SNEAKY_WINDOW_SIZE;

		unsigned int XP[SNEAKY_THRESHOLD*2+1];
		
		#pragma unroll
		for (int s=-SNEAKY_THRESHOLD; s <= SNEAKY_THRESHOLD; s++)
		{
			ap_uint_512 shifted_pattern;
			if (s < 0)
			{
				ap_uint_512_shift_left(pattern, (-s), AP_UINT_PTR(shifted_pattern));
			}
			else if (s==0)
			{
				ap_uint_512_set(AP_UINT_PTR(shifted_pattern), pattern);
			}
			else
			{
				// > 0
				ap_uint_512_shift_right(pattern, s, AP_UINT_PTR(shifted_pattern));
			}

			ap_uint_512 dist;
		
			xorBases(shifted_pattern, text, AP_UINT_PTR(dist));

			XP[s+SNEAKY_THRESHOLD] = ap_uint_512_range(dist, kstart, kend);
		}
		
		unsigned int LZ[8];
		
		#pragma unroll
		for (int i=0; i<8; i++)
		{
			unsigned int mask = (1 << (8-i)) -1;
			unsigned int AC = mask;
			
			
			#pragma unroll
			for (int s=0; s < 2*SNEAKY_THRESHOLD+1; s++)
			{
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
	{
		int w=28;
		if (w < plen/SNEAKY_WINDOW_SIZE)
        {
		unsigned int kstart = w*SNEAKY_WINDOW_SIZE;
		unsigned int kend = (w+1) * SNEAKY_WINDOW_SIZE;

		unsigned int XP[SNEAKY_THRESHOLD*2+1];
		
		#pragma unroll
		for (int s=-SNEAKY_THRESHOLD; s <= SNEAKY_THRESHOLD; s++)
		{
			ap_uint_512 shifted_pattern;
			if (s < 0)
			{
				ap_uint_512_shift_left(pattern, (-s), AP_UINT_PTR(shifted_pattern));
			}
			else if (s==0)
			{
				ap_uint_512_set(AP_UINT_PTR(shifted_pattern), pattern);
			}
			else
			{
				// > 0
				ap_uint_512_shift_right(pattern, s, AP_UINT_PTR(shifted_pattern));
			}

			ap_uint_512 dist;
		
			xorBases(shifted_pattern, text, AP_UINT_PTR(dist));

			XP[s+SNEAKY_THRESHOLD] = ap_uint_512_range(dist, kstart, kend);
		}
		
		unsigned int LZ[8];
		
		#pragma unroll
		for (int i=0; i<8; i++)
		{
			unsigned int mask = (1 << (8-i)) -1;
			unsigned int AC = mask;
			
			
			#pragma unroll
			for (int s=0; s < 2*SNEAKY_THRESHOLD+1; s++)
			{
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
	{
		int w=29;
		if (w < plen/SNEAKY_WINDOW_SIZE)
        {
		unsigned int kstart = w*SNEAKY_WINDOW_SIZE;
		unsigned int kend = (w+1) * SNEAKY_WINDOW_SIZE;

		unsigned int XP[SNEAKY_THRESHOLD*2+1];
		
		#pragma unroll
		for (int s=-SNEAKY_THRESHOLD; s <= SNEAKY_THRESHOLD; s++)
		{
			ap_uint_512 shifted_pattern;
			if (s < 0)
			{
				ap_uint_512_shift_left(pattern, (-s), AP_UINT_PTR(shifted_pattern));
			}
			else if (s==0)
			{
				ap_uint_512_set(AP_UINT_PTR(shifted_pattern), pattern);
			}
			else
			{
				// > 0
				ap_uint_512_shift_right(pattern, s, AP_UINT_PTR(shifted_pattern));
			}

			ap_uint_512 dist;
		
			xorBases(shifted_pattern, text, AP_UINT_PTR(dist));

			XP[s+SNEAKY_THRESHOLD] = ap_uint_512_range(dist, kstart, kend);
		}
		
		unsigned int LZ[8];
		
		#pragma unroll
		for (int i=0; i<8; i++)
		{
			unsigned int mask = (1 << (8-i)) -1;
			unsigned int AC = mask;
			
			
			#pragma unroll
			for (int s=0; s < 2*SNEAKY_THRESHOLD+1; s++)
			{
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
	{
		int w=30;
		if (w < plen/SNEAKY_WINDOW_SIZE)
        {
		unsigned int kstart = w*SNEAKY_WINDOW_SIZE;
		unsigned int kend = (w+1) * SNEAKY_WINDOW_SIZE;

		unsigned int XP[SNEAKY_THRESHOLD*2+1];
		
		#pragma unroll
		for (int s=-SNEAKY_THRESHOLD; s <= SNEAKY_THRESHOLD; s++)
		{
			ap_uint_512 shifted_pattern;
			if (s < 0)
			{
				ap_uint_512_shift_left(pattern, (-s), AP_UINT_PTR(shifted_pattern));
			}
			else if (s==0)
			{
				ap_uint_512_set(AP_UINT_PTR(shifted_pattern), pattern);
			}
			else
			{
				// > 0
				ap_uint_512_shift_right(pattern, s, AP_UINT_PTR(shifted_pattern));
			}

			ap_uint_512 dist;
		
			xorBases(shifted_pattern, text, AP_UINT_PTR(dist));

			XP[s+SNEAKY_THRESHOLD] = ap_uint_512_range(dist, kstart, kend);
		}
		
		unsigned int LZ[8];
		
		#pragma unroll
		for (int i=0; i<8; i++)
		{
			unsigned int mask = (1 << (8-i)) -1;
			unsigned int AC = mask;
			
			
			#pragma unroll
			for (int s=0; s < 2*SNEAKY_THRESHOLD+1; s++)
			{
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
	{
		int w=31;
		if (w < plen/SNEAKY_WINDOW_SIZE)
        {
		unsigned int kstart = w*SNEAKY_WINDOW_SIZE;
		unsigned int kend = (w+1) * SNEAKY_WINDOW_SIZE;

		unsigned int XP[SNEAKY_THRESHOLD*2+1];
		
		#pragma unroll
		for (int s=-SNEAKY_THRESHOLD; s <= SNEAKY_THRESHOLD; s++)
		{
			ap_uint_512 shifted_pattern;
			if (s < 0)
			{
				ap_uint_512_shift_left(pattern, (-s), AP_UINT_PTR(shifted_pattern));
			}
			else if (s==0)
			{
				ap_uint_512_set(AP_UINT_PTR(shifted_pattern), pattern);
			}
			else
			{
				// > 0
				ap_uint_512_shift_right(pattern, s, AP_UINT_PTR(shifted_pattern));
			}

			ap_uint_512 dist;
		
			xorBases(shifted_pattern, text, AP_UINT_PTR(dist));

			XP[s+SNEAKY_THRESHOLD] = ap_uint_512_range(dist, kstart, kend);
		}
		
		unsigned int LZ[8];
		
		#pragma unroll
		for (int i=0; i<8; i++)
		{
			unsigned int mask = (1 << (8-i)) -1;
			unsigned int AC = mask;
			
			
			#pragma unroll
			for (int s=0; s < 2*SNEAKY_THRESHOLD+1; s++)
			{
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
	{
		int w=32;
		if (w < plen/SNEAKY_WINDOW_SIZE)
        {
		unsigned int kstart = w*SNEAKY_WINDOW_SIZE;
		unsigned int kend = (w+1) * SNEAKY_WINDOW_SIZE;

		unsigned int XP[SNEAKY_THRESHOLD*2+1];
		
		#pragma unroll
		for (int s=-SNEAKY_THRESHOLD; s <= SNEAKY_THRESHOLD; s++)
		{
			ap_uint_512 shifted_pattern;
			if (s < 0)
			{
				ap_uint_512_shift_left(pattern, (-s), AP_UINT_PTR(shifted_pattern));
			}
			else if (s==0)
			{
				ap_uint_512_set(AP_UINT_PTR(shifted_pattern), pattern);
			}
			else
			{
				// > 0
				ap_uint_512_shift_right(pattern, s, AP_UINT_PTR(shifted_pattern));
			}

			ap_uint_512 dist;
		
			xorBases(shifted_pattern, text, AP_UINT_PTR(dist));

			XP[s+SNEAKY_THRESHOLD] = ap_uint_512_range(dist, kstart, kend);
		}
		
		unsigned int LZ[8];
		
		#pragma unroll
		for (int i=0; i<8; i++)
		{
			unsigned int mask = (1 << (8-i)) -1;
			unsigned int AC = mask;
			
			
			#pragma unroll
			for (int s=0; s < 2*SNEAKY_THRESHOLD+1; s++)
			{
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
	{
		int w=33;
		if (w < plen/SNEAKY_WINDOW_SIZE)
        {
		unsigned int kstart = w*SNEAKY_WINDOW_SIZE;
		unsigned int kend = (w+1) * SNEAKY_WINDOW_SIZE;

		unsigned int XP[SNEAKY_THRESHOLD*2+1];
		
		#pragma unroll
		for (int s=-SNEAKY_THRESHOLD; s <= SNEAKY_THRESHOLD; s++)
		{
			ap_uint_512 shifted_pattern;
			if (s < 0)
			{
				ap_uint_512_shift_left(pattern, (-s), AP_UINT_PTR(shifted_pattern));
			}
			else if (s==0)
			{
				ap_uint_512_set(AP_UINT_PTR(shifted_pattern), pattern);
			}
			else
			{
				// > 0
				ap_uint_512_shift_right(pattern, s, AP_UINT_PTR(shifted_pattern));
			}

			ap_uint_512 dist;
		
			xorBases(shifted_pattern, text, AP_UINT_PTR(dist));

			XP[s+SNEAKY_THRESHOLD] = ap_uint_512_range(dist, kstart, kend);
		}
		
		unsigned int LZ[8];
		
		#pragma unroll
		for (int i=0; i<8; i++)
		{
			unsigned int mask = (1 << (8-i)) -1;
			unsigned int AC = mask;
			
			
			#pragma unroll
			for (int s=0; s < 2*SNEAKY_THRESHOLD+1; s++)
			{
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
	{
		int w=34;
		if (w < plen/SNEAKY_WINDOW_SIZE)
        {
		unsigned int kstart = w*SNEAKY_WINDOW_SIZE;
		unsigned int kend = (w+1) * SNEAKY_WINDOW_SIZE;

		unsigned int XP[SNEAKY_THRESHOLD*2+1];
		
		#pragma unroll
		for (int s=-SNEAKY_THRESHOLD; s <= SNEAKY_THRESHOLD; s++)
		{
			ap_uint_512 shifted_pattern;
			if (s < 0)
			{
				ap_uint_512_shift_left(pattern, (-s), AP_UINT_PTR(shifted_pattern));
			}
			else if (s==0)
			{
				ap_uint_512_set(AP_UINT_PTR(shifted_pattern), pattern);
			}
			else
			{
				// > 0
				ap_uint_512_shift_right(pattern, s, AP_UINT_PTR(shifted_pattern));
			}

			ap_uint_512 dist;
		
			xorBases(shifted_pattern, text, AP_UINT_PTR(dist));

			XP[s+SNEAKY_THRESHOLD] = ap_uint_512_range(dist, kstart, kend);
		}
		
		unsigned int LZ[8];
		
		#pragma unroll
		for (int i=0; i<8; i++)
		{
			unsigned int mask = (1 << (8-i)) -1;
			unsigned int AC = mask;
			
			
			#pragma unroll
			for (int s=0; s < 2*SNEAKY_THRESHOLD+1; s++)
			{
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
	{
		int w=35;
		if (w < plen/SNEAKY_WINDOW_SIZE)
        {
		unsigned int kstart = w*SNEAKY_WINDOW_SIZE;
		unsigned int kend = (w+1) * SNEAKY_WINDOW_SIZE;

		unsigned int XP[SNEAKY_THRESHOLD*2+1];
		
		#pragma unroll
		for (int s=-SNEAKY_THRESHOLD; s <= SNEAKY_THRESHOLD; s++)
		{
			ap_uint_512 shifted_pattern;
			if (s < 0)
			{
				ap_uint_512_shift_left(pattern, (-s), AP_UINT_PTR(shifted_pattern));
			}
			else if (s==0)
			{
				ap_uint_512_set(AP_UINT_PTR(shifted_pattern), pattern);
			}
			else
			{
				// > 0
				ap_uint_512_shift_right(pattern, s, AP_UINT_PTR(shifted_pattern));
			}

			ap_uint_512 dist;
		
			xorBases(shifted_pattern, text, AP_UINT_PTR(dist));

			XP[s+SNEAKY_THRESHOLD] = ap_uint_512_range(dist, kstart, kend);
		}
		
		unsigned int LZ[8];
		
		#pragma unroll
		for (int i=0; i<8; i++)
		{
			unsigned int mask = (1 << (8-i)) -1;
			unsigned int AC = mask;
			
			
			#pragma unroll
			for (int s=0; s < 2*SNEAKY_THRESHOLD+1; s++)
			{
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
	{
		int w=36;
		if (w < plen/SNEAKY_WINDOW_SIZE)
        {
		unsigned int kstart = w*SNEAKY_WINDOW_SIZE;
		unsigned int kend = (w+1) * SNEAKY_WINDOW_SIZE;

		unsigned int XP[SNEAKY_THRESHOLD*2+1];
		
		#pragma unroll
		for (int s=-SNEAKY_THRESHOLD; s <= SNEAKY_THRESHOLD; s++)
		{
			ap_uint_512 shifted_pattern;
			if (s < 0)
			{
				ap_uint_512_shift_left(pattern, (-s), AP_UINT_PTR(shifted_pattern));
			}
			else if (s==0)
			{
				ap_uint_512_set(AP_UINT_PTR(shifted_pattern), pattern);
			}
			else
			{
				// > 0
				ap_uint_512_shift_right(pattern, s, AP_UINT_PTR(shifted_pattern));
			}

			ap_uint_512 dist;
		
			xorBases(shifted_pattern, text, AP_UINT_PTR(dist));

			XP[s+SNEAKY_THRESHOLD] = ap_uint_512_range(dist, kstart, kend);
		}
		
		unsigned int LZ[8];
		
		#pragma unroll
		for (int i=0; i<8; i++)
		{
			unsigned int mask = (1 << (8-i)) -1;
			unsigned int AC = mask;
			
			
			#pragma unroll
			for (int s=0; s < 2*SNEAKY_THRESHOLD+1; s++)
			{
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



unsigned int computeDistance(ap_uint_512 pattern,  int plen, ap_uint_512 text,  int tlen)
{
	return sneaky(pattern,  plen, text,  plen);
}


void xorBases(ap_uint_512 p, ap_uint_512 t, ap_uint_512p r)
{
	int dst_511 = (((p.w15 >> 31)&1) ^ ((t.w15 >> 31)&1)) | (((p.w15 >> 30)&1) ^ ((t.w15 >> 30)&1)) ;
	int dst_510 = (((p.w15 >> 29)&1) ^ ((t.w15 >> 29)&1)) | (((p.w15 >> 28)&1) ^ ((t.w15 >> 28)&1)) ;
	int dst_509 = (((p.w15 >> 27)&1) ^ ((t.w15 >> 27)&1)) | (((p.w15 >> 26)&1) ^ ((t.w15 >> 26)&1)) ;
	int dst_508 = (((p.w15 >> 25)&1) ^ ((t.w15 >> 25)&1)) | (((p.w15 >> 24)&1) ^ ((t.w15 >> 24)&1)) ;
	int dst_507 = (((p.w15 >> 23)&1) ^ ((t.w15 >> 23)&1)) | (((p.w15 >> 22)&1) ^ ((t.w15 >> 22)&1)) ;
	int dst_506 = (((p.w15 >> 21)&1) ^ ((t.w15 >> 21)&1)) | (((p.w15 >> 20)&1) ^ ((t.w15 >> 20)&1)) ;
	int dst_505 = (((p.w15 >> 19)&1) ^ ((t.w15 >> 19)&1)) | (((p.w15 >> 18)&1) ^ ((t.w15 >> 18)&1)) ;
	int dst_504 = (((p.w15 >> 17)&1) ^ ((t.w15 >> 17)&1)) | (((p.w15 >> 16)&1) ^ ((t.w15 >> 16)&1)) ;
	int dst_503 = (((p.w15 >> 15)&1) ^ ((t.w15 >> 15)&1)) | (((p.w15 >> 14)&1) ^ ((t.w15 >> 14)&1)) ;
	int dst_502 = (((p.w15 >> 13)&1) ^ ((t.w15 >> 13)&1)) | (((p.w15 >> 12)&1) ^ ((t.w15 >> 12)&1)) ;
	int dst_501 = (((p.w15 >> 11)&1) ^ ((t.w15 >> 11)&1)) | (((p.w15 >> 10)&1) ^ ((t.w15 >> 10)&1)) ;
	int dst_500 = (((p.w15 >> 9)&1) ^ ((t.w15 >> 9)&1)) | (((p.w15 >> 8)&1) ^ ((t.w15 >> 8)&1)) ;
	int dst_499 = (((p.w15 >> 7)&1) ^ ((t.w15 >> 7)&1)) | (((p.w15 >> 6)&1) ^ ((t.w15 >> 6)&1)) ;
	int dst_498 = (((p.w15 >> 5)&1) ^ ((t.w15 >> 5)&1)) | (((p.w15 >> 4)&1) ^ ((t.w15 >> 4)&1)) ;
	int dst_497 = (((p.w15 >> 3)&1) ^ ((t.w15 >> 3)&1)) | (((p.w15 >> 2)&1) ^ ((t.w15 >> 2)&1)) ;
	int dst_496 = (((p.w15 >> 1)&1) ^ ((t.w15 >> 1)&1)) | (((p.w15 >> 0)&1) ^ ((t.w15 >> 0)&1)) ;
	int dst_495 = (((p.w14 >> 31)&1) ^ ((t.w14 >> 31)&1)) | (((p.w14 >> 30)&1) ^ ((t.w14 >> 30)&1)) ;
	int dst_494 = (((p.w14 >> 29)&1) ^ ((t.w14 >> 29)&1)) | (((p.w14 >> 28)&1) ^ ((t.w14 >> 28)&1)) ;
	int dst_493 = (((p.w14 >> 27)&1) ^ ((t.w14 >> 27)&1)) | (((p.w14 >> 26)&1) ^ ((t.w14 >> 26)&1)) ;
	int dst_492 = (((p.w14 >> 25)&1) ^ ((t.w14 >> 25)&1)) | (((p.w14 >> 24)&1) ^ ((t.w14 >> 24)&1)) ;
	int dst_491 = (((p.w14 >> 23)&1) ^ ((t.w14 >> 23)&1)) | (((p.w14 >> 22)&1) ^ ((t.w14 >> 22)&1)) ;
	int dst_490 = (((p.w14 >> 21)&1) ^ ((t.w14 >> 21)&1)) | (((p.w14 >> 20)&1) ^ ((t.w14 >> 20)&1)) ;
	int dst_489 = (((p.w14 >> 19)&1) ^ ((t.w14 >> 19)&1)) | (((p.w14 >> 18)&1) ^ ((t.w14 >> 18)&1)) ;
	int dst_488 = (((p.w14 >> 17)&1) ^ ((t.w14 >> 17)&1)) | (((p.w14 >> 16)&1) ^ ((t.w14 >> 16)&1)) ;
	int dst_487 = (((p.w14 >> 15)&1) ^ ((t.w14 >> 15)&1)) | (((p.w14 >> 14)&1) ^ ((t.w14 >> 14)&1)) ;
	int dst_486 = (((p.w14 >> 13)&1) ^ ((t.w14 >> 13)&1)) | (((p.w14 >> 12)&1) ^ ((t.w14 >> 12)&1)) ;
	int dst_485 = (((p.w14 >> 11)&1) ^ ((t.w14 >> 11)&1)) | (((p.w14 >> 10)&1) ^ ((t.w14 >> 10)&1)) ;
	int dst_484 = (((p.w14 >> 9)&1) ^ ((t.w14 >> 9)&1)) | (((p.w14 >> 8)&1) ^ ((t.w14 >> 8)&1)) ;
	int dst_483 = (((p.w14 >> 7)&1) ^ ((t.w14 >> 7)&1)) | (((p.w14 >> 6)&1) ^ ((t.w14 >> 6)&1)) ;
	int dst_482 = (((p.w14 >> 5)&1) ^ ((t.w14 >> 5)&1)) | (((p.w14 >> 4)&1) ^ ((t.w14 >> 4)&1)) ;
	int dst_481 = (((p.w14 >> 3)&1) ^ ((t.w14 >> 3)&1)) | (((p.w14 >> 2)&1) ^ ((t.w14 >> 2)&1)) ;
	int dst_480 = (((p.w14 >> 1)&1) ^ ((t.w14 >> 1)&1)) | (((p.w14 >> 0)&1) ^ ((t.w14 >> 0)&1)) ;
	int dst_479 = (((p.w13 >> 31)&1) ^ ((t.w13 >> 31)&1)) | (((p.w13 >> 30)&1) ^ ((t.w13 >> 30)&1)) ;
	int dst_478 = (((p.w13 >> 29)&1) ^ ((t.w13 >> 29)&1)) | (((p.w13 >> 28)&1) ^ ((t.w13 >> 28)&1)) ;
	int dst_477 = (((p.w13 >> 27)&1) ^ ((t.w13 >> 27)&1)) | (((p.w13 >> 26)&1) ^ ((t.w13 >> 26)&1)) ;
	int dst_476 = (((p.w13 >> 25)&1) ^ ((t.w13 >> 25)&1)) | (((p.w13 >> 24)&1) ^ ((t.w13 >> 24)&1)) ;
	int dst_475 = (((p.w13 >> 23)&1) ^ ((t.w13 >> 23)&1)) | (((p.w13 >> 22)&1) ^ ((t.w13 >> 22)&1)) ;
	int dst_474 = (((p.w13 >> 21)&1) ^ ((t.w13 >> 21)&1)) | (((p.w13 >> 20)&1) ^ ((t.w13 >> 20)&1)) ;
	int dst_473 = (((p.w13 >> 19)&1) ^ ((t.w13 >> 19)&1)) | (((p.w13 >> 18)&1) ^ ((t.w13 >> 18)&1)) ;
	int dst_472 = (((p.w13 >> 17)&1) ^ ((t.w13 >> 17)&1)) | (((p.w13 >> 16)&1) ^ ((t.w13 >> 16)&1)) ;
	int dst_471 = (((p.w13 >> 15)&1) ^ ((t.w13 >> 15)&1)) | (((p.w13 >> 14)&1) ^ ((t.w13 >> 14)&1)) ;
	int dst_470 = (((p.w13 >> 13)&1) ^ ((t.w13 >> 13)&1)) | (((p.w13 >> 12)&1) ^ ((t.w13 >> 12)&1)) ;
	int dst_469 = (((p.w13 >> 11)&1) ^ ((t.w13 >> 11)&1)) | (((p.w13 >> 10)&1) ^ ((t.w13 >> 10)&1)) ;
	int dst_468 = (((p.w13 >> 9)&1) ^ ((t.w13 >> 9)&1)) | (((p.w13 >> 8)&1) ^ ((t.w13 >> 8)&1)) ;
	int dst_467 = (((p.w13 >> 7)&1) ^ ((t.w13 >> 7)&1)) | (((p.w13 >> 6)&1) ^ ((t.w13 >> 6)&1)) ;
	int dst_466 = (((p.w13 >> 5)&1) ^ ((t.w13 >> 5)&1)) | (((p.w13 >> 4)&1) ^ ((t.w13 >> 4)&1)) ;
	int dst_465 = (((p.w13 >> 3)&1) ^ ((t.w13 >> 3)&1)) | (((p.w13 >> 2)&1) ^ ((t.w13 >> 2)&1)) ;
	int dst_464 = (((p.w13 >> 1)&1) ^ ((t.w13 >> 1)&1)) | (((p.w13 >> 0)&1) ^ ((t.w13 >> 0)&1)) ;
	int dst_463 = (((p.w12 >> 31)&1) ^ ((t.w12 >> 31)&1)) | (((p.w12 >> 30)&1) ^ ((t.w12 >> 30)&1)) ;
	int dst_462 = (((p.w12 >> 29)&1) ^ ((t.w12 >> 29)&1)) | (((p.w12 >> 28)&1) ^ ((t.w12 >> 28)&1)) ;
	int dst_461 = (((p.w12 >> 27)&1) ^ ((t.w12 >> 27)&1)) | (((p.w12 >> 26)&1) ^ ((t.w12 >> 26)&1)) ;
	int dst_460 = (((p.w12 >> 25)&1) ^ ((t.w12 >> 25)&1)) | (((p.w12 >> 24)&1) ^ ((t.w12 >> 24)&1)) ;
	int dst_459 = (((p.w12 >> 23)&1) ^ ((t.w12 >> 23)&1)) | (((p.w12 >> 22)&1) ^ ((t.w12 >> 22)&1)) ;
	int dst_458 = (((p.w12 >> 21)&1) ^ ((t.w12 >> 21)&1)) | (((p.w12 >> 20)&1) ^ ((t.w12 >> 20)&1)) ;
	int dst_457 = (((p.w12 >> 19)&1) ^ ((t.w12 >> 19)&1)) | (((p.w12 >> 18)&1) ^ ((t.w12 >> 18)&1)) ;
	int dst_456 = (((p.w12 >> 17)&1) ^ ((t.w12 >> 17)&1)) | (((p.w12 >> 16)&1) ^ ((t.w12 >> 16)&1)) ;
	int dst_455 = (((p.w12 >> 15)&1) ^ ((t.w12 >> 15)&1)) | (((p.w12 >> 14)&1) ^ ((t.w12 >> 14)&1)) ;
	int dst_454 = (((p.w12 >> 13)&1) ^ ((t.w12 >> 13)&1)) | (((p.w12 >> 12)&1) ^ ((t.w12 >> 12)&1)) ;
	int dst_453 = (((p.w12 >> 11)&1) ^ ((t.w12 >> 11)&1)) | (((p.w12 >> 10)&1) ^ ((t.w12 >> 10)&1)) ;
	int dst_452 = (((p.w12 >> 9)&1) ^ ((t.w12 >> 9)&1)) | (((p.w12 >> 8)&1) ^ ((t.w12 >> 8)&1)) ;
	int dst_451 = (((p.w12 >> 7)&1) ^ ((t.w12 >> 7)&1)) | (((p.w12 >> 6)&1) ^ ((t.w12 >> 6)&1)) ;
	int dst_450 = (((p.w12 >> 5)&1) ^ ((t.w12 >> 5)&1)) | (((p.w12 >> 4)&1) ^ ((t.w12 >> 4)&1)) ;
	int dst_449 = (((p.w12 >> 3)&1) ^ ((t.w12 >> 3)&1)) | (((p.w12 >> 2)&1) ^ ((t.w12 >> 2)&1)) ;
	int dst_448 = (((p.w12 >> 1)&1) ^ ((t.w12 >> 1)&1)) | (((p.w12 >> 0)&1) ^ ((t.w12 >> 0)&1)) ;
	int dst_447 = (((p.w11 >> 31)&1) ^ ((t.w11 >> 31)&1)) | (((p.w11 >> 30)&1) ^ ((t.w11 >> 30)&1)) ;
	int dst_446 = (((p.w11 >> 29)&1) ^ ((t.w11 >> 29)&1)) | (((p.w11 >> 28)&1) ^ ((t.w11 >> 28)&1)) ;
	int dst_445 = (((p.w11 >> 27)&1) ^ ((t.w11 >> 27)&1)) | (((p.w11 >> 26)&1) ^ ((t.w11 >> 26)&1)) ;
	int dst_444 = (((p.w11 >> 25)&1) ^ ((t.w11 >> 25)&1)) | (((p.w11 >> 24)&1) ^ ((t.w11 >> 24)&1)) ;
	int dst_443 = (((p.w11 >> 23)&1) ^ ((t.w11 >> 23)&1)) | (((p.w11 >> 22)&1) ^ ((t.w11 >> 22)&1)) ;
	int dst_442 = (((p.w11 >> 21)&1) ^ ((t.w11 >> 21)&1)) | (((p.w11 >> 20)&1) ^ ((t.w11 >> 20)&1)) ;
	int dst_441 = (((p.w11 >> 19)&1) ^ ((t.w11 >> 19)&1)) | (((p.w11 >> 18)&1) ^ ((t.w11 >> 18)&1)) ;
	int dst_440 = (((p.w11 >> 17)&1) ^ ((t.w11 >> 17)&1)) | (((p.w11 >> 16)&1) ^ ((t.w11 >> 16)&1)) ;
	int dst_439 = (((p.w11 >> 15)&1) ^ ((t.w11 >> 15)&1)) | (((p.w11 >> 14)&1) ^ ((t.w11 >> 14)&1)) ;
	int dst_438 = (((p.w11 >> 13)&1) ^ ((t.w11 >> 13)&1)) | (((p.w11 >> 12)&1) ^ ((t.w11 >> 12)&1)) ;
	int dst_437 = (((p.w11 >> 11)&1) ^ ((t.w11 >> 11)&1)) | (((p.w11 >> 10)&1) ^ ((t.w11 >> 10)&1)) ;
	int dst_436 = (((p.w11 >> 9)&1) ^ ((t.w11 >> 9)&1)) | (((p.w11 >> 8)&1) ^ ((t.w11 >> 8)&1)) ;
	int dst_435 = (((p.w11 >> 7)&1) ^ ((t.w11 >> 7)&1)) | (((p.w11 >> 6)&1) ^ ((t.w11 >> 6)&1)) ;
	int dst_434 = (((p.w11 >> 5)&1) ^ ((t.w11 >> 5)&1)) | (((p.w11 >> 4)&1) ^ ((t.w11 >> 4)&1)) ;
	int dst_433 = (((p.w11 >> 3)&1) ^ ((t.w11 >> 3)&1)) | (((p.w11 >> 2)&1) ^ ((t.w11 >> 2)&1)) ;
	int dst_432 = (((p.w11 >> 1)&1) ^ ((t.w11 >> 1)&1)) | (((p.w11 >> 0)&1) ^ ((t.w11 >> 0)&1)) ;
	int dst_431 = (((p.w10 >> 31)&1) ^ ((t.w10 >> 31)&1)) | (((p.w10 >> 30)&1) ^ ((t.w10 >> 30)&1)) ;
	int dst_430 = (((p.w10 >> 29)&1) ^ ((t.w10 >> 29)&1)) | (((p.w10 >> 28)&1) ^ ((t.w10 >> 28)&1)) ;
	int dst_429 = (((p.w10 >> 27)&1) ^ ((t.w10 >> 27)&1)) | (((p.w10 >> 26)&1) ^ ((t.w10 >> 26)&1)) ;
	int dst_428 = (((p.w10 >> 25)&1) ^ ((t.w10 >> 25)&1)) | (((p.w10 >> 24)&1) ^ ((t.w10 >> 24)&1)) ;
	int dst_427 = (((p.w10 >> 23)&1) ^ ((t.w10 >> 23)&1)) | (((p.w10 >> 22)&1) ^ ((t.w10 >> 22)&1)) ;
	int dst_426 = (((p.w10 >> 21)&1) ^ ((t.w10 >> 21)&1)) | (((p.w10 >> 20)&1) ^ ((t.w10 >> 20)&1)) ;
	int dst_425 = (((p.w10 >> 19)&1) ^ ((t.w10 >> 19)&1)) | (((p.w10 >> 18)&1) ^ ((t.w10 >> 18)&1)) ;
	int dst_424 = (((p.w10 >> 17)&1) ^ ((t.w10 >> 17)&1)) | (((p.w10 >> 16)&1) ^ ((t.w10 >> 16)&1)) ;
	int dst_423 = (((p.w10 >> 15)&1) ^ ((t.w10 >> 15)&1)) | (((p.w10 >> 14)&1) ^ ((t.w10 >> 14)&1)) ;
	int dst_422 = (((p.w10 >> 13)&1) ^ ((t.w10 >> 13)&1)) | (((p.w10 >> 12)&1) ^ ((t.w10 >> 12)&1)) ;
	int dst_421 = (((p.w10 >> 11)&1) ^ ((t.w10 >> 11)&1)) | (((p.w10 >> 10)&1) ^ ((t.w10 >> 10)&1)) ;
	int dst_420 = (((p.w10 >> 9)&1) ^ ((t.w10 >> 9)&1)) | (((p.w10 >> 8)&1) ^ ((t.w10 >> 8)&1)) ;
	int dst_419 = (((p.w10 >> 7)&1) ^ ((t.w10 >> 7)&1)) | (((p.w10 >> 6)&1) ^ ((t.w10 >> 6)&1)) ;
	int dst_418 = (((p.w10 >> 5)&1) ^ ((t.w10 >> 5)&1)) | (((p.w10 >> 4)&1) ^ ((t.w10 >> 4)&1)) ;
	int dst_417 = (((p.w10 >> 3)&1) ^ ((t.w10 >> 3)&1)) | (((p.w10 >> 2)&1) ^ ((t.w10 >> 2)&1)) ;
	int dst_416 = (((p.w10 >> 1)&1) ^ ((t.w10 >> 1)&1)) | (((p.w10 >> 0)&1) ^ ((t.w10 >> 0)&1)) ;
	int dst_415 = (((p.w9 >> 31)&1) ^ ((t.w9 >> 31)&1)) | (((p.w9 >> 30)&1) ^ ((t.w9 >> 30)&1)) ;
	int dst_414 = (((p.w9 >> 29)&1) ^ ((t.w9 >> 29)&1)) | (((p.w9 >> 28)&1) ^ ((t.w9 >> 28)&1)) ;
	int dst_413 = (((p.w9 >> 27)&1) ^ ((t.w9 >> 27)&1)) | (((p.w9 >> 26)&1) ^ ((t.w9 >> 26)&1)) ;
	int dst_412 = (((p.w9 >> 25)&1) ^ ((t.w9 >> 25)&1)) | (((p.w9 >> 24)&1) ^ ((t.w9 >> 24)&1)) ;
	int dst_411 = (((p.w9 >> 23)&1) ^ ((t.w9 >> 23)&1)) | (((p.w9 >> 22)&1) ^ ((t.w9 >> 22)&1)) ;
	int dst_410 = (((p.w9 >> 21)&1) ^ ((t.w9 >> 21)&1)) | (((p.w9 >> 20)&1) ^ ((t.w9 >> 20)&1)) ;
	int dst_409 = (((p.w9 >> 19)&1) ^ ((t.w9 >> 19)&1)) | (((p.w9 >> 18)&1) ^ ((t.w9 >> 18)&1)) ;
	int dst_408 = (((p.w9 >> 17)&1) ^ ((t.w9 >> 17)&1)) | (((p.w9 >> 16)&1) ^ ((t.w9 >> 16)&1)) ;
	int dst_407 = (((p.w9 >> 15)&1) ^ ((t.w9 >> 15)&1)) | (((p.w9 >> 14)&1) ^ ((t.w9 >> 14)&1)) ;
	int dst_406 = (((p.w9 >> 13)&1) ^ ((t.w9 >> 13)&1)) | (((p.w9 >> 12)&1) ^ ((t.w9 >> 12)&1)) ;
	int dst_405 = (((p.w9 >> 11)&1) ^ ((t.w9 >> 11)&1)) | (((p.w9 >> 10)&1) ^ ((t.w9 >> 10)&1)) ;
	int dst_404 = (((p.w9 >> 9)&1) ^ ((t.w9 >> 9)&1)) | (((p.w9 >> 8)&1) ^ ((t.w9 >> 8)&1)) ;
	int dst_403 = (((p.w9 >> 7)&1) ^ ((t.w9 >> 7)&1)) | (((p.w9 >> 6)&1) ^ ((t.w9 >> 6)&1)) ;
	int dst_402 = (((p.w9 >> 5)&1) ^ ((t.w9 >> 5)&1)) | (((p.w9 >> 4)&1) ^ ((t.w9 >> 4)&1)) ;
	int dst_401 = (((p.w9 >> 3)&1) ^ ((t.w9 >> 3)&1)) | (((p.w9 >> 2)&1) ^ ((t.w9 >> 2)&1)) ;
	int dst_400 = (((p.w9 >> 1)&1) ^ ((t.w9 >> 1)&1)) | (((p.w9 >> 0)&1) ^ ((t.w9 >> 0)&1)) ;
	int dst_399 = (((p.w8 >> 31)&1) ^ ((t.w8 >> 31)&1)) | (((p.w8 >> 30)&1) ^ ((t.w8 >> 30)&1)) ;
	int dst_398 = (((p.w8 >> 29)&1) ^ ((t.w8 >> 29)&1)) | (((p.w8 >> 28)&1) ^ ((t.w8 >> 28)&1)) ;
	int dst_397 = (((p.w8 >> 27)&1) ^ ((t.w8 >> 27)&1)) | (((p.w8 >> 26)&1) ^ ((t.w8 >> 26)&1)) ;
	int dst_396 = (((p.w8 >> 25)&1) ^ ((t.w8 >> 25)&1)) | (((p.w8 >> 24)&1) ^ ((t.w8 >> 24)&1)) ;
	int dst_395 = (((p.w8 >> 23)&1) ^ ((t.w8 >> 23)&1)) | (((p.w8 >> 22)&1) ^ ((t.w8 >> 22)&1)) ;
	int dst_394 = (((p.w8 >> 21)&1) ^ ((t.w8 >> 21)&1)) | (((p.w8 >> 20)&1) ^ ((t.w8 >> 20)&1)) ;
	int dst_393 = (((p.w8 >> 19)&1) ^ ((t.w8 >> 19)&1)) | (((p.w8 >> 18)&1) ^ ((t.w8 >> 18)&1)) ;
	int dst_392 = (((p.w8 >> 17)&1) ^ ((t.w8 >> 17)&1)) | (((p.w8 >> 16)&1) ^ ((t.w8 >> 16)&1)) ;
	int dst_391 = (((p.w8 >> 15)&1) ^ ((t.w8 >> 15)&1)) | (((p.w8 >> 14)&1) ^ ((t.w8 >> 14)&1)) ;
	int dst_390 = (((p.w8 >> 13)&1) ^ ((t.w8 >> 13)&1)) | (((p.w8 >> 12)&1) ^ ((t.w8 >> 12)&1)) ;
	int dst_389 = (((p.w8 >> 11)&1) ^ ((t.w8 >> 11)&1)) | (((p.w8 >> 10)&1) ^ ((t.w8 >> 10)&1)) ;
	int dst_388 = (((p.w8 >> 9)&1) ^ ((t.w8 >> 9)&1)) | (((p.w8 >> 8)&1) ^ ((t.w8 >> 8)&1)) ;
	int dst_387 = (((p.w8 >> 7)&1) ^ ((t.w8 >> 7)&1)) | (((p.w8 >> 6)&1) ^ ((t.w8 >> 6)&1)) ;
	int dst_386 = (((p.w8 >> 5)&1) ^ ((t.w8 >> 5)&1)) | (((p.w8 >> 4)&1) ^ ((t.w8 >> 4)&1)) ;
	int dst_385 = (((p.w8 >> 3)&1) ^ ((t.w8 >> 3)&1)) | (((p.w8 >> 2)&1) ^ ((t.w8 >> 2)&1)) ;
	int dst_384 = (((p.w8 >> 1)&1) ^ ((t.w8 >> 1)&1)) | (((p.w8 >> 0)&1) ^ ((t.w8 >> 0)&1)) ;
	int dst_383 = (((p.w7 >> 31)&1) ^ ((t.w7 >> 31)&1)) | (((p.w7 >> 30)&1) ^ ((t.w7 >> 30)&1)) ;
	int dst_382 = (((p.w7 >> 29)&1) ^ ((t.w7 >> 29)&1)) | (((p.w7 >> 28)&1) ^ ((t.w7 >> 28)&1)) ;
	int dst_381 = (((p.w7 >> 27)&1) ^ ((t.w7 >> 27)&1)) | (((p.w7 >> 26)&1) ^ ((t.w7 >> 26)&1)) ;
	int dst_380 = (((p.w7 >> 25)&1) ^ ((t.w7 >> 25)&1)) | (((p.w7 >> 24)&1) ^ ((t.w7 >> 24)&1)) ;
	int dst_379 = (((p.w7 >> 23)&1) ^ ((t.w7 >> 23)&1)) | (((p.w7 >> 22)&1) ^ ((t.w7 >> 22)&1)) ;
	int dst_378 = (((p.w7 >> 21)&1) ^ ((t.w7 >> 21)&1)) | (((p.w7 >> 20)&1) ^ ((t.w7 >> 20)&1)) ;
	int dst_377 = (((p.w7 >> 19)&1) ^ ((t.w7 >> 19)&1)) | (((p.w7 >> 18)&1) ^ ((t.w7 >> 18)&1)) ;
	int dst_376 = (((p.w7 >> 17)&1) ^ ((t.w7 >> 17)&1)) | (((p.w7 >> 16)&1) ^ ((t.w7 >> 16)&1)) ;
	int dst_375 = (((p.w7 >> 15)&1) ^ ((t.w7 >> 15)&1)) | (((p.w7 >> 14)&1) ^ ((t.w7 >> 14)&1)) ;
	int dst_374 = (((p.w7 >> 13)&1) ^ ((t.w7 >> 13)&1)) | (((p.w7 >> 12)&1) ^ ((t.w7 >> 12)&1)) ;
	int dst_373 = (((p.w7 >> 11)&1) ^ ((t.w7 >> 11)&1)) | (((p.w7 >> 10)&1) ^ ((t.w7 >> 10)&1)) ;
	int dst_372 = (((p.w7 >> 9)&1) ^ ((t.w7 >> 9)&1)) | (((p.w7 >> 8)&1) ^ ((t.w7 >> 8)&1)) ;
	int dst_371 = (((p.w7 >> 7)&1) ^ ((t.w7 >> 7)&1)) | (((p.w7 >> 6)&1) ^ ((t.w7 >> 6)&1)) ;
	int dst_370 = (((p.w7 >> 5)&1) ^ ((t.w7 >> 5)&1)) | (((p.w7 >> 4)&1) ^ ((t.w7 >> 4)&1)) ;
	int dst_369 = (((p.w7 >> 3)&1) ^ ((t.w7 >> 3)&1)) | (((p.w7 >> 2)&1) ^ ((t.w7 >> 2)&1)) ;
	int dst_368 = (((p.w7 >> 1)&1) ^ ((t.w7 >> 1)&1)) | (((p.w7 >> 0)&1) ^ ((t.w7 >> 0)&1)) ;
	int dst_367 = (((p.w6 >> 31)&1) ^ ((t.w6 >> 31)&1)) | (((p.w6 >> 30)&1) ^ ((t.w6 >> 30)&1)) ;
	int dst_366 = (((p.w6 >> 29)&1) ^ ((t.w6 >> 29)&1)) | (((p.w6 >> 28)&1) ^ ((t.w6 >> 28)&1)) ;
	int dst_365 = (((p.w6 >> 27)&1) ^ ((t.w6 >> 27)&1)) | (((p.w6 >> 26)&1) ^ ((t.w6 >> 26)&1)) ;
	int dst_364 = (((p.w6 >> 25)&1) ^ ((t.w6 >> 25)&1)) | (((p.w6 >> 24)&1) ^ ((t.w6 >> 24)&1)) ;
	int dst_363 = (((p.w6 >> 23)&1) ^ ((t.w6 >> 23)&1)) | (((p.w6 >> 22)&1) ^ ((t.w6 >> 22)&1)) ;
	int dst_362 = (((p.w6 >> 21)&1) ^ ((t.w6 >> 21)&1)) | (((p.w6 >> 20)&1) ^ ((t.w6 >> 20)&1)) ;
	int dst_361 = (((p.w6 >> 19)&1) ^ ((t.w6 >> 19)&1)) | (((p.w6 >> 18)&1) ^ ((t.w6 >> 18)&1)) ;
	int dst_360 = (((p.w6 >> 17)&1) ^ ((t.w6 >> 17)&1)) | (((p.w6 >> 16)&1) ^ ((t.w6 >> 16)&1)) ;
	int dst_359 = (((p.w6 >> 15)&1) ^ ((t.w6 >> 15)&1)) | (((p.w6 >> 14)&1) ^ ((t.w6 >> 14)&1)) ;
	int dst_358 = (((p.w6 >> 13)&1) ^ ((t.w6 >> 13)&1)) | (((p.w6 >> 12)&1) ^ ((t.w6 >> 12)&1)) ;
	int dst_357 = (((p.w6 >> 11)&1) ^ ((t.w6 >> 11)&1)) | (((p.w6 >> 10)&1) ^ ((t.w6 >> 10)&1)) ;
	int dst_356 = (((p.w6 >> 9)&1) ^ ((t.w6 >> 9)&1)) | (((p.w6 >> 8)&1) ^ ((t.w6 >> 8)&1)) ;
	int dst_355 = (((p.w6 >> 7)&1) ^ ((t.w6 >> 7)&1)) | (((p.w6 >> 6)&1) ^ ((t.w6 >> 6)&1)) ;
	int dst_354 = (((p.w6 >> 5)&1) ^ ((t.w6 >> 5)&1)) | (((p.w6 >> 4)&1) ^ ((t.w6 >> 4)&1)) ;
	int dst_353 = (((p.w6 >> 3)&1) ^ ((t.w6 >> 3)&1)) | (((p.w6 >> 2)&1) ^ ((t.w6 >> 2)&1)) ;
	int dst_352 = (((p.w6 >> 1)&1) ^ ((t.w6 >> 1)&1)) | (((p.w6 >> 0)&1) ^ ((t.w6 >> 0)&1)) ;
	int dst_351 = (((p.w5 >> 31)&1) ^ ((t.w5 >> 31)&1)) | (((p.w5 >> 30)&1) ^ ((t.w5 >> 30)&1)) ;
	int dst_350 = (((p.w5 >> 29)&1) ^ ((t.w5 >> 29)&1)) | (((p.w5 >> 28)&1) ^ ((t.w5 >> 28)&1)) ;
	int dst_349 = (((p.w5 >> 27)&1) ^ ((t.w5 >> 27)&1)) | (((p.w5 >> 26)&1) ^ ((t.w5 >> 26)&1)) ;
	int dst_348 = (((p.w5 >> 25)&1) ^ ((t.w5 >> 25)&1)) | (((p.w5 >> 24)&1) ^ ((t.w5 >> 24)&1)) ;
	int dst_347 = (((p.w5 >> 23)&1) ^ ((t.w5 >> 23)&1)) | (((p.w5 >> 22)&1) ^ ((t.w5 >> 22)&1)) ;
	int dst_346 = (((p.w5 >> 21)&1) ^ ((t.w5 >> 21)&1)) | (((p.w5 >> 20)&1) ^ ((t.w5 >> 20)&1)) ;
	int dst_345 = (((p.w5 >> 19)&1) ^ ((t.w5 >> 19)&1)) | (((p.w5 >> 18)&1) ^ ((t.w5 >> 18)&1)) ;
	int dst_344 = (((p.w5 >> 17)&1) ^ ((t.w5 >> 17)&1)) | (((p.w5 >> 16)&1) ^ ((t.w5 >> 16)&1)) ;
	int dst_343 = (((p.w5 >> 15)&1) ^ ((t.w5 >> 15)&1)) | (((p.w5 >> 14)&1) ^ ((t.w5 >> 14)&1)) ;
	int dst_342 = (((p.w5 >> 13)&1) ^ ((t.w5 >> 13)&1)) | (((p.w5 >> 12)&1) ^ ((t.w5 >> 12)&1)) ;
	int dst_341 = (((p.w5 >> 11)&1) ^ ((t.w5 >> 11)&1)) | (((p.w5 >> 10)&1) ^ ((t.w5 >> 10)&1)) ;
	int dst_340 = (((p.w5 >> 9)&1) ^ ((t.w5 >> 9)&1)) | (((p.w5 >> 8)&1) ^ ((t.w5 >> 8)&1)) ;
	int dst_339 = (((p.w5 >> 7)&1) ^ ((t.w5 >> 7)&1)) | (((p.w5 >> 6)&1) ^ ((t.w5 >> 6)&1)) ;
	int dst_338 = (((p.w5 >> 5)&1) ^ ((t.w5 >> 5)&1)) | (((p.w5 >> 4)&1) ^ ((t.w5 >> 4)&1)) ;
	int dst_337 = (((p.w5 >> 3)&1) ^ ((t.w5 >> 3)&1)) | (((p.w5 >> 2)&1) ^ ((t.w5 >> 2)&1)) ;
	int dst_336 = (((p.w5 >> 1)&1) ^ ((t.w5 >> 1)&1)) | (((p.w5 >> 0)&1) ^ ((t.w5 >> 0)&1)) ;
	int dst_335 = (((p.w4 >> 31)&1) ^ ((t.w4 >> 31)&1)) | (((p.w4 >> 30)&1) ^ ((t.w4 >> 30)&1)) ;
	int dst_334 = (((p.w4 >> 29)&1) ^ ((t.w4 >> 29)&1)) | (((p.w4 >> 28)&1) ^ ((t.w4 >> 28)&1)) ;
	int dst_333 = (((p.w4 >> 27)&1) ^ ((t.w4 >> 27)&1)) | (((p.w4 >> 26)&1) ^ ((t.w4 >> 26)&1)) ;
	int dst_332 = (((p.w4 >> 25)&1) ^ ((t.w4 >> 25)&1)) | (((p.w4 >> 24)&1) ^ ((t.w4 >> 24)&1)) ;
	int dst_331 = (((p.w4 >> 23)&1) ^ ((t.w4 >> 23)&1)) | (((p.w4 >> 22)&1) ^ ((t.w4 >> 22)&1)) ;
	int dst_330 = (((p.w4 >> 21)&1) ^ ((t.w4 >> 21)&1)) | (((p.w4 >> 20)&1) ^ ((t.w4 >> 20)&1)) ;
	int dst_329 = (((p.w4 >> 19)&1) ^ ((t.w4 >> 19)&1)) | (((p.w4 >> 18)&1) ^ ((t.w4 >> 18)&1)) ;
	int dst_328 = (((p.w4 >> 17)&1) ^ ((t.w4 >> 17)&1)) | (((p.w4 >> 16)&1) ^ ((t.w4 >> 16)&1)) ;
	int dst_327 = (((p.w4 >> 15)&1) ^ ((t.w4 >> 15)&1)) | (((p.w4 >> 14)&1) ^ ((t.w4 >> 14)&1)) ;
	int dst_326 = (((p.w4 >> 13)&1) ^ ((t.w4 >> 13)&1)) | (((p.w4 >> 12)&1) ^ ((t.w4 >> 12)&1)) ;
	int dst_325 = (((p.w4 >> 11)&1) ^ ((t.w4 >> 11)&1)) | (((p.w4 >> 10)&1) ^ ((t.w4 >> 10)&1)) ;
	int dst_324 = (((p.w4 >> 9)&1) ^ ((t.w4 >> 9)&1)) | (((p.w4 >> 8)&1) ^ ((t.w4 >> 8)&1)) ;
	int dst_323 = (((p.w4 >> 7)&1) ^ ((t.w4 >> 7)&1)) | (((p.w4 >> 6)&1) ^ ((t.w4 >> 6)&1)) ;
	int dst_322 = (((p.w4 >> 5)&1) ^ ((t.w4 >> 5)&1)) | (((p.w4 >> 4)&1) ^ ((t.w4 >> 4)&1)) ;
	int dst_321 = (((p.w4 >> 3)&1) ^ ((t.w4 >> 3)&1)) | (((p.w4 >> 2)&1) ^ ((t.w4 >> 2)&1)) ;
	int dst_320 = (((p.w4 >> 1)&1) ^ ((t.w4 >> 1)&1)) | (((p.w4 >> 0)&1) ^ ((t.w4 >> 0)&1)) ;
	int dst_319 = (((p.w3 >> 31)&1) ^ ((t.w3 >> 31)&1)) | (((p.w3 >> 30)&1) ^ ((t.w3 >> 30)&1)) ;
	int dst_318 = (((p.w3 >> 29)&1) ^ ((t.w3 >> 29)&1)) | (((p.w3 >> 28)&1) ^ ((t.w3 >> 28)&1)) ;
	int dst_317 = (((p.w3 >> 27)&1) ^ ((t.w3 >> 27)&1)) | (((p.w3 >> 26)&1) ^ ((t.w3 >> 26)&1)) ;
	int dst_316 = (((p.w3 >> 25)&1) ^ ((t.w3 >> 25)&1)) | (((p.w3 >> 24)&1) ^ ((t.w3 >> 24)&1)) ;
	int dst_315 = (((p.w3 >> 23)&1) ^ ((t.w3 >> 23)&1)) | (((p.w3 >> 22)&1) ^ ((t.w3 >> 22)&1)) ;
	int dst_314 = (((p.w3 >> 21)&1) ^ ((t.w3 >> 21)&1)) | (((p.w3 >> 20)&1) ^ ((t.w3 >> 20)&1)) ;
	int dst_313 = (((p.w3 >> 19)&1) ^ ((t.w3 >> 19)&1)) | (((p.w3 >> 18)&1) ^ ((t.w3 >> 18)&1)) ;
	int dst_312 = (((p.w3 >> 17)&1) ^ ((t.w3 >> 17)&1)) | (((p.w3 >> 16)&1) ^ ((t.w3 >> 16)&1)) ;
	int dst_311 = (((p.w3 >> 15)&1) ^ ((t.w3 >> 15)&1)) | (((p.w3 >> 14)&1) ^ ((t.w3 >> 14)&1)) ;
	int dst_310 = (((p.w3 >> 13)&1) ^ ((t.w3 >> 13)&1)) | (((p.w3 >> 12)&1) ^ ((t.w3 >> 12)&1)) ;
	int dst_309 = (((p.w3 >> 11)&1) ^ ((t.w3 >> 11)&1)) | (((p.w3 >> 10)&1) ^ ((t.w3 >> 10)&1)) ;
	int dst_308 = (((p.w3 >> 9)&1) ^ ((t.w3 >> 9)&1)) | (((p.w3 >> 8)&1) ^ ((t.w3 >> 8)&1)) ;
	int dst_307 = (((p.w3 >> 7)&1) ^ ((t.w3 >> 7)&1)) | (((p.w3 >> 6)&1) ^ ((t.w3 >> 6)&1)) ;
	int dst_306 = (((p.w3 >> 5)&1) ^ ((t.w3 >> 5)&1)) | (((p.w3 >> 4)&1) ^ ((t.w3 >> 4)&1)) ;
	int dst_305 = (((p.w3 >> 3)&1) ^ ((t.w3 >> 3)&1)) | (((p.w3 >> 2)&1) ^ ((t.w3 >> 2)&1)) ;
	int dst_304 = (((p.w3 >> 1)&1) ^ ((t.w3 >> 1)&1)) | (((p.w3 >> 0)&1) ^ ((t.w3 >> 0)&1)) ;
	int dst_303 = (((p.w2 >> 31)&1) ^ ((t.w2 >> 31)&1)) | (((p.w2 >> 30)&1) ^ ((t.w2 >> 30)&1)) ;
	int dst_302 = (((p.w2 >> 29)&1) ^ ((t.w2 >> 29)&1)) | (((p.w2 >> 28)&1) ^ ((t.w2 >> 28)&1)) ;
	int dst_301 = (((p.w2 >> 27)&1) ^ ((t.w2 >> 27)&1)) | (((p.w2 >> 26)&1) ^ ((t.w2 >> 26)&1)) ;
	int dst_300 = (((p.w2 >> 25)&1) ^ ((t.w2 >> 25)&1)) | (((p.w2 >> 24)&1) ^ ((t.w2 >> 24)&1)) ;
	int dst_299 = (((p.w2 >> 23)&1) ^ ((t.w2 >> 23)&1)) | (((p.w2 >> 22)&1) ^ ((t.w2 >> 22)&1)) ;
	int dst_298 = (((p.w2 >> 21)&1) ^ ((t.w2 >> 21)&1)) | (((p.w2 >> 20)&1) ^ ((t.w2 >> 20)&1)) ;
	int dst_297 = (((p.w2 >> 19)&1) ^ ((t.w2 >> 19)&1)) | (((p.w2 >> 18)&1) ^ ((t.w2 >> 18)&1)) ;
	int dst_296 = (((p.w2 >> 17)&1) ^ ((t.w2 >> 17)&1)) | (((p.w2 >> 16)&1) ^ ((t.w2 >> 16)&1)) ;
	int dst_295 = (((p.w2 >> 15)&1) ^ ((t.w2 >> 15)&1)) | (((p.w2 >> 14)&1) ^ ((t.w2 >> 14)&1)) ;
	int dst_294 = (((p.w2 >> 13)&1) ^ ((t.w2 >> 13)&1)) | (((p.w2 >> 12)&1) ^ ((t.w2 >> 12)&1)) ;
	int dst_293 = (((p.w2 >> 11)&1) ^ ((t.w2 >> 11)&1)) | (((p.w2 >> 10)&1) ^ ((t.w2 >> 10)&1)) ;
	int dst_292 = (((p.w2 >> 9)&1) ^ ((t.w2 >> 9)&1)) | (((p.w2 >> 8)&1) ^ ((t.w2 >> 8)&1)) ;
	int dst_291 = (((p.w2 >> 7)&1) ^ ((t.w2 >> 7)&1)) | (((p.w2 >> 6)&1) ^ ((t.w2 >> 6)&1)) ;
	int dst_290 = (((p.w2 >> 5)&1) ^ ((t.w2 >> 5)&1)) | (((p.w2 >> 4)&1) ^ ((t.w2 >> 4)&1)) ;
	int dst_289 = (((p.w2 >> 3)&1) ^ ((t.w2 >> 3)&1)) | (((p.w2 >> 2)&1) ^ ((t.w2 >> 2)&1)) ;
	int dst_288 = (((p.w2 >> 1)&1) ^ ((t.w2 >> 1)&1)) | (((p.w2 >> 0)&1) ^ ((t.w2 >> 0)&1)) ;
	int dst_287 = (((p.w1 >> 31)&1) ^ ((t.w1 >> 31)&1)) | (((p.w1 >> 30)&1) ^ ((t.w1 >> 30)&1)) ;
	int dst_286 = (((p.w1 >> 29)&1) ^ ((t.w1 >> 29)&1)) | (((p.w1 >> 28)&1) ^ ((t.w1 >> 28)&1)) ;
	int dst_285 = (((p.w1 >> 27)&1) ^ ((t.w1 >> 27)&1)) | (((p.w1 >> 26)&1) ^ ((t.w1 >> 26)&1)) ;
	int dst_284 = (((p.w1 >> 25)&1) ^ ((t.w1 >> 25)&1)) | (((p.w1 >> 24)&1) ^ ((t.w1 >> 24)&1)) ;
	int dst_283 = (((p.w1 >> 23)&1) ^ ((t.w1 >> 23)&1)) | (((p.w1 >> 22)&1) ^ ((t.w1 >> 22)&1)) ;
	int dst_282 = (((p.w1 >> 21)&1) ^ ((t.w1 >> 21)&1)) | (((p.w1 >> 20)&1) ^ ((t.w1 >> 20)&1)) ;
	int dst_281 = (((p.w1 >> 19)&1) ^ ((t.w1 >> 19)&1)) | (((p.w1 >> 18)&1) ^ ((t.w1 >> 18)&1)) ;
	int dst_280 = (((p.w1 >> 17)&1) ^ ((t.w1 >> 17)&1)) | (((p.w1 >> 16)&1) ^ ((t.w1 >> 16)&1)) ;
	int dst_279 = (((p.w1 >> 15)&1) ^ ((t.w1 >> 15)&1)) | (((p.w1 >> 14)&1) ^ ((t.w1 >> 14)&1)) ;
	int dst_278 = (((p.w1 >> 13)&1) ^ ((t.w1 >> 13)&1)) | (((p.w1 >> 12)&1) ^ ((t.w1 >> 12)&1)) ;
	int dst_277 = (((p.w1 >> 11)&1) ^ ((t.w1 >> 11)&1)) | (((p.w1 >> 10)&1) ^ ((t.w1 >> 10)&1)) ;
	int dst_276 = (((p.w1 >> 9)&1) ^ ((t.w1 >> 9)&1)) | (((p.w1 >> 8)&1) ^ ((t.w1 >> 8)&1)) ;
	int dst_275 = (((p.w1 >> 7)&1) ^ ((t.w1 >> 7)&1)) | (((p.w1 >> 6)&1) ^ ((t.w1 >> 6)&1)) ;
	int dst_274 = (((p.w1 >> 5)&1) ^ ((t.w1 >> 5)&1)) | (((p.w1 >> 4)&1) ^ ((t.w1 >> 4)&1)) ;
	int dst_273 = (((p.w1 >> 3)&1) ^ ((t.w1 >> 3)&1)) | (((p.w1 >> 2)&1) ^ ((t.w1 >> 2)&1)) ;
	int dst_272 = (((p.w1 >> 1)&1) ^ ((t.w1 >> 1)&1)) | (((p.w1 >> 0)&1) ^ ((t.w1 >> 0)&1)) ;
	int dst_271 = (((p.w0 >> 31)&1) ^ ((t.w0 >> 31)&1)) | (((p.w0 >> 30)&1) ^ ((t.w0 >> 30)&1)) ;
	int dst_270 = (((p.w0 >> 29)&1) ^ ((t.w0 >> 29)&1)) | (((p.w0 >> 28)&1) ^ ((t.w0 >> 28)&1)) ;
	int dst_269 = (((p.w0 >> 27)&1) ^ ((t.w0 >> 27)&1)) | (((p.w0 >> 26)&1) ^ ((t.w0 >> 26)&1)) ;
	int dst_268 = (((p.w0 >> 25)&1) ^ ((t.w0 >> 25)&1)) | (((p.w0 >> 24)&1) ^ ((t.w0 >> 24)&1)) ;
	int dst_267 = (((p.w0 >> 23)&1) ^ ((t.w0 >> 23)&1)) | (((p.w0 >> 22)&1) ^ ((t.w0 >> 22)&1)) ;
	int dst_266 = (((p.w0 >> 21)&1) ^ ((t.w0 >> 21)&1)) | (((p.w0 >> 20)&1) ^ ((t.w0 >> 20)&1)) ;
	int dst_265 = (((p.w0 >> 19)&1) ^ ((t.w0 >> 19)&1)) | (((p.w0 >> 18)&1) ^ ((t.w0 >> 18)&1)) ;
	int dst_264 = (((p.w0 >> 17)&1) ^ ((t.w0 >> 17)&1)) | (((p.w0 >> 16)&1) ^ ((t.w0 >> 16)&1)) ;
	int dst_263 = (((p.w0 >> 15)&1) ^ ((t.w0 >> 15)&1)) | (((p.w0 >> 14)&1) ^ ((t.w0 >> 14)&1)) ;
	int dst_262 = (((p.w0 >> 13)&1) ^ ((t.w0 >> 13)&1)) | (((p.w0 >> 12)&1) ^ ((t.w0 >> 12)&1)) ;
	int dst_261 = (((p.w0 >> 11)&1) ^ ((t.w0 >> 11)&1)) | (((p.w0 >> 10)&1) ^ ((t.w0 >> 10)&1)) ;
	int dst_260 = (((p.w0 >> 9)&1) ^ ((t.w0 >> 9)&1)) | (((p.w0 >> 8)&1) ^ ((t.w0 >> 8)&1)) ;
	int dst_259 = (((p.w0 >> 7)&1) ^ ((t.w0 >> 7)&1)) | (((p.w0 >> 6)&1) ^ ((t.w0 >> 6)&1)) ;
	int dst_258 = (((p.w0 >> 5)&1) ^ ((t.w0 >> 5)&1)) | (((p.w0 >> 4)&1) ^ ((t.w0 >> 4)&1)) ;
	int dst_257 = (((p.w0 >> 3)&1) ^ ((t.w0 >> 3)&1)) | (((p.w0 >> 2)&1) ^ ((t.w0 >> 2)&1)) ;
	int dst_256 = (((p.w0 >> 1)&1) ^ ((t.w0 >> 1)&1)) | (((p.w0 >> 0)&1) ^ ((t.w0 >> 0)&1)) ;
r->w15 = (dst_480<<0)|(dst_481<<1)|(dst_482<<2)|(dst_483<<3)|(dst_484<<4)|(dst_485<<5)|(dst_486<<6)|(dst_487<<7)|(dst_488<<8)|(dst_489<<9)|(dst_490<<10)|(dst_491<<11)|(dst_492<<12)|(dst_493<<13)|(dst_494<<14)|(dst_495<<15)|(dst_496<<16)|(dst_497<<17)|(dst_498<<18)|(dst_499<<19)|(dst_500<<20)|(dst_501<<21)|(dst_502<<22)|(dst_503<<23)|(dst_504<<24)|(dst_505<<25)|(dst_506<<26)|(dst_507<<27)|(dst_508<<28)|(dst_509<<29)|(dst_510<<30)|(dst_511<<31);
r->w14 = (dst_448<<0)|(dst_449<<1)|(dst_450<<2)|(dst_451<<3)|(dst_452<<4)|(dst_453<<5)|(dst_454<<6)|(dst_455<<7)|(dst_456<<8)|(dst_457<<9)|(dst_458<<10)|(dst_459<<11)|(dst_460<<12)|(dst_461<<13)|(dst_462<<14)|(dst_463<<15)|(dst_464<<16)|(dst_465<<17)|(dst_466<<18)|(dst_467<<19)|(dst_468<<20)|(dst_469<<21)|(dst_470<<22)|(dst_471<<23)|(dst_472<<24)|(dst_473<<25)|(dst_474<<26)|(dst_475<<27)|(dst_476<<28)|(dst_477<<29)|(dst_478<<30)|(dst_479<<31);
r->w13 = (dst_416<<0)|(dst_417<<1)|(dst_418<<2)|(dst_419<<3)|(dst_420<<4)|(dst_421<<5)|(dst_422<<6)|(dst_423<<7)|(dst_424<<8)|(dst_425<<9)|(dst_426<<10)|(dst_427<<11)|(dst_428<<12)|(dst_429<<13)|(dst_430<<14)|(dst_431<<15)|(dst_432<<16)|(dst_433<<17)|(dst_434<<18)|(dst_435<<19)|(dst_436<<20)|(dst_437<<21)|(dst_438<<22)|(dst_439<<23)|(dst_440<<24)|(dst_441<<25)|(dst_442<<26)|(dst_443<<27)|(dst_444<<28)|(dst_445<<29)|(dst_446<<30)|(dst_447<<31);
r->w12 = (dst_384<<0)|(dst_385<<1)|(dst_386<<2)|(dst_387<<3)|(dst_388<<4)|(dst_389<<5)|(dst_390<<6)|(dst_391<<7)|(dst_392<<8)|(dst_393<<9)|(dst_394<<10)|(dst_395<<11)|(dst_396<<12)|(dst_397<<13)|(dst_398<<14)|(dst_399<<15)|(dst_400<<16)|(dst_401<<17)|(dst_402<<18)|(dst_403<<19)|(dst_404<<20)|(dst_405<<21)|(dst_406<<22)|(dst_407<<23)|(dst_408<<24)|(dst_409<<25)|(dst_410<<26)|(dst_411<<27)|(dst_412<<28)|(dst_413<<29)|(dst_414<<30)|(dst_415<<31);
r->w11 = (dst_352<<0)|(dst_353<<1)|(dst_354<<2)|(dst_355<<3)|(dst_356<<4)|(dst_357<<5)|(dst_358<<6)|(dst_359<<7)|(dst_360<<8)|(dst_361<<9)|(dst_362<<10)|(dst_363<<11)|(dst_364<<12)|(dst_365<<13)|(dst_366<<14)|(dst_367<<15)|(dst_368<<16)|(dst_369<<17)|(dst_370<<18)|(dst_371<<19)|(dst_372<<20)|(dst_373<<21)|(dst_374<<22)|(dst_375<<23)|(dst_376<<24)|(dst_377<<25)|(dst_378<<26)|(dst_379<<27)|(dst_380<<28)|(dst_381<<29)|(dst_382<<30)|(dst_383<<31);
r->w10 = (dst_320<<0)|(dst_321<<1)|(dst_322<<2)|(dst_323<<3)|(dst_324<<4)|(dst_325<<5)|(dst_326<<6)|(dst_327<<7)|(dst_328<<8)|(dst_329<<9)|(dst_330<<10)|(dst_331<<11)|(dst_332<<12)|(dst_333<<13)|(dst_334<<14)|(dst_335<<15)|(dst_336<<16)|(dst_337<<17)|(dst_338<<18)|(dst_339<<19)|(dst_340<<20)|(dst_341<<21)|(dst_342<<22)|(dst_343<<23)|(dst_344<<24)|(dst_345<<25)|(dst_346<<26)|(dst_347<<27)|(dst_348<<28)|(dst_349<<29)|(dst_350<<30)|(dst_351<<31);
r->w9 = (dst_288<<0)|(dst_289<<1)|(dst_290<<2)|(dst_291<<3)|(dst_292<<4)|(dst_293<<5)|(dst_294<<6)|(dst_295<<7)|(dst_296<<8)|(dst_297<<9)|(dst_298<<10)|(dst_299<<11)|(dst_300<<12)|(dst_301<<13)|(dst_302<<14)|(dst_303<<15)|(dst_304<<16)|(dst_305<<17)|(dst_306<<18)|(dst_307<<19)|(dst_308<<20)|(dst_309<<21)|(dst_310<<22)|(dst_311<<23)|(dst_312<<24)|(dst_313<<25)|(dst_314<<26)|(dst_315<<27)|(dst_316<<28)|(dst_317<<29)|(dst_318<<30)|(dst_319<<31);
r->w8 = (dst_256<<0)|(dst_257<<1)|(dst_258<<2)|(dst_259<<3)|(dst_260<<4)|(dst_261<<5)|(dst_262<<6)|(dst_263<<7)|(dst_264<<8)|(dst_265<<9)|(dst_266<<10)|(dst_267<<11)|(dst_268<<12)|(dst_269<<13)|(dst_270<<14)|(dst_271<<15)|(dst_272<<16)|(dst_273<<17)|(dst_274<<18)|(dst_275<<19)|(dst_276<<20)|(dst_277<<21)|(dst_278<<22)|(dst_279<<23)|(dst_280<<24)|(dst_281<<25)|(dst_282<<26)|(dst_283<<27)|(dst_284<<28)|(dst_285<<29)|(dst_286<<30)|(dst_287<<31);

}

