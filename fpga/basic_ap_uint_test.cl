#include "basic_ap_uint.h"


void testGetSetHighByte()
{
	printf("TESTING Get/Set High Byte\n");

	ap_uint_512 w;

	for (int i=0; i < 512/8; i++)
	{
		ap_uint_512_setHighByte(AP_UINT_PTR(w), i, i);
	}

	ap_uint_512_print(w);

	for (int i=0; i < 512/8; i++)
	{
		int byte = ap_uint_512_getHighByte(w, i);

		printf("byte[%d] = %02X\n", i, byte);
	}
}


void testShiftLeftBytes()
{
	printf("TESTING Shift Left Bytes\n");

	ap_uint_512 w;
	for (int i=0; i < 512/8; i++)
	{
		ap_uint_512_setHighByte(AP_UINT_PTR(w), i, i);
	}

	printf("ORIGINAL=");
	ap_uint_512_print(w);
	printf("\n");

	ap_uint_512 w2;


	for (int i=0; i < 512/8; i++)
	{ 
	
		ap_uint_512_shift_left_bytes(w, i, AP_UINT_PTR(w2));

		printf("w << %d =", i);
		ap_uint_512_print(w2);
		printf("\n");
		
	}
}


void testShiftLeft()
{
	printf("TESTING Shift Left\n");

	ap_uint_512 w;
	for (int i=0; i < 512/8; i++)
	{
		ap_uint_512_setHighByte(AP_UINT_PTR(w), i, i);
	}

	printf("ORIGINAL=");
	ap_uint_512_print(w);
	printf("\n");

	ap_uint_512 w2;

	for (int i=0; i < 512; i++)
	{ 
	
		ap_uint_512_shift_left(w, i, AP_UINT_PTR(w2));

		printf("w << %d =", i);
		ap_uint_512_print(w2);
		printf("\n");
	}
}



void testShiftRight()
{
	printf("TESTING Shift Right\n");

	ap_uint_512 w;
	for (int i=0; i < 512/8; i++)
	{
		ap_uint_512_setHighByte(AP_UINT_PTR(w), i, i);
	}

	printf("ORIGINAL=");
	ap_uint_512_print(w);
	printf("\n");

	ap_uint_512 w2;

	for (int i=0; i < 512; i++)
	{ 
	
		ap_uint_512_shift_right(w, i, AP_UINT_PTR(w2));

		printf("w >> %d =", i);
		ap_uint_512_print(w2);
		printf("\n");
	}
}

__kernel void kmer(__global unsigned char* restrict pairs ,
		   __global unsigned int* workload, 
		   unsigned int workloadLength)
{
	printf("TESTING basic_ap_uint\n");

	// testGetSetHighByte();
	// testShiftLeftBytes();
	// testShiftLeft();
	testShiftRight();
	
}
