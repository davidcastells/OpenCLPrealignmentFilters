#include "adapter.cl"

#ifndef SHD_THRESHOLD
#define SHD_THRESHOLD	3
#endif

// @deprecated not used any more
unsigned int getBase(ap_uint_512 w, int i)
{
	unsigned int bh =  ap_uint_512_get_bit(w, 512-1-(i*BASE_SIZE)); 
	unsigned int bl =  ap_uint_512_get_bit(w, 512-2-(i*BASE_SIZE));	
		
	unsigned int idx = (bh << 1) | bl;

	return idx;
}

unsigned int equalBase(ap_uint_512 w, int i)
{
	unsigned int bh =  ap_uint_512_get_bit(w, 512-1-(i*BASE_SIZE)); 
	unsigned int bl =  ap_uint_512_get_bit(w, 512-2-(i*BASE_SIZE));	
		
	unsigned int idx = bh | bl;

	return idx;
}

void xorBases(ap_uint_512 p, ap_uint_512 t, ap_uint_512p ret)
{
	ap_uint_512_zero(ret);

	ap_uint_512 p_xor_t;

	// first compute the xor
	ap_uint_512_xor(p, t, AP_UINT_PTR(p_xor_t));

	//for (int i=0; i < len; i++)
	// we can do worst case loop to force unrolling, the remaining invalid part
	// will be masked by the AND with acum  
	//#pragma unroll
	for (int i=0; i < 512/BASE_SIZE; i++)
	{
		//unsigned int pb = getBase(p, i);
		//unsigned int tb = getBase(t, i);
		//unsigned int xb = pb ^ tb;		// XOR bases
		unsigned int r = equalBase(p_xor_t, i);		
		ap_uint_512_or_bit(ret, 512-1-i, r);
	}
}

void removeShortZeros(ap_uint_512 x, ap_uint_512p r)
{
	ap_uint_512_zero(r);

	//for (int i=0; i < len; i++)
	// we can do worst case loop to force unrolling, the remaining invalid part
	// will be masked by the AND with acum  
	#pragma unroll
	for (int i=0; i < 512/BASE_SIZE; i++)
	{
		int idx = 512-1-i;
		int p2 = (idx+2 < 512)? ap_uint_512_get_bit(x, idx+2) : 1;
		int p1 = (idx+1 < 512)? ap_uint_512_get_bit(x, idx+1) : 1;
		int v =  ap_uint_512_get_bit(x, idx);
		int m1 = (idx-1 >= 0)? ap_uint_512_get_bit(x, idx-1) : 1;
		int m2 = (idx-2 >= 0)? ap_uint_512_get_bit(x, idx-2) : 1;
		
		// convert 0 to 1 if the group of zeros if 1 or 2 long	
		if (v == 0)
		{
			if (p1 == 1 && m1 == 1)
				v = 1;
			if (p2 == 1 && m1 == 1)
				v = 1;
			if (p1 == 1 && m2 == 1)
				v = 1;
		}
		
		ap_uint_512_or_bit(r, idx, v);	
	}
}

unsigned int shd(ap_uint_512 pattern,  int plen, ap_uint_512 text,  int tlen)
{
	ap_uint_512 acum;
	ap_uint_512_onesHigh(AP_UINT_PTR(acum), plen);

#ifdef FPGA_DEBUG
	for (int i=-SHD_THRESHOLD; i <= SHD_THRESHOLD; i++)
	{
		ap_uint_512 shifted_pattern;
		if (i < 0)
		{
			ap_uint_512_shift_left(pattern, (-i)*BASE_SIZE, AP_UINT_PTR(shifted_pattern));
		}
		else if (i==0)
		{
			ap_uint_512_set(AP_UINT_PTR(shifted_pattern), pattern);
		}
		else
		{
			// > 0
			ap_uint_512_shift_right(pattern, i*BASE_SIZE, AP_UINT_PTR(shifted_pattern));
		}

		printf("shift [%2d] =", i);
		printSequence(shifted_pattern, plen);
		printf("\n");
	}
#endif

#ifdef PATTERN_LEN
	#pragma unroll
#endif
	for (int i=-SHD_THRESHOLD; i <= SHD_THRESHOLD; i++)
	{
		ap_uint_512 shifted_pattern;
		if (i < 0)
		{
			ap_uint_512_shift_left(pattern, (-i)*BASE_SIZE, AP_UINT_PTR(shifted_pattern));
		}
		else if (i==0)
		{
			ap_uint_512_set(AP_UINT_PTR(shifted_pattern), pattern);
		}
		else
		{
			// > 0
			ap_uint_512_shift_right(pattern, i*BASE_SIZE, AP_UINT_PTR(shifted_pattern));
		}
		ap_uint_512 dist2;
		xorBases(shifted_pattern, text, AP_UINT_PTR(dist2));

		ap_uint_512 dist;
		removeShortZeros(dist2, AP_UINT_PTR(dist));

#ifdef FPGA_DEBUG
		printf("shift [%2d] =", i);
		ap_uint_512_printBinHigh(dist, plen);
		printf("\n");
#endif

		ap_uint_512_and_self(AP_UINT_PTR(acum), dist);

#ifdef FPGA_DEBUG

		printf("acum       =");
		ap_uint_512_printBinHigh(acum, plen);
		printf("\n");
#endif
	}

	return ap_uint_512_pop_count(acum);
}



unsigned int computeDistance(ap_uint_512 pattern,  int plen, ap_uint_512 text,  int tlen)
{
	return shd(pattern,  plen, text,  plen);
}

