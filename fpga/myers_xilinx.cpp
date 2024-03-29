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

#define BASE_SIZE 2


#ifndef PREPROCESSING

int max(int a, int b)
{
	if (a > b) 
		return a; 
	else
		return b;
}

int abs(int a)
{
	if (a < 0) return -a;
	else return a;
}

#endif

#include <math.h>

//int LEV_THRESHOLD_HALF = LEV_THRESHOLD/2;

int MYERS_THRESHOLD_BITS = ceil(log(MYERS_THRESHOLD) / log(2));



unsigned int satAdd(unsigned int a, unsigned int b)
{
#pragma HLS INLINE
	// final mask
	int final_mask = (1 << (MYERS_THRESHOLD_BITS+1) ) -1;


	// bits
	int lev_bits = MYERS_THRESHOLD_BITS;
	int mask = 1 << lev_bits;
	int isASaturated = (a >> lev_bits) & 1;
	if (isASaturated)
		return mask & final_mask;
	else
		return ((a& final_mask) + (b& final_mask)) & final_mask;
}



int isFarFromDiag(int x, int y)
{
#pragma HLS INLINE
	int d = abs(x-y);
	return (d > (MYERS_THRESHOLD/2));
}

ap_uint<1> equalBases(ap_uint<WORD_BITS> p, int i, ap_uint<WORD_BITS>,  int j)
{
#pragma HLS INLINE
	int srcidx0 = WORD_BITS - 1 -i*2;
	int srcidx1 = WORD_BITS - 2 -i*2;

	int srcjdx0 = WORD_BITS - 1 -j*2;
	int srcjdx1 = WORD_BITS - 2 -j*2;

	ap_uint<1> i0 = p[srcidx0];
	ap_uint<1> i1 = p[srcidx1];
	ap_uint<1> j0 = p[srcjdx0];
	ap_uint<1> j1 = p[srcjdx1];

	return (i0 ^ j0) | (i1 ^ j1);
}


unsigned int myers(ap_uint<WORD_BITS> pattern,  int plen, ap_uint<WORD_BITS> text,  int tlen)
{
	ap_uint<1> 	eq[TEXT_LEN+1][PATTERN_LEN+1];
	ap_uint<1> 	d0[TEXT_LEN+1][PATTERN_LEN+1];
	ap_uint<1> 	vn[TEXT_LEN+1][PATTERN_LEN+1];
	ap_uint<1> 	vp[TEXT_LEN+1][PATTERN_LEN+1];
	ap_uint<1> 	hn[TEXT_LEN+1][PATTERN_LEN+1];
	ap_uint<1> 	hp[TEXT_LEN+1][PATTERN_LEN+1];

	#pragma HLS array_partition variable=eq complete dim=0
	#pragma HLS array_partition variable=d0 complete dim=0
	#pragma HLS array_partition variable=vp complete dim=0
	#pragma HLS array_partition variable=vn complete dim=0
	#pragma HLS array_partition variable=hn complete dim=0
	#pragma HLS array_partition variable=hp complete dim=0
	for (int x = 0; x <= TEXT_LEN; x++)
	{
#pragma HLS UNROLL
		for (int y = 0; y <= PATTERN_LEN; y++)
		{
#pragma HLS UNROLL
			int farxy = isFarFromDiag(x,y);
 			int farxm1y = isFarFromDiag(x-1,y);
 			int farxym1 = isFarFromDiag(x,y-1);

			// equality variable
			if (!farxy && (x > 0) && (y > 0))
				eq[x][y] = equalBases(text, x-1, pattern, y-1);
			else
				eq[x][y] = 0;



			// D0
			if (farxy)
			{
				// ignore the elements distant from the diagonal
				d0[x][y] = 0;
			}
			else if (x == 0 || y == 0)
			{
				d0[x][y] = 1;
			}
			else
			{
				d0[x][y] = eq[x][y];

				if (!farxm1y)
					d0[x][y] |= vn[x-1][y];

				if (!farxym1)
					d0[x][y] |= hn[x][y-1];
			}


			if (farxy)
			{
				// Ignore
				vp[x][y] = 0;
			}
			else if (y == 0)
			{
				vp[x][y] = 0;
			}
			else if (x == 0)
			{
				vp[x][y] = 1;
			}
			else
			{
#ifdef FPGA_DEBUG
				printf("\tunsigned char vp_%d_%d = ", x, y);
#endif
				if (!farxym1)
					vp[x][y] = ( hn[x][y-1] | ~(hp[x][y-1] | d0[x][y]));
				else
					vp[x][y] = ( 0 | ~(0 | d0[x][y]));
			}


			if (farxy)
			{
				// Ignore
				vn[x][y] = 0;
			}
			else if (x == 0 || y == 0)
			{
				vn[x][y] = 0;
			}
			else 
			{
#ifdef FPGA_DEBUG
				printf("\tunsigned char vn_%d_%d = ", x, y);
#endif
				if (!farxym1)
					vn[x][y] = (hp[x][y-1] & d0[x][y]);
				else
					vn[x][y] = (0 & d0[x][y]);
			}


			if (farxy)
			{
				// Ignore
				hp[x][y] = 0;
			}
			else if (y == 0)
			{
				hp[x][y] = 1;
			}
			else if (x == 0)
			{
				hp[x][y] = 0;
			}
			else 
			{
				if (!farxm1y)
					hp[x][y] = (vn[x-1][y] | ~(vp[x-1][y] | d0[x][y]));
				else
					hp[x][y] = (0 | ~(1 | d0[x][y]));
			}



			if (farxy)
			{
				// Ignore
				hn[x][y] = 0;
			}
			else if (x == 0 || y == 0)
			{
				hn[x][y] = 0;
			}
			else 
			{
#ifdef FPGA_DEBUG
				printf("\tunsigned char hn_%d_%d =", x, y);
#endif
				if (!farxm1y)
					hn[x][y] = (vp[x-1][y] & d0[x][y]);
				else
					hn[x][y] = (1 & d0[x][y]);

			}
		}
	

	}

	int d = 0; 

	for (int i = 0; i <= max(TEXT_LEN, PATTERN_LEN); i++)
	{
#pragma HLS UNROLL
		d = satAdd(d ,  (~(d0[i][i]) & 1));

	}

	return d;
	
}





unsigned int computeDistance(ap_uint<WORD_BITS> pattern,  int plen, ap_uint<WORD_BITS> text,  int tlen)
{
	return myers(pattern,  plen, text,  plen);
}





