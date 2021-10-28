#ifndef XILINX_AP_UINT_DEFINED
#define XILINX_AP_UINT_DEFINED

#ifndef PREPROCESSING
#include <ap_int.h>
#include <stdio.h>
#else
__hash__ include <ap_int.h>
__hash__ include <stdio.h>
#endif


ap_uint<512> ap_uint_512_onesHigh(int n);
unsigned int ap_uint_512_pop_count(ap_uint<512> x);
void ap_uint_512_printBinHigh(ap_uint<512> r, int len);
unsigned char ap_uint_512_getHighByte(ap_uint<512> v, int index);
unsigned char ap_uint_512_getLowByte(ap_uint<512> v, int index);

unsigned int ap_uint_1024_pop_count(ap_uint<1024> x);

ap_uint<512> ap_uint_512_bitReversal(ap_uint<512> v)
{
	ap_uint<512> r = 0;

	for (int i=0; i < 512; i++)
	{
#pragma HLS UNROLL
		r[i] = v[512-1-i];
	}
	return r;
}

ap_uint<512> ap_uint_512_byteReversal(ap_uint<512> v)
{
	ap_uint<512> r = 0;
	for (int i=0; i < 512/8; i++)
	{
#pragma HLS UNROLL
		r((i+1)*8-1, i*8) = v(512-1-(i)*8, 512-(i+1)*8);
	}
	return r;
}

ap_uint<512> ap_uint_512_uintReversal(ap_uint<512> v)
{
	ap_uint<512> r = 0;
	for (int i= 0; i < 512/32; i++)
	{
#pragma HLS UNROLL
		r((i+1)*32-1, i*32) = v(512-1-(i)*32, 512-(i+1)*32);
	}
	return r;
}

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

ap_uint<1024> ap_uint_1024_onesHigh(int n)
{
	ap_uint<1024> v = 0;

	for (int i = 0; i < 1024; i++)
	{
#pragma HLS UNROLL
		v[1024-1-i] = (i<n)?1:0;
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

unsigned int ap_uint_1024_pop_count(ap_uint<1024> x)
{
	unsigned int p=0;

	for (int i=0; i < 1024; i++)
	{
#pragma HLS UNROLL
		p += x[i];
	}

	return p;
}

void ap_uint_512_printBinHigh(ap_uint<512> r, int len)
{
	for (int i=0; i < len; i++)
	{
		int bit = r[512-1-i];
		printf("%d", bit);
	}
}

unsigned char ap_uint_512_getHighByte(ap_uint<512> v, int index)
{
	return ap_uint_512_getLowByte(v, (512/8) - 1 - index);
}

/**
* @param one of the 64 bytes of the 512 bits word
*/
unsigned char ap_uint_512_getLowByte(ap_uint<512> v, int index)
{
	return v((index+1)*8-1, (index*8));
}

#endif
