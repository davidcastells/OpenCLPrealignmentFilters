#ifndef XILINX_AP_UINT_DEFINED
#define XILINX_AP_UINT_DEFINED

#include <ap_int.h>


ap_uint<512> ap_uint_512_onesHigh(int n)
{
	ap_uint<512> v = 0;

	for (int i = 0; i < 512; i++)
	{
#pragma HLS UNROLL
		v[512-1-i] = (i<n)?1:0;
	}
	return v;
}


unsigned int ap_uint_512_pop_count(ap_uint<512> x)
{
	
	unsigned int p=0;

	for (int i = 0; i < 512; i++)
	{
#pragma HLS UNROLL
		p += x[i];
	}

	return p;
}


#endif
