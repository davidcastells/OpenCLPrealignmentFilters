#include "adapter_xilinx.cl"

#ifdef ENTRY_TYPE_2


void xorBases(ap_uint_1024 p, ap_uint_1024 t, ap_uint_1024p r)
{
<%
for (int i=0; i < 1024/BASE_SIZE; i++)
{
	int dstidx = 1024 - 1 -i;
	int srcidx0 = 1024 - 1 -i*2;
	int srcidx1 = 1024 - 2 -i*2;

	printf("\tint dst_%d = (", dstidx);
	inline_ap_uint_1024_get_bit("p", srcidx0);
	printf(" ^ ");
	inline_ap_uint_1024_get_bit("t", srcidx0);
	printf(") | (");
	inline_ap_uint_1024_get_bit("p", srcidx1);
	printf(" ^ ");
	inline_ap_uint_1024_get_bit("t", srcidx1);
	printf(") ;\n");

}

for (int i=0; i < (1024/BASE_SIZE)/32; i++)
{
	int wordidx = 1024/32 - 1 -i;
	printf("r->w%d = ", wordidx);

	for (int k=0; k < 32; k++)
	{
		int ref = wordidx * 32 + k;
		if (k>0) printf("|");
		printf("(dst_%d<<%d)", ref, k);
	}

	printf(";\n");
}
%>
}


void removeShortZeros(ap_uint_1024 x, ap_uint_1024p r)
{
<%
for (int i=0; i < 1024/BASE_SIZE; i++)
{
	int idx = 1024 - 1 -i;

	printf("\tint dst_%d = ", idx);
	inline_ap_uint_1024_get_bit_or_one("x", idx);
	printf(" | (");
	inline_ap_uint_1024_get_bit_or_one("x", idx+1);
	printf(" & ");
	inline_ap_uint_1024_get_bit_or_one("x", idx-1);
	printf(") | (");
	inline_ap_uint_1024_get_bit_or_one("x", idx+2);
	printf(" & ");
	inline_ap_uint_1024_get_bit_or_one("x", idx-1);
	printf(") | (");
	inline_ap_uint_1024_get_bit_or_one("x", idx+1);
	printf(" & ");
	inline_ap_uint_1024_get_bit_or_one("x", idx-2);
	printf(");\n");


 // p1 & m1) | (p2 & m1) | (p1 & m2);\n", idx);
}

for (int i=0; i < (1024/BASE_SIZE)/32; i++)
{
	int wordidx = 1024/32 - 1 -i;
	printf("r->w%d = ", wordidx);

	for (int k=0; k < 32; k++)
	{
		int ref = wordidx * 32 + k;
		if (k>0) printf("|");
		printf("(dst_%d<<%d)", ref, k);
	}

	printf(";\n");
}
%>
}

unsigned int shd(ap_uint_1024 pattern,  int plen, ap_uint_1024 text,  int tlen)
{
	ap_uint_1024 acum;
	ap_uint_1024_onesHigh(AP_UINT_PTR(acum), plen);

#ifdef FPGA_DEBUG
	for (int i=-SHD_THRESHOLD; i <= SHD_THRESHOLD; i++)
	{
		ap_uint_1024 shifted_pattern;
		if (i < 0)
		{
			ap_uint_1024_shift_left(pattern, (-i)*BASE_SIZE, AP_UINT_PTR(shifted_pattern));
		}
		else if (i==0)
		{
			ap_uint_1024_set(AP_UINT_PTR(shifted_pattern), pattern);
		}
		else
		{
			// > 0
			ap_uint_1024_shift_right(pattern, i*BASE_SIZE, AP_UINT_PTR(shifted_pattern));
		}

		printf("shift [%2d] =", i);
		printSequence(shifted_pattern, plen);
		printf("\n");
	}
#endif

	for (int i=-SHD_THRESHOLD; i <= SHD_THRESHOLD; i++)
	{
		#pragma HLS unroll

		ap_uint_1024 shifted_pattern;
		if (i < 0)
		{
			ap_uint_1024_shift_left(pattern, (-i)*BASE_SIZE, AP_UINT_PTR(shifted_pattern));
		}
		else if (i==0)
		{
			ap_uint_1024_set(AP_UINT_PTR(shifted_pattern), pattern);
		}
		else
		{
			// > 0
			ap_uint_1024_shift_right(pattern, i*BASE_SIZE, AP_UINT_PTR(shifted_pattern));
		}
		ap_uint_1024 dist2;
		ap_uint_1024 dist;
			
		//xorBases(shifted_pattern, text, AP_UINT_PTR(dist));
		xorBases(shifted_pattern, text, AP_UINT_PTR(dist2));
		removeShortZeros(dist2, AP_UINT_PTR(dist));

#ifdef FPGA_DEBUG
		printf("shift [%2d] =", i);
		ap_uint_1024_printBinHigh(dist, plen);
		printf("\n");
#endif

		ap_uint_1024_and_self(AP_UINT_PTR(acum), dist);

#ifdef FPGA_DEBUG

		printf("acum       =");
		ap_uint_1024_printBinHigh(acum, plen);
		printf("\n");
#endif
	}

	return ap_uint_1024_pop_count(acum);
}

unsigned int computeDistance(ap_uint_1024 pattern,  int plen, ap_uint_1024 text,  int tlen)
{
	return shd(pattern,  plen, text,  plen);
}

#else


ap_uint<512> xorBases(ap_uint<512> p, ap_uint<512> t)
{
	ap_uint<512> ret;

	for (int i=0; i < 512/BASE_SIZE; i++)
	{
#pragma HLS UNROLL

		int dstidx = 512 - 1 -i;
		int srcidx0 = 512 - 1 -i*2;
		int srcidx1 = 512 - 2 -i*2;

		int dst = (p[srcidx0] ^ t[srcidx0]) | (p[srcidx1] ^ t[srcidx1]);
		ret[dstidx] = dst;
	}

	return ret;
}


ap_uint<512> removeShortZeros(ap_uint<512> x)
{
	ap_uint<512> r = x;

	for (int i=0; i < 512/BASE_SIZE; i++)
	{
#pragma HLS UNROLL
		int idx = 512 - 1 -i;
		// check for valid index, return 1 if invalid
		int xp1 = (idx < (512-1))? x.test(idx+1) : 1;
		int xp2 = (idx < (512-2))? x.test(idx+2) : 1;
		int xm1 = (idx > 0)? x.test(idx-1) : 1;
		int xm2 = (idx > 1)? x.test(idx-2) : 1;
		int dst = x[idx]  | (xp1 & xm1) | (xp2 & xm1) | (xp1 & xm2);
		r[idx] = dst;
	}

	return r;	
}


unsigned int shd(ap_uint<512> pattern,  int plen, ap_uint<512> text,  int tlen)
{
	ap_uint<512> acum;
	acum = ap_uint_512_onesHigh( plen);

#ifdef FPGA_DEBUG
	for (int i=-SHD_THRESHOLD; i <= SHD_THRESHOLD; i++)
	{
		ap_uint<512> shifted_pattern;
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

	for (int i=-SHD_THRESHOLD; i <= SHD_THRESHOLD; i++)
	{
	#pragma HLS UNROLL

		ap_uint<512> shifted_pattern;
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
		ap_uint<512> dist2;
		ap_uint<512> dist;
			
		//xorBases(shifted_pattern, text, AP_UINT_PTR(dist));
		dist2 = xorBases(shifted_pattern, text);
		dist = removeShortZeros(dist2);

#ifdef FPGA_DEBUG
		printf("shift [%2d] =", i);
		ap_uint_512_printBinHigh(dist, plen);
		printf("\n");
#endif

		acum = dist & acum;


#ifdef FPGA_DEBUG

		printf("acum       =");
		ap_uint_512_printBinHigh(acum, plen);
		printf("\n");
#endif
	}

	return ap_uint_512_pop_count(acum);
}



unsigned int computeDistance(ap_uint<512> pattern,  int plen, ap_uint<512> text,  int tlen)
{
	return shd(pattern,  plen, text,  plen);
}

#endif



