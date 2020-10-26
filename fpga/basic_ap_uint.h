

// the numbers are stored in less significant order 

#ifndef FALSE
#define FALSE 0
#endif

typedef struct 
{
	unsigned int w0;
	unsigned int w1;
	unsigned int w2;
	unsigned int w3;
	unsigned int w4;
	unsigned int w5;
	unsigned int w6;
	unsigned int w7;
	unsigned int w8;
	unsigned int w9;
	unsigned int w10;
	unsigned int w11;
	unsigned int w12;
	unsigned int w13;
	unsigned int w14;
	unsigned int w15;
} ap_uint_512;

typedef ap_uint_512* ap_uint_512p;

typedef struct 
{

	unsigned int w0;
	unsigned int w1;
	unsigned int w2;
	unsigned int w3;
	unsigned int w4;
	unsigned int w5;
	unsigned int w6;
	unsigned int w7;
	unsigned int w8;
	unsigned int w9;
	unsigned int w10;
	unsigned int w11;
	unsigned int w12;
	unsigned int w13;
	unsigned int w14;
	unsigned int w15;
	unsigned int w16;
	unsigned int w17;
	unsigned int w18;
	unsigned int w19;
	unsigned int w20;
	unsigned int w21;
	unsigned int w22;
	unsigned int w23;
	unsigned int w24;
	unsigned int w25;
	unsigned int w26;
	unsigned int w27;
	unsigned int w28;
	unsigned int w29;
	unsigned int w30;
	unsigned int w31;
	
} ap_uint_1024;

typedef ap_uint_1024* ap_uint_1024p;

#define AP_UINT_PTR(x)		&(x)
#define AP_UINT_FROM_PTR(x)	*x


void ap_uint_512_setLowByte(ap_uint_512p v, int index, int value);
void ap_uint_512_zero(ap_uint_512p v);
void ap_uint_512_set_bit(ap_uint_512p v, int bit, int x);
void ap_uint_512_orLowByteConcurrent(ap_uint_512p v, int index, int value);
unsigned char ap_uint_512_getLowByte(ap_uint_512 v, int index);
unsigned char ap_uint_512_getHighByte(ap_uint_512 v, int index);
unsigned int ap_uint_512_getDword(ap_uint_512 v, int index);
unsigned int ap_uint_512_pop_count(ap_uint_512 x);
int ap_uint_512_get_bit(ap_uint_512 x, int bit);
int ap_uint_512_get_bit_high(ap_uint_512 x, int bit);
int ap_uint_512_isZero(ap_uint_512 v);
void ap_uint_512_shift_right(ap_uint_512 x, int shift, ap_uint_512p r);

int ap_uint_1024_get_bit(ap_uint_1024 x, int bit);

#ifdef FPGA_EMULATION

	#define assert(x) assert_function(x, __FILE__, __LINE__)

	void assert_function(int condition, char* file, int line)
	{
	    if (!condition)
		printf("ASSERTION FAILED IN %s %d\n", file, line);
	}

#endif



void decoder_4_16(unsigned int w, int* sel0, int* sel1, int* sel2, int* sel3, int* sel4, int* sel5, int* sel6, int* sel7, int* sel8, int* sel9, int* sel10, int* sel11, int* sel12, int* sel13, int* sel14, int* sel15)
{
	int bit0 = (w >> 0) & 0x1;
	int bit1 = (w >> 1) & 0x1;
	int bit2 = (w >> 2) & 0x1;
	int bit3 = (w >> 3) & 0x1;

	int nbit0 = (~bit0) & 0x1;
	int nbit1 = (~bit1) & 0x1;
	int nbit2 = (~bit2) & 0x1;
	int nbit3 = (~bit3) & 0x1;


	*sel0=nbit0 & nbit1 & nbit2 & nbit3;
	*sel1=bit0 & nbit1 & nbit2 & nbit3;
	*sel2=nbit0 & bit1 & nbit2 & nbit3;
	*sel3=bit0 & bit1 & nbit2 & nbit3;
	*sel4=nbit0 & nbit1 & bit2 & nbit3;
	*sel5=bit0 & nbit1 & bit2 & nbit3;
	*sel6=nbit0 & bit1 & bit2 & nbit3;
	*sel7=bit0 & bit1 & bit2 & nbit3;
	*sel8=nbit0 & nbit1 & nbit2 & bit3;
	*sel9=bit0 & nbit1 & nbit2 & bit3;
	*sel10=nbit0 & bit1 & nbit2 & bit3;
	*sel11=bit0 & bit1 & nbit2 & bit3;
	*sel12=nbit0 & nbit1 & bit2 & bit3;
	*sel13=bit0 & nbit1 & bit2 & bit3;
	*sel14=nbit0 & bit1 & bit2 & bit3;
	*sel15=bit0 & bit1 & bit2 & bit3;

	
}

int ap_uint_512_get_bit(ap_uint_512 x, int bit)
{

	int wordidx = bit >> 5; // int wordidx = bit / 32;
	int bitidx = bit & 0x1F; // int bitidx = (bit % 32);

	int bit0 = (wordidx >> 0) & 0x1;
	int bit1 = (wordidx >> 1) & 0x1;
	int bit2 = (wordidx >> 2) & 0x1;
	int bit3 = (wordidx >> 3) & 0x1;
	int nbit0 = (~bit0) & 0x1;
	int nbit1 = (~bit1) & 0x1;
	int nbit2 = (~bit2) & 0x1;
	int nbit3 = (~bit3) & 0x1;
	int sel0=nbit0 & nbit1 & nbit2 & nbit3;
	int sel1=bit0 & nbit1 & nbit2 & nbit3;
	int sel2=nbit0 & bit1 & nbit2 & nbit3;
	int sel3=bit0 & bit1 & nbit2 & nbit3;
	int sel4=nbit0 & nbit1 & bit2 & nbit3;
	int sel5=bit0 & nbit1 & bit2 & nbit3;
	int sel6=nbit0 & bit1 & bit2 & nbit3;
	int sel7=bit0 & bit1 & bit2 & nbit3;
	int sel8=nbit0 & nbit1 & nbit2 & bit3;
	int sel9=bit0 & nbit1 & nbit2 & bit3;
	int sel10=nbit0 & bit1 & nbit2 & bit3;
	int sel11=bit0 & bit1 & nbit2 & bit3;
	int sel12=nbit0 & nbit1 & bit2 & bit3;
	int sel13=bit0 & nbit1 & bit2 & bit3;
	int sel14=nbit0 & bit1 & bit2 & bit3;
	int sel15=bit0 & bit1 & bit2 & bit3;


	
	if (sel0) { return (x.w0 >> bitidx) & 0x1;}	
	if (sel1) { return (x.w1 >> bitidx) & 0x1;}	
	if (sel2) { return (x.w2 >> bitidx) & 0x1;}	
	if (sel3) { return (x.w3 >> bitidx) & 0x1;}	
	if (sel4) { return (x.w4 >> bitidx) & 0x1;}	
	if (sel5) { return (x.w5 >> bitidx) & 0x1;}	
	if (sel6) { return (x.w6 >> bitidx) & 0x1;}	
	if (sel7) { return (x.w7 >> bitidx) & 0x1;}	
	if (sel8) { return (x.w8 >> bitidx) & 0x1;}	
	if (sel9) { return (x.w9 >> bitidx) & 0x1;}	
	if (sel10) { return (x.w10 >> bitidx) & 0x1;}	
	if (sel11) { return (x.w11 >> bitidx) & 0x1;}	
	if (sel12) { return (x.w12 >> bitidx) & 0x1;}	
	if (sel13) { return (x.w13 >> bitidx) & 0x1;}	
	if (sel14) { return (x.w14 >> bitidx) & 0x1;}	
	if (sel15) { return (x.w15 >> bitidx) & 0x1;}

}

int ap_uint_512_get_bit_high(ap_uint_512 x, int bit)
{
	return ap_uint_512_get_bit(x, 512-1-bit);
}

/**
* return the value of a bit
*/
int ap_uint_1024_get_bit(ap_uint_1024 x, int bit)
{
	int wordidx = bit >> 5; // int wordidx = bit / 32;
	int bitidx = bit & 0x1F; // int bitidx = (bit % 32);


	
	if (wordidx == 0) { return (x.w0 >> bitidx) & 0x1;}	
	if (wordidx == 1) { return (x.w1 >> bitidx) & 0x1;}	
	if (wordidx == 2) { return (x.w2 >> bitidx) & 0x1;}	
	if (wordidx == 3) { return (x.w3 >> bitidx) & 0x1;}	
	if (wordidx == 4) { return (x.w4 >> bitidx) & 0x1;}	
	if (wordidx == 5) { return (x.w5 >> bitidx) & 0x1;}	
	if (wordidx == 6) { return (x.w6 >> bitidx) & 0x1;}	
	if (wordidx == 7) { return (x.w7 >> bitidx) & 0x1;}	
	if (wordidx == 8) { return (x.w8 >> bitidx) & 0x1;}	
	if (wordidx == 9) { return (x.w9 >> bitidx) & 0x1;}	
	if (wordidx == 10) { return (x.w10 >> bitidx) & 0x1;}	
	if (wordidx == 11) { return (x.w11 >> bitidx) & 0x1;}	
	if (wordidx == 12) { return (x.w12 >> bitidx) & 0x1;}	
	if (wordidx == 13) { return (x.w13 >> bitidx) & 0x1;}	
	if (wordidx == 14) { return (x.w14 >> bitidx) & 0x1;}	
	if (wordidx == 15) { return (x.w15 >> bitidx) & 0x1;}	
	if (wordidx == 16) { return (x.w16 >> bitidx) & 0x1;}	
	if (wordidx == 17) { return (x.w17 >> bitidx) & 0x1;}	
	if (wordidx == 18) { return (x.w18 >> bitidx) & 0x1;}	
	if (wordidx == 19) { return (x.w19 >> bitidx) & 0x1;}	
	if (wordidx == 20) { return (x.w20 >> bitidx) & 0x1;}	
	if (wordidx == 21) { return (x.w21 >> bitidx) & 0x1;}	
	if (wordidx == 22) { return (x.w22 >> bitidx) & 0x1;}	
	if (wordidx == 23) { return (x.w23 >> bitidx) & 0x1;}	
	if (wordidx == 24) { return (x.w24 >> bitidx) & 0x1;}	
	if (wordidx == 25) { return (x.w25 >> bitidx) & 0x1;}	
	if (wordidx == 26) { return (x.w26 >> bitidx) & 0x1;}	
	if (wordidx == 27) { return (x.w27 >> bitidx) & 0x1;}	
	if (wordidx == 28) { return (x.w28 >> bitidx) & 0x1;}	
	if (wordidx == 29) { return (x.w29 >> bitidx) & 0x1;}	
	if (wordidx == 30) { return (x.w30 >> bitidx) & 0x1;}	
	if (wordidx == 31) { return (x.w31 >> bitidx) & 0x1;}

}

/**
* Sets a byte in a 32bits word of the 512 stream.
* It cannot be used concurrently
*/
void ap_uint_512_set_word_byte(ap_uint_512p v, int wordidx, int byteidx, unsigned int value)
{
	unsigned int mask = (0xFF << (byteidx * 8));
	unsigned int nmask = ~mask;

	int bit0 = (wordidx >> 0) & 0x1;
	int bit1 = (wordidx >> 1) & 0x1;
	int bit2 = (wordidx >> 2) & 0x1;
	int bit3 = (wordidx >> 3) & 0x1;
	int nbit0 = (~bit0) & 0x1;
	int nbit1 = (~bit1) & 0x1;
	int nbit2 = (~bit2) & 0x1;
	int nbit3 = (~bit3) & 0x1;
	int sel0=nbit0 & nbit1 & nbit2 & nbit3;
	int sel1=bit0 & nbit1 & nbit2 & nbit3;
	int sel2=nbit0 & bit1 & nbit2 & nbit3;
	int sel3=bit0 & bit1 & nbit2 & nbit3;
	int sel4=nbit0 & nbit1 & bit2 & nbit3;
	int sel5=bit0 & nbit1 & bit2 & nbit3;
	int sel6=nbit0 & bit1 & bit2 & nbit3;
	int sel7=bit0 & bit1 & bit2 & nbit3;
	int sel8=nbit0 & nbit1 & nbit2 & bit3;
	int sel9=bit0 & nbit1 & nbit2 & bit3;
	int sel10=nbit0 & bit1 & nbit2 & bit3;
	int sel11=bit0 & bit1 & nbit2 & bit3;
	int sel12=nbit0 & nbit1 & bit2 & bit3;
	int sel13=bit0 & nbit1 & bit2 & bit3;
	int sel14=nbit0 & bit1 & bit2 & bit3;
	int sel15=bit0 & bit1 & bit2 & bit3;

	
	if (sel0){ v->w0 = (v->w0 & nmask) | (value << (byteidx*8)); }
	if (sel1){ v->w1 = (v->w1 & nmask) | (value << (byteidx*8)); }
	if (sel2){ v->w2 = (v->w2 & nmask) | (value << (byteidx*8)); }
	if (sel3){ v->w3 = (v->w3 & nmask) | (value << (byteidx*8)); }
	if (sel4){ v->w4 = (v->w4 & nmask) | (value << (byteidx*8)); }
	if (sel5){ v->w5 = (v->w5 & nmask) | (value << (byteidx*8)); }
	if (sel6){ v->w6 = (v->w6 & nmask) | (value << (byteidx*8)); }
	if (sel7){ v->w7 = (v->w7 & nmask) | (value << (byteidx*8)); }
	if (sel8){ v->w8 = (v->w8 & nmask) | (value << (byteidx*8)); }
	if (sel9){ v->w9 = (v->w9 & nmask) | (value << (byteidx*8)); }
	if (sel10){ v->w10 = (v->w10 & nmask) | (value << (byteidx*8)); }
	if (sel11){ v->w11 = (v->w11 & nmask) | (value << (byteidx*8)); }
	if (sel12){ v->w12 = (v->w12 & nmask) | (value << (byteidx*8)); }
	if (sel13){ v->w13 = (v->w13 & nmask) | (value << (byteidx*8)); }
	if (sel14){ v->w14 = (v->w14 & nmask) | (value << (byteidx*8)); }
	if (sel15){ v->w15 = (v->w15 & nmask) | (value << (byteidx*8)); }			
}

void ap_uint_512_or_word_byte(ap_uint_512p v, int wordidx, int byteidx, unsigned int value)
{
	int bit0 = (wordidx >> 0) & 0x1;
	int bit1 = (wordidx >> 1) & 0x1;
	int bit2 = (wordidx >> 2) & 0x1;
	int bit3 = (wordidx >> 3) & 0x1;
	int nbit0 = (~bit0) & 0x1;
	int nbit1 = (~bit1) & 0x1;
	int nbit2 = (~bit2) & 0x1;
	int nbit3 = (~bit3) & 0x1;
	int sel0=nbit0 & nbit1 & nbit2 & nbit3;
	int sel1=bit0 & nbit1 & nbit2 & nbit3;
	int sel2=nbit0 & bit1 & nbit2 & nbit3;
	int sel3=bit0 & bit1 & nbit2 & nbit3;
	int sel4=nbit0 & nbit1 & bit2 & nbit3;
	int sel5=bit0 & nbit1 & bit2 & nbit3;
	int sel6=nbit0 & bit1 & bit2 & nbit3;
	int sel7=bit0 & bit1 & bit2 & nbit3;
	int sel8=nbit0 & nbit1 & nbit2 & bit3;
	int sel9=bit0 & nbit1 & nbit2 & bit3;
	int sel10=nbit0 & bit1 & nbit2 & bit3;
	int sel11=bit0 & bit1 & nbit2 & bit3;
	int sel12=nbit0 & nbit1 & bit2 & bit3;
	int sel13=bit0 & nbit1 & bit2 & bit3;
	int sel14=nbit0 & bit1 & bit2 & bit3;
	int sel15=bit0 & bit1 & bit2 & bit3;


	
	if (sel0){ v->w0 = v->w0  | (value << (byteidx*8)); }
	if (sel1){ v->w1 = v->w1  | (value << (byteidx*8)); }
	if (sel2){ v->w2 = v->w2  | (value << (byteidx*8)); }
	if (sel3){ v->w3 = v->w3  | (value << (byteidx*8)); }
	if (sel4){ v->w4 = v->w4  | (value << (byteidx*8)); }
	if (sel5){ v->w5 = v->w5  | (value << (byteidx*8)); }
	if (sel6){ v->w6 = v->w6  | (value << (byteidx*8)); }
	if (sel7){ v->w7 = v->w7  | (value << (byteidx*8)); }
	if (sel8){ v->w8 = v->w8  | (value << (byteidx*8)); }
	if (sel9){ v->w9 = v->w9  | (value << (byteidx*8)); }
	if (sel10){ v->w10 = v->w10  | (value << (byteidx*8)); }
	if (sel11){ v->w11 = v->w11  | (value << (byteidx*8)); }
	if (sel12){ v->w12 = v->w12  | (value << (byteidx*8)); }
	if (sel13){ v->w13 = v->w13  | (value << (byteidx*8)); }
	if (sel14){ v->w14 = v->w14  | (value << (byteidx*8)); }
	if (sel15){ v->w15 = v->w15  | (value << (byteidx*8)); }	
	
}

/**
* Sets a byte value in the lowest n byte of the number (starting from the right / LSB)
*	
* @param v pointer to the number
* @param index base position in bytes
* @param value to set
*/
void ap_uint_512_setLowByte(ap_uint_512p v, int index, int value)
{	
	int wordidx = index >> 2; // int wordidx = (index * 8) / 32;
	int byteidx = index & 0x3; // int byteidx = (index % (32/8));
	
	ap_uint_512_set_word_byte(v, wordidx, byteidx, value);

}

void ap_uint_512_orLowByteConcurrent(ap_uint_512p v, int index, int value)
{	
	int wordidx = index >> 2; // int wordidx = (index * 8) / 32;
	int byteidx = index & 0x3; // int byteidx = (index % (32/8));
	
	ap_uint_512_or_word_byte(v, wordidx, byteidx, value);
}

void ap_uint_512_setHighByte(ap_uint_512p v, int index, int value)
{	
	ap_uint_512_setLowByte(v, (512/8) - 1 - index, value);
}

void ap_uint_512_orHighByteConcurrent(ap_uint_512p v, int index, int value)
{	
	ap_uint_512_orLowByteConcurrent(v, (512/8) - 1 - index, value);
}

unsigned char ap_uint_512_getHighByte(ap_uint_512 v, int index)
{
	return ap_uint_512_getLowByte(v, (512/8) - 1 - index);
}

/**
* @param one of the 64 bytes of the 512 bits word
*/
unsigned char ap_uint_512_getLowByte(ap_uint_512 v, int index)
{
	int wordidx = (index >> 2); 	// int wordidx = (index * 8) / 32;
	int byteidx = (index & 0x03);	// (index % (32/8));

	unsigned int dword = ap_uint_512_getDword(v, wordidx);

	return (dword >> (8*byteidx)) & 0xFF;
}

unsigned int ap_uint_512_getDword(ap_uint_512 v, int wordidx)
{	
	int bit0 = (wordidx >> 0) & 0x1;
	int bit1 = (wordidx >> 1) & 0x1;
	int bit2 = (wordidx >> 2) & 0x1;
	int bit3 = (wordidx >> 3) & 0x1;
	int nbit0 = (~bit0) & 0x1;
	int nbit1 = (~bit1) & 0x1;
	int nbit2 = (~bit2) & 0x1;
	int nbit3 = (~bit3) & 0x1;
	int sel0=nbit0 & nbit1 & nbit2 & nbit3;
	int sel1=bit0 & nbit1 & nbit2 & nbit3;
	int sel2=nbit0 & bit1 & nbit2 & nbit3;
	int sel3=bit0 & bit1 & nbit2 & nbit3;
	int sel4=nbit0 & nbit1 & bit2 & nbit3;
	int sel5=bit0 & nbit1 & bit2 & nbit3;
	int sel6=nbit0 & bit1 & bit2 & nbit3;
	int sel7=bit0 & bit1 & bit2 & nbit3;
	int sel8=nbit0 & nbit1 & nbit2 & bit3;
	int sel9=bit0 & nbit1 & nbit2 & bit3;
	int sel10=nbit0 & bit1 & nbit2 & bit3;
	int sel11=bit0 & bit1 & nbit2 & bit3;
	int sel12=nbit0 & nbit1 & bit2 & bit3;
	int sel13=bit0 & nbit1 & bit2 & bit3;
	int sel14=nbit0 & bit1 & bit2 & bit3;
	int sel15=bit0 & bit1 & bit2 & bit3;


	
	if (sel0){ return v.w0;}
	if (sel1){ return v.w1;}
	if (sel2){ return v.w2;}
	if (sel3){ return v.w3;}
	if (sel4){ return v.w4;}
	if (sel5){ return v.w5;}
	if (sel6){ return v.w6;}
	if (sel7){ return v.w7;}
	if (sel8){ return v.w8;}
	if (sel9){ return v.w9;}
	if (sel10){ return v.w10;}
	if (sel11){ return v.w11;}
	if (sel12){ return v.w12;}
	if (sel13){ return v.w13;}
	if (sel14){ return v.w14;}
	if (sel15){ return v.w15;}	



#ifdef FPGA_EMULATION
	assert(FALSE);
#endif
	return 0;
}

/**
* Resets the variable (set to zero)
*/
void ap_uint_512_zero(ap_uint_512p v)
{
	v->w0 = 0;
	v->w1 = 0;
	v->w2 = 0;
	v->w3 = 0;
	v->w4 = 0;
	v->w5 = 0;
	v->w6 = 0;
	v->w7 = 0;
	v->w8 = 0;
	v->w9 = 0;
	v->w10 = 0;
	v->w11 = 0;
	v->w12 = 0;
	v->w13 = 0;
	v->w14 = 0;
	v->w15 = 0;	
}

/**
* Resets the variable (set to zero)
*/
void ap_uint_1024_zero(ap_uint_1024p v)
{
	v->w0 = 0;
	v->w1 = 0;
	v->w2 = 0;
	v->w3 = 0;
	v->w4 = 0;
	v->w5 = 0;
	v->w6 = 0;
	v->w7 = 0;
	v->w8 = 0;
	v->w9 = 0;
	v->w10 = 0;
	v->w11 = 0;
	v->w12 = 0;
	v->w13 = 0;
	v->w14 = 0;
	v->w15 = 0;
	v->w16 = 0;
	v->w17 = 0;
	v->w18 = 0;
	v->w19 = 0;
	v->w20 = 0;
	v->w21 = 0;
	v->w22 = 0;
	v->w23 = 0;
	v->w24 = 0;
	v->w25 = 0;
	v->w26 = 0;
	v->w27 = 0;
	v->w28 = 0;
	v->w29 = 0;
	v->w30 = 0;
	v->w31 = 0;	
}


int ap_uint_512_isZero(ap_uint_512 v)
{
	if (
		(v.w0 == 0) &&
		(v.w1 == 0) &&
		(v.w2 == 0) &&
		(v.w3 == 0) &&
		(v.w4 == 0) &&
		(v.w5 == 0) &&
		(v.w6 == 0) &&
		(v.w7 == 0) &&
		(v.w8 == 0) &&
		(v.w9 == 0) &&
		(v.w10 == 0) &&
		(v.w11 == 0) &&
		(v.w12 == 0) &&
		(v.w13 == 0) &&
		(v.w14 == 0) &&
		(v.w15 == 0) &&
		1)	 return 1;
	else return 0;
}

void ap_uint_512_set(ap_uint_512p dst, ap_uint_512 src)
{

	dst->w0 = src.w0;
	dst->w1 = src.w1;
	dst->w2 = src.w2;
	dst->w3 = src.w3;
	dst->w4 = src.w4;
	dst->w5 = src.w5;
	dst->w6 = src.w6;
	dst->w7 = src.w7;
	dst->w8 = src.w8;
	dst->w9 = src.w9;
	dst->w10 = src.w10;
	dst->w11 = src.w11;
	dst->w12 = src.w12;
	dst->w13 = src.w13;
	dst->w14 = src.w14;
	dst->w15 = src.w15;
}


/**
* Copies a variable to another 
* @param destination
* @param source
*/
void ap_uint_1024_set(ap_uint_1024p dst, ap_uint_1024 src)
{

	dst->w0 = src.w0;
	dst->w1 = src.w1;
	dst->w2 = src.w2;
	dst->w3 = src.w3;
	dst->w4 = src.w4;
	dst->w5 = src.w5;
	dst->w6 = src.w6;
	dst->w7 = src.w7;
	dst->w8 = src.w8;
	dst->w9 = src.w9;
	dst->w10 = src.w10;
	dst->w11 = src.w11;
	dst->w12 = src.w12;
	dst->w13 = src.w13;
	dst->w14 = src.w14;
	dst->w15 = src.w15;
	dst->w16 = src.w16;
	dst->w17 = src.w17;
	dst->w18 = src.w18;
	dst->w19 = src.w19;
	dst->w20 = src.w20;
	dst->w21 = src.w21;
	dst->w22 = src.w22;
	dst->w23 = src.w23;
	dst->w24 = src.w24;
	dst->w25 = src.w25;
	dst->w26 = src.w26;
	dst->w27 = src.w27;
	dst->w28 = src.w28;
	dst->w29 = src.w29;
	dst->w30 = src.w30;
	dst->w31 = src.w31;

}

void ap_uint_512_set_bit(ap_uint_512p v, int bit, int x)
{
	int wordidx = bit >> 5; // int wordidx = bit / 32;
	int bitidx = bit & 0x1F; // int bitidx = (bit % 32);

	int bit0 = (wordidx >> 0) & 0x1;
	int bit1 = (wordidx >> 1) & 0x1;
	int bit2 = (wordidx >> 2) & 0x1;
	int bit3 = (wordidx >> 3) & 0x1;
	int nbit0 = (~bit0) & 0x1;
	int nbit1 = (~bit1) & 0x1;
	int nbit2 = (~bit2) & 0x1;
	int nbit3 = (~bit3) & 0x1;
	int sel0=nbit0 & nbit1 & nbit2 & nbit3;
	int sel1=bit0 & nbit1 & nbit2 & nbit3;
	int sel2=nbit0 & bit1 & nbit2 & nbit3;
	int sel3=bit0 & bit1 & nbit2 & nbit3;
	int sel4=nbit0 & nbit1 & bit2 & nbit3;
	int sel5=bit0 & nbit1 & bit2 & nbit3;
	int sel6=nbit0 & bit1 & bit2 & nbit3;
	int sel7=bit0 & bit1 & bit2 & nbit3;
	int sel8=nbit0 & nbit1 & nbit2 & bit3;
	int sel9=bit0 & nbit1 & nbit2 & bit3;
	int sel10=nbit0 & bit1 & nbit2 & bit3;
	int sel11=bit0 & bit1 & nbit2 & bit3;
	int sel12=nbit0 & nbit1 & bit2 & bit3;
	int sel13=bit0 & nbit1 & bit2 & bit3;
	int sel14=nbit0 & bit1 & bit2 & bit3;
	int sel15=bit0 & bit1 & bit2 & bit3;


	
	if (sel0) if (x) v->w0 |= (1 << bitidx); else v->w0 &= (~(1 << bitidx));	
	if (sel1) if (x) v->w1 |= (1 << bitidx); else v->w1 &= (~(1 << bitidx));	
	if (sel2) if (x) v->w2 |= (1 << bitidx); else v->w2 &= (~(1 << bitidx));	
	if (sel3) if (x) v->w3 |= (1 << bitidx); else v->w3 &= (~(1 << bitidx));	
	if (sel4) if (x) v->w4 |= (1 << bitidx); else v->w4 &= (~(1 << bitidx));	
	if (sel5) if (x) v->w5 |= (1 << bitidx); else v->w5 &= (~(1 << bitidx));	
	if (sel6) if (x) v->w6 |= (1 << bitidx); else v->w6 &= (~(1 << bitidx));	
	if (sel7) if (x) v->w7 |= (1 << bitidx); else v->w7 &= (~(1 << bitidx));	
	if (sel8) if (x) v->w8 |= (1 << bitidx); else v->w8 &= (~(1 << bitidx));	
	if (sel9) if (x) v->w9 |= (1 << bitidx); else v->w9 &= (~(1 << bitidx));	
	if (sel10) if (x) v->w10 |= (1 << bitidx); else v->w10 &= (~(1 << bitidx));	
	if (sel11) if (x) v->w11 |= (1 << bitidx); else v->w11 &= (~(1 << bitidx));	
	if (sel12) if (x) v->w12 |= (1 << bitidx); else v->w12 &= (~(1 << bitidx));	
	if (sel13) if (x) v->w13 |= (1 << bitidx); else v->w13 &= (~(1 << bitidx));	
	if (sel14) if (x) v->w14 |= (1 << bitidx); else v->w14 &= (~(1 << bitidx));	
	if (sel15) if (x) v->w15 |= (1 << bitidx); else v->w15 &= (~(1 << bitidx));

}

void ap_uint_512_or_bit(ap_uint_512p v, int bit, int x)
{
	int wordidx = bit >> 5; // int wordidx = bit / 32;
	int bitidx = bit & 0x1F; // int bitidx = (bit % 32);


	int bit0 = (wordidx >> 0) & 0x1;
	int bit1 = (wordidx >> 1) & 0x1;
	int bit2 = (wordidx >> 2) & 0x1;
	int bit3 = (wordidx >> 3) & 0x1;
	int nbit0 = (~bit0) & 0x1;
	int nbit1 = (~bit1) & 0x1;
	int nbit2 = (~bit2) & 0x1;
	int nbit3 = (~bit3) & 0x1;
	int sel0=nbit0 & nbit1 & nbit2 & nbit3;
	int sel1=bit0 & nbit1 & nbit2 & nbit3;
	int sel2=nbit0 & bit1 & nbit2 & nbit3;
	int sel3=bit0 & bit1 & nbit2 & nbit3;
	int sel4=nbit0 & nbit1 & bit2 & nbit3;
	int sel5=bit0 & nbit1 & bit2 & nbit3;
	int sel6=nbit0 & bit1 & bit2 & nbit3;
	int sel7=bit0 & bit1 & bit2 & nbit3;
	int sel8=nbit0 & nbit1 & nbit2 & bit3;
	int sel9=bit0 & nbit1 & nbit2 & bit3;
	int sel10=nbit0 & bit1 & nbit2 & bit3;
	int sel11=bit0 & bit1 & nbit2 & bit3;
	int sel12=nbit0 & nbit1 & bit2 & bit3;
	int sel13=bit0 & nbit1 & bit2 & bit3;
	int sel14=nbit0 & bit1 & bit2 & bit3;
	int sel15=bit0 & bit1 & bit2 & bit3;


	
	if (sel0){ v->w0 |= (x) ? (1 << bitidx) : 0; }	
	if (sel1){ v->w1 |= (x) ? (1 << bitidx) : 0; }	
	if (sel2){ v->w2 |= (x) ? (1 << bitidx) : 0; }	
	if (sel3){ v->w3 |= (x) ? (1 << bitidx) : 0; }	
	if (sel4){ v->w4 |= (x) ? (1 << bitidx) : 0; }	
	if (sel5){ v->w5 |= (x) ? (1 << bitidx) : 0; }	
	if (sel6){ v->w6 |= (x) ? (1 << bitidx) : 0; }	
	if (sel7){ v->w7 |= (x) ? (1 << bitidx) : 0; }	
	if (sel8){ v->w8 |= (x) ? (1 << bitidx) : 0; }	
	if (sel9){ v->w9 |= (x) ? (1 << bitidx) : 0; }	
	if (sel10){ v->w10 |= (x) ? (1 << bitidx) : 0; }	
	if (sel11){ v->w11 |= (x) ? (1 << bitidx) : 0; }	
	if (sel12){ v->w12 |= (x) ? (1 << bitidx) : 0; }	
	if (sel13){ v->w13 |= (x) ? (1 << bitidx) : 0; }	
	if (sel14){ v->w14 |= (x) ? (1 << bitidx) : 0; }	
	if (sel15){ v->w15 |= (x) ? (1 << bitidx) : 0; }
	
}


void ap_uint_1024_or_bit(ap_uint_1024p v, int bit, int x)
{
	int wordidx = bit >> 5; // int wordidx = bit / 32;
	int bitidx = bit & 0x1F; // int bitidx = (bit % 32);

	
	if (wordidx == 0){ v->w0 |= (x) ? (1 << bitidx) : 0; }	
	if (wordidx == 1){ v->w1 |= (x) ? (1 << bitidx) : 0; }	
	if (wordidx == 2){ v->w2 |= (x) ? (1 << bitidx) : 0; }	
	if (wordidx == 3){ v->w3 |= (x) ? (1 << bitidx) : 0; }	
	if (wordidx == 4){ v->w4 |= (x) ? (1 << bitidx) : 0; }	
	if (wordidx == 5){ v->w5 |= (x) ? (1 << bitidx) : 0; }	
	if (wordidx == 6){ v->w6 |= (x) ? (1 << bitidx) : 0; }	
	if (wordidx == 7){ v->w7 |= (x) ? (1 << bitidx) : 0; }	
	if (wordidx == 8){ v->w8 |= (x) ? (1 << bitidx) : 0; }	
	if (wordidx == 9){ v->w9 |= (x) ? (1 << bitidx) : 0; }	
	if (wordidx == 10){ v->w10 |= (x) ? (1 << bitidx) : 0; }	
	if (wordidx == 11){ v->w11 |= (x) ? (1 << bitidx) : 0; }	
	if (wordidx == 12){ v->w12 |= (x) ? (1 << bitidx) : 0; }	
	if (wordidx == 13){ v->w13 |= (x) ? (1 << bitidx) : 0; }	
	if (wordidx == 14){ v->w14 |= (x) ? (1 << bitidx) : 0; }	
	if (wordidx == 15){ v->w15 |= (x) ? (1 << bitidx) : 0; }	
	if (wordidx == 16){ v->w16 |= (x) ? (1 << bitidx) : 0; }	
	if (wordidx == 17){ v->w17 |= (x) ? (1 << bitidx) : 0; }	
	if (wordidx == 18){ v->w18 |= (x) ? (1 << bitidx) : 0; }	
	if (wordidx == 19){ v->w19 |= (x) ? (1 << bitidx) : 0; }	
	if (wordidx == 20){ v->w20 |= (x) ? (1 << bitidx) : 0; }	
	if (wordidx == 21){ v->w21 |= (x) ? (1 << bitidx) : 0; }	
	if (wordidx == 22){ v->w22 |= (x) ? (1 << bitidx) : 0; }	
	if (wordidx == 23){ v->w23 |= (x) ? (1 << bitidx) : 0; }	
	if (wordidx == 24){ v->w24 |= (x) ? (1 << bitidx) : 0; }	
	if (wordidx == 25){ v->w25 |= (x) ? (1 << bitidx) : 0; }	
	if (wordidx == 26){ v->w26 |= (x) ? (1 << bitidx) : 0; }	
	if (wordidx == 27){ v->w27 |= (x) ? (1 << bitidx) : 0; }	
	if (wordidx == 28){ v->w28 |= (x) ? (1 << bitidx) : 0; }	
	if (wordidx == 29){ v->w29 |= (x) ? (1 << bitidx) : 0; }	
	if (wordidx == 30){ v->w30 |= (x) ? (1 << bitidx) : 0; }	
	if (wordidx == 31){ v->w31 |= (x) ? (1 << bitidx) : 0; }
	
}

void ap_uint_1024_set_bit(ap_uint_1024p v, int bit, int x)
{
	int wordidx = bit >> 5; // int wordidx = bit / 32;
	int bitidx = bit & 0x1F; // int bitidx = (bit % 32);
	
	
	if (wordidx == 0){
		if (x) v->w0 |= (1 << bitidx);
		else v->w0 &= (~(1 << bitidx));
	}	
	if (wordidx == 1){
		if (x) v->w1 |= (1 << bitidx);
		else v->w1 &= (~(1 << bitidx));
	}	
	if (wordidx == 2){
		if (x) v->w2 |= (1 << bitidx);
		else v->w2 &= (~(1 << bitidx));
	}	
	if (wordidx == 3){
		if (x) v->w3 |= (1 << bitidx);
		else v->w3 &= (~(1 << bitidx));
	}	
	if (wordidx == 4){
		if (x) v->w4 |= (1 << bitidx);
		else v->w4 &= (~(1 << bitidx));
	}	
	if (wordidx == 5){
		if (x) v->w5 |= (1 << bitidx);
		else v->w5 &= (~(1 << bitidx));
	}	
	if (wordidx == 6){
		if (x) v->w6 |= (1 << bitidx);
		else v->w6 &= (~(1 << bitidx));
	}	
	if (wordidx == 7){
		if (x) v->w7 |= (1 << bitidx);
		else v->w7 &= (~(1 << bitidx));
	}	
	if (wordidx == 8){
		if (x) v->w8 |= (1 << bitidx);
		else v->w8 &= (~(1 << bitidx));
	}	
	if (wordidx == 9){
		if (x) v->w9 |= (1 << bitidx);
		else v->w9 &= (~(1 << bitidx));
	}	
	if (wordidx == 10){
		if (x) v->w10 |= (1 << bitidx);
		else v->w10 &= (~(1 << bitidx));
	}	
	if (wordidx == 11){
		if (x) v->w11 |= (1 << bitidx);
		else v->w11 &= (~(1 << bitidx));
	}	
	if (wordidx == 12){
		if (x) v->w12 |= (1 << bitidx);
		else v->w12 &= (~(1 << bitidx));
	}	
	if (wordidx == 13){
		if (x) v->w13 |= (1 << bitidx);
		else v->w13 &= (~(1 << bitidx));
	}	
	if (wordidx == 14){
		if (x) v->w14 |= (1 << bitidx);
		else v->w14 &= (~(1 << bitidx));
	}	
	if (wordidx == 15){
		if (x) v->w15 |= (1 << bitidx);
		else v->w15 &= (~(1 << bitidx));
	}	
	if (wordidx == 16){
		if (x) v->w16 |= (1 << bitidx);
		else v->w16 &= (~(1 << bitidx));
	}	
	if (wordidx == 17){
		if (x) v->w17 |= (1 << bitidx);
		else v->w17 &= (~(1 << bitidx));
	}	
	if (wordidx == 18){
		if (x) v->w18 |= (1 << bitidx);
		else v->w18 &= (~(1 << bitidx));
	}	
	if (wordidx == 19){
		if (x) v->w19 |= (1 << bitidx);
		else v->w19 &= (~(1 << bitidx));
	}	
	if (wordidx == 20){
		if (x) v->w20 |= (1 << bitidx);
		else v->w20 &= (~(1 << bitidx));
	}	
	if (wordidx == 21){
		if (x) v->w21 |= (1 << bitidx);
		else v->w21 &= (~(1 << bitidx));
	}	
	if (wordidx == 22){
		if (x) v->w22 |= (1 << bitidx);
		else v->w22 &= (~(1 << bitidx));
	}	
	if (wordidx == 23){
		if (x) v->w23 |= (1 << bitidx);
		else v->w23 &= (~(1 << bitidx));
	}	
	if (wordidx == 24){
		if (x) v->w24 |= (1 << bitidx);
		else v->w24 &= (~(1 << bitidx));
	}	
	if (wordidx == 25){
		if (x) v->w25 |= (1 << bitidx);
		else v->w25 &= (~(1 << bitidx));
	}	
	if (wordidx == 26){
		if (x) v->w26 |= (1 << bitidx);
		else v->w26 &= (~(1 << bitidx));
	}	
	if (wordidx == 27){
		if (x) v->w27 |= (1 << bitidx);
		else v->w27 &= (~(1 << bitidx));
	}	
	if (wordidx == 28){
		if (x) v->w28 |= (1 << bitidx);
		else v->w28 &= (~(1 << bitidx));
	}	
	if (wordidx == 29){
		if (x) v->w29 |= (1 << bitidx);
		else v->w29 &= (~(1 << bitidx));
	}	
	if (wordidx == 30){
		if (x) v->w30 |= (1 << bitidx);
		else v->w30 &= (~(1 << bitidx));
	}	
	if (wordidx == 31){
		if (x) v->w31 |= (1 << bitidx);
		else v->w31 &= (~(1 << bitidx));
	}

}

void ap_uint_512_onesLow(ap_uint_512p v, int n)
{
	ap_uint_512_zero(v);

	
	ap_uint_512_or_bit(v, 0, (0<n)?1:0);
	ap_uint_512_or_bit(v, 1, (1<n)?1:0);
	ap_uint_512_or_bit(v, 2, (2<n)?1:0);
	ap_uint_512_or_bit(v, 3, (3<n)?1:0);
	ap_uint_512_or_bit(v, 4, (4<n)?1:0);
	ap_uint_512_or_bit(v, 5, (5<n)?1:0);
	ap_uint_512_or_bit(v, 6, (6<n)?1:0);
	ap_uint_512_or_bit(v, 7, (7<n)?1:0);
	ap_uint_512_or_bit(v, 8, (8<n)?1:0);
	ap_uint_512_or_bit(v, 9, (9<n)?1:0);
	ap_uint_512_or_bit(v, 10, (10<n)?1:0);
	ap_uint_512_or_bit(v, 11, (11<n)?1:0);
	ap_uint_512_or_bit(v, 12, (12<n)?1:0);
	ap_uint_512_or_bit(v, 13, (13<n)?1:0);
	ap_uint_512_or_bit(v, 14, (14<n)?1:0);
	ap_uint_512_or_bit(v, 15, (15<n)?1:0);
	ap_uint_512_or_bit(v, 16, (16<n)?1:0);
	ap_uint_512_or_bit(v, 17, (17<n)?1:0);
	ap_uint_512_or_bit(v, 18, (18<n)?1:0);
	ap_uint_512_or_bit(v, 19, (19<n)?1:0);
	ap_uint_512_or_bit(v, 20, (20<n)?1:0);
	ap_uint_512_or_bit(v, 21, (21<n)?1:0);
	ap_uint_512_or_bit(v, 22, (22<n)?1:0);
	ap_uint_512_or_bit(v, 23, (23<n)?1:0);
	ap_uint_512_or_bit(v, 24, (24<n)?1:0);
	ap_uint_512_or_bit(v, 25, (25<n)?1:0);
	ap_uint_512_or_bit(v, 26, (26<n)?1:0);
	ap_uint_512_or_bit(v, 27, (27<n)?1:0);
	ap_uint_512_or_bit(v, 28, (28<n)?1:0);
	ap_uint_512_or_bit(v, 29, (29<n)?1:0);
	ap_uint_512_or_bit(v, 30, (30<n)?1:0);
	ap_uint_512_or_bit(v, 31, (31<n)?1:0);
	ap_uint_512_or_bit(v, 32, (32<n)?1:0);
	ap_uint_512_or_bit(v, 33, (33<n)?1:0);
	ap_uint_512_or_bit(v, 34, (34<n)?1:0);
	ap_uint_512_or_bit(v, 35, (35<n)?1:0);
	ap_uint_512_or_bit(v, 36, (36<n)?1:0);
	ap_uint_512_or_bit(v, 37, (37<n)?1:0);
	ap_uint_512_or_bit(v, 38, (38<n)?1:0);
	ap_uint_512_or_bit(v, 39, (39<n)?1:0);
	ap_uint_512_or_bit(v, 40, (40<n)?1:0);
	ap_uint_512_or_bit(v, 41, (41<n)?1:0);
	ap_uint_512_or_bit(v, 42, (42<n)?1:0);
	ap_uint_512_or_bit(v, 43, (43<n)?1:0);
	ap_uint_512_or_bit(v, 44, (44<n)?1:0);
	ap_uint_512_or_bit(v, 45, (45<n)?1:0);
	ap_uint_512_or_bit(v, 46, (46<n)?1:0);
	ap_uint_512_or_bit(v, 47, (47<n)?1:0);
	ap_uint_512_or_bit(v, 48, (48<n)?1:0);
	ap_uint_512_or_bit(v, 49, (49<n)?1:0);
	ap_uint_512_or_bit(v, 50, (50<n)?1:0);
	ap_uint_512_or_bit(v, 51, (51<n)?1:0);
	ap_uint_512_or_bit(v, 52, (52<n)?1:0);
	ap_uint_512_or_bit(v, 53, (53<n)?1:0);
	ap_uint_512_or_bit(v, 54, (54<n)?1:0);
	ap_uint_512_or_bit(v, 55, (55<n)?1:0);
	ap_uint_512_or_bit(v, 56, (56<n)?1:0);
	ap_uint_512_or_bit(v, 57, (57<n)?1:0);
	ap_uint_512_or_bit(v, 58, (58<n)?1:0);
	ap_uint_512_or_bit(v, 59, (59<n)?1:0);
	ap_uint_512_or_bit(v, 60, (60<n)?1:0);
	ap_uint_512_or_bit(v, 61, (61<n)?1:0);
	ap_uint_512_or_bit(v, 62, (62<n)?1:0);
	ap_uint_512_or_bit(v, 63, (63<n)?1:0);
	ap_uint_512_or_bit(v, 64, (64<n)?1:0);
	ap_uint_512_or_bit(v, 65, (65<n)?1:0);
	ap_uint_512_or_bit(v, 66, (66<n)?1:0);
	ap_uint_512_or_bit(v, 67, (67<n)?1:0);
	ap_uint_512_or_bit(v, 68, (68<n)?1:0);
	ap_uint_512_or_bit(v, 69, (69<n)?1:0);
	ap_uint_512_or_bit(v, 70, (70<n)?1:0);
	ap_uint_512_or_bit(v, 71, (71<n)?1:0);
	ap_uint_512_or_bit(v, 72, (72<n)?1:0);
	ap_uint_512_or_bit(v, 73, (73<n)?1:0);
	ap_uint_512_or_bit(v, 74, (74<n)?1:0);
	ap_uint_512_or_bit(v, 75, (75<n)?1:0);
	ap_uint_512_or_bit(v, 76, (76<n)?1:0);
	ap_uint_512_or_bit(v, 77, (77<n)?1:0);
	ap_uint_512_or_bit(v, 78, (78<n)?1:0);
	ap_uint_512_or_bit(v, 79, (79<n)?1:0);
	ap_uint_512_or_bit(v, 80, (80<n)?1:0);
	ap_uint_512_or_bit(v, 81, (81<n)?1:0);
	ap_uint_512_or_bit(v, 82, (82<n)?1:0);
	ap_uint_512_or_bit(v, 83, (83<n)?1:0);
	ap_uint_512_or_bit(v, 84, (84<n)?1:0);
	ap_uint_512_or_bit(v, 85, (85<n)?1:0);
	ap_uint_512_or_bit(v, 86, (86<n)?1:0);
	ap_uint_512_or_bit(v, 87, (87<n)?1:0);
	ap_uint_512_or_bit(v, 88, (88<n)?1:0);
	ap_uint_512_or_bit(v, 89, (89<n)?1:0);
	ap_uint_512_or_bit(v, 90, (90<n)?1:0);
	ap_uint_512_or_bit(v, 91, (91<n)?1:0);
	ap_uint_512_or_bit(v, 92, (92<n)?1:0);
	ap_uint_512_or_bit(v, 93, (93<n)?1:0);
	ap_uint_512_or_bit(v, 94, (94<n)?1:0);
	ap_uint_512_or_bit(v, 95, (95<n)?1:0);
	ap_uint_512_or_bit(v, 96, (96<n)?1:0);
	ap_uint_512_or_bit(v, 97, (97<n)?1:0);
	ap_uint_512_or_bit(v, 98, (98<n)?1:0);
	ap_uint_512_or_bit(v, 99, (99<n)?1:0);
	ap_uint_512_or_bit(v, 100, (100<n)?1:0);
	ap_uint_512_or_bit(v, 101, (101<n)?1:0);
	ap_uint_512_or_bit(v, 102, (102<n)?1:0);
	ap_uint_512_or_bit(v, 103, (103<n)?1:0);
	ap_uint_512_or_bit(v, 104, (104<n)?1:0);
	ap_uint_512_or_bit(v, 105, (105<n)?1:0);
	ap_uint_512_or_bit(v, 106, (106<n)?1:0);
	ap_uint_512_or_bit(v, 107, (107<n)?1:0);
	ap_uint_512_or_bit(v, 108, (108<n)?1:0);
	ap_uint_512_or_bit(v, 109, (109<n)?1:0);
	ap_uint_512_or_bit(v, 110, (110<n)?1:0);
	ap_uint_512_or_bit(v, 111, (111<n)?1:0);
	ap_uint_512_or_bit(v, 112, (112<n)?1:0);
	ap_uint_512_or_bit(v, 113, (113<n)?1:0);
	ap_uint_512_or_bit(v, 114, (114<n)?1:0);
	ap_uint_512_or_bit(v, 115, (115<n)?1:0);
	ap_uint_512_or_bit(v, 116, (116<n)?1:0);
	ap_uint_512_or_bit(v, 117, (117<n)?1:0);
	ap_uint_512_or_bit(v, 118, (118<n)?1:0);
	ap_uint_512_or_bit(v, 119, (119<n)?1:0);
	ap_uint_512_or_bit(v, 120, (120<n)?1:0);
	ap_uint_512_or_bit(v, 121, (121<n)?1:0);
	ap_uint_512_or_bit(v, 122, (122<n)?1:0);
	ap_uint_512_or_bit(v, 123, (123<n)?1:0);
	ap_uint_512_or_bit(v, 124, (124<n)?1:0);
	ap_uint_512_or_bit(v, 125, (125<n)?1:0);
	ap_uint_512_or_bit(v, 126, (126<n)?1:0);
	ap_uint_512_or_bit(v, 127, (127<n)?1:0);
	ap_uint_512_or_bit(v, 128, (128<n)?1:0);
	ap_uint_512_or_bit(v, 129, (129<n)?1:0);
	ap_uint_512_or_bit(v, 130, (130<n)?1:0);
	ap_uint_512_or_bit(v, 131, (131<n)?1:0);
	ap_uint_512_or_bit(v, 132, (132<n)?1:0);
	ap_uint_512_or_bit(v, 133, (133<n)?1:0);
	ap_uint_512_or_bit(v, 134, (134<n)?1:0);
	ap_uint_512_or_bit(v, 135, (135<n)?1:0);
	ap_uint_512_or_bit(v, 136, (136<n)?1:0);
	ap_uint_512_or_bit(v, 137, (137<n)?1:0);
	ap_uint_512_or_bit(v, 138, (138<n)?1:0);
	ap_uint_512_or_bit(v, 139, (139<n)?1:0);
	ap_uint_512_or_bit(v, 140, (140<n)?1:0);
	ap_uint_512_or_bit(v, 141, (141<n)?1:0);
	ap_uint_512_or_bit(v, 142, (142<n)?1:0);
	ap_uint_512_or_bit(v, 143, (143<n)?1:0);
	ap_uint_512_or_bit(v, 144, (144<n)?1:0);
	ap_uint_512_or_bit(v, 145, (145<n)?1:0);
	ap_uint_512_or_bit(v, 146, (146<n)?1:0);
	ap_uint_512_or_bit(v, 147, (147<n)?1:0);
	ap_uint_512_or_bit(v, 148, (148<n)?1:0);
	ap_uint_512_or_bit(v, 149, (149<n)?1:0);
	ap_uint_512_or_bit(v, 150, (150<n)?1:0);
	ap_uint_512_or_bit(v, 151, (151<n)?1:0);
	ap_uint_512_or_bit(v, 152, (152<n)?1:0);
	ap_uint_512_or_bit(v, 153, (153<n)?1:0);
	ap_uint_512_or_bit(v, 154, (154<n)?1:0);
	ap_uint_512_or_bit(v, 155, (155<n)?1:0);
	ap_uint_512_or_bit(v, 156, (156<n)?1:0);
	ap_uint_512_or_bit(v, 157, (157<n)?1:0);
	ap_uint_512_or_bit(v, 158, (158<n)?1:0);
	ap_uint_512_or_bit(v, 159, (159<n)?1:0);
	ap_uint_512_or_bit(v, 160, (160<n)?1:0);
	ap_uint_512_or_bit(v, 161, (161<n)?1:0);
	ap_uint_512_or_bit(v, 162, (162<n)?1:0);
	ap_uint_512_or_bit(v, 163, (163<n)?1:0);
	ap_uint_512_or_bit(v, 164, (164<n)?1:0);
	ap_uint_512_or_bit(v, 165, (165<n)?1:0);
	ap_uint_512_or_bit(v, 166, (166<n)?1:0);
	ap_uint_512_or_bit(v, 167, (167<n)?1:0);
	ap_uint_512_or_bit(v, 168, (168<n)?1:0);
	ap_uint_512_or_bit(v, 169, (169<n)?1:0);
	ap_uint_512_or_bit(v, 170, (170<n)?1:0);
	ap_uint_512_or_bit(v, 171, (171<n)?1:0);
	ap_uint_512_or_bit(v, 172, (172<n)?1:0);
	ap_uint_512_or_bit(v, 173, (173<n)?1:0);
	ap_uint_512_or_bit(v, 174, (174<n)?1:0);
	ap_uint_512_or_bit(v, 175, (175<n)?1:0);
	ap_uint_512_or_bit(v, 176, (176<n)?1:0);
	ap_uint_512_or_bit(v, 177, (177<n)?1:0);
	ap_uint_512_or_bit(v, 178, (178<n)?1:0);
	ap_uint_512_or_bit(v, 179, (179<n)?1:0);
	ap_uint_512_or_bit(v, 180, (180<n)?1:0);
	ap_uint_512_or_bit(v, 181, (181<n)?1:0);
	ap_uint_512_or_bit(v, 182, (182<n)?1:0);
	ap_uint_512_or_bit(v, 183, (183<n)?1:0);
	ap_uint_512_or_bit(v, 184, (184<n)?1:0);
	ap_uint_512_or_bit(v, 185, (185<n)?1:0);
	ap_uint_512_or_bit(v, 186, (186<n)?1:0);
	ap_uint_512_or_bit(v, 187, (187<n)?1:0);
	ap_uint_512_or_bit(v, 188, (188<n)?1:0);
	ap_uint_512_or_bit(v, 189, (189<n)?1:0);
	ap_uint_512_or_bit(v, 190, (190<n)?1:0);
	ap_uint_512_or_bit(v, 191, (191<n)?1:0);
	ap_uint_512_or_bit(v, 192, (192<n)?1:0);
	ap_uint_512_or_bit(v, 193, (193<n)?1:0);
	ap_uint_512_or_bit(v, 194, (194<n)?1:0);
	ap_uint_512_or_bit(v, 195, (195<n)?1:0);
	ap_uint_512_or_bit(v, 196, (196<n)?1:0);
	ap_uint_512_or_bit(v, 197, (197<n)?1:0);
	ap_uint_512_or_bit(v, 198, (198<n)?1:0);
	ap_uint_512_or_bit(v, 199, (199<n)?1:0);
	ap_uint_512_or_bit(v, 200, (200<n)?1:0);
	ap_uint_512_or_bit(v, 201, (201<n)?1:0);
	ap_uint_512_or_bit(v, 202, (202<n)?1:0);
	ap_uint_512_or_bit(v, 203, (203<n)?1:0);
	ap_uint_512_or_bit(v, 204, (204<n)?1:0);
	ap_uint_512_or_bit(v, 205, (205<n)?1:0);
	ap_uint_512_or_bit(v, 206, (206<n)?1:0);
	ap_uint_512_or_bit(v, 207, (207<n)?1:0);
	ap_uint_512_or_bit(v, 208, (208<n)?1:0);
	ap_uint_512_or_bit(v, 209, (209<n)?1:0);
	ap_uint_512_or_bit(v, 210, (210<n)?1:0);
	ap_uint_512_or_bit(v, 211, (211<n)?1:0);
	ap_uint_512_or_bit(v, 212, (212<n)?1:0);
	ap_uint_512_or_bit(v, 213, (213<n)?1:0);
	ap_uint_512_or_bit(v, 214, (214<n)?1:0);
	ap_uint_512_or_bit(v, 215, (215<n)?1:0);
	ap_uint_512_or_bit(v, 216, (216<n)?1:0);
	ap_uint_512_or_bit(v, 217, (217<n)?1:0);
	ap_uint_512_or_bit(v, 218, (218<n)?1:0);
	ap_uint_512_or_bit(v, 219, (219<n)?1:0);
	ap_uint_512_or_bit(v, 220, (220<n)?1:0);
	ap_uint_512_or_bit(v, 221, (221<n)?1:0);
	ap_uint_512_or_bit(v, 222, (222<n)?1:0);
	ap_uint_512_or_bit(v, 223, (223<n)?1:0);
	ap_uint_512_or_bit(v, 224, (224<n)?1:0);
	ap_uint_512_or_bit(v, 225, (225<n)?1:0);
	ap_uint_512_or_bit(v, 226, (226<n)?1:0);
	ap_uint_512_or_bit(v, 227, (227<n)?1:0);
	ap_uint_512_or_bit(v, 228, (228<n)?1:0);
	ap_uint_512_or_bit(v, 229, (229<n)?1:0);
	ap_uint_512_or_bit(v, 230, (230<n)?1:0);
	ap_uint_512_or_bit(v, 231, (231<n)?1:0);
	ap_uint_512_or_bit(v, 232, (232<n)?1:0);
	ap_uint_512_or_bit(v, 233, (233<n)?1:0);
	ap_uint_512_or_bit(v, 234, (234<n)?1:0);
	ap_uint_512_or_bit(v, 235, (235<n)?1:0);
	ap_uint_512_or_bit(v, 236, (236<n)?1:0);
	ap_uint_512_or_bit(v, 237, (237<n)?1:0);
	ap_uint_512_or_bit(v, 238, (238<n)?1:0);
	ap_uint_512_or_bit(v, 239, (239<n)?1:0);
	ap_uint_512_or_bit(v, 240, (240<n)?1:0);
	ap_uint_512_or_bit(v, 241, (241<n)?1:0);
	ap_uint_512_or_bit(v, 242, (242<n)?1:0);
	ap_uint_512_or_bit(v, 243, (243<n)?1:0);
	ap_uint_512_or_bit(v, 244, (244<n)?1:0);
	ap_uint_512_or_bit(v, 245, (245<n)?1:0);
	ap_uint_512_or_bit(v, 246, (246<n)?1:0);
	ap_uint_512_or_bit(v, 247, (247<n)?1:0);
	ap_uint_512_or_bit(v, 248, (248<n)?1:0);
	ap_uint_512_or_bit(v, 249, (249<n)?1:0);
	ap_uint_512_or_bit(v, 250, (250<n)?1:0);
	ap_uint_512_or_bit(v, 251, (251<n)?1:0);
	ap_uint_512_or_bit(v, 252, (252<n)?1:0);
	ap_uint_512_or_bit(v, 253, (253<n)?1:0);
	ap_uint_512_or_bit(v, 254, (254<n)?1:0);
	ap_uint_512_or_bit(v, 255, (255<n)?1:0);
	ap_uint_512_or_bit(v, 256, (256<n)?1:0);
	ap_uint_512_or_bit(v, 257, (257<n)?1:0);
	ap_uint_512_or_bit(v, 258, (258<n)?1:0);
	ap_uint_512_or_bit(v, 259, (259<n)?1:0);
	ap_uint_512_or_bit(v, 260, (260<n)?1:0);
	ap_uint_512_or_bit(v, 261, (261<n)?1:0);
	ap_uint_512_or_bit(v, 262, (262<n)?1:0);
	ap_uint_512_or_bit(v, 263, (263<n)?1:0);
	ap_uint_512_or_bit(v, 264, (264<n)?1:0);
	ap_uint_512_or_bit(v, 265, (265<n)?1:0);
	ap_uint_512_or_bit(v, 266, (266<n)?1:0);
	ap_uint_512_or_bit(v, 267, (267<n)?1:0);
	ap_uint_512_or_bit(v, 268, (268<n)?1:0);
	ap_uint_512_or_bit(v, 269, (269<n)?1:0);
	ap_uint_512_or_bit(v, 270, (270<n)?1:0);
	ap_uint_512_or_bit(v, 271, (271<n)?1:0);
	ap_uint_512_or_bit(v, 272, (272<n)?1:0);
	ap_uint_512_or_bit(v, 273, (273<n)?1:0);
	ap_uint_512_or_bit(v, 274, (274<n)?1:0);
	ap_uint_512_or_bit(v, 275, (275<n)?1:0);
	ap_uint_512_or_bit(v, 276, (276<n)?1:0);
	ap_uint_512_or_bit(v, 277, (277<n)?1:0);
	ap_uint_512_or_bit(v, 278, (278<n)?1:0);
	ap_uint_512_or_bit(v, 279, (279<n)?1:0);
	ap_uint_512_or_bit(v, 280, (280<n)?1:0);
	ap_uint_512_or_bit(v, 281, (281<n)?1:0);
	ap_uint_512_or_bit(v, 282, (282<n)?1:0);
	ap_uint_512_or_bit(v, 283, (283<n)?1:0);
	ap_uint_512_or_bit(v, 284, (284<n)?1:0);
	ap_uint_512_or_bit(v, 285, (285<n)?1:0);
	ap_uint_512_or_bit(v, 286, (286<n)?1:0);
	ap_uint_512_or_bit(v, 287, (287<n)?1:0);
	ap_uint_512_or_bit(v, 288, (288<n)?1:0);
	ap_uint_512_or_bit(v, 289, (289<n)?1:0);
	ap_uint_512_or_bit(v, 290, (290<n)?1:0);
	ap_uint_512_or_bit(v, 291, (291<n)?1:0);
	ap_uint_512_or_bit(v, 292, (292<n)?1:0);
	ap_uint_512_or_bit(v, 293, (293<n)?1:0);
	ap_uint_512_or_bit(v, 294, (294<n)?1:0);
	ap_uint_512_or_bit(v, 295, (295<n)?1:0);
	ap_uint_512_or_bit(v, 296, (296<n)?1:0);
	ap_uint_512_or_bit(v, 297, (297<n)?1:0);
	ap_uint_512_or_bit(v, 298, (298<n)?1:0);
	ap_uint_512_or_bit(v, 299, (299<n)?1:0);
	ap_uint_512_or_bit(v, 300, (300<n)?1:0);
	ap_uint_512_or_bit(v, 301, (301<n)?1:0);
	ap_uint_512_or_bit(v, 302, (302<n)?1:0);
	ap_uint_512_or_bit(v, 303, (303<n)?1:0);
	ap_uint_512_or_bit(v, 304, (304<n)?1:0);
	ap_uint_512_or_bit(v, 305, (305<n)?1:0);
	ap_uint_512_or_bit(v, 306, (306<n)?1:0);
	ap_uint_512_or_bit(v, 307, (307<n)?1:0);
	ap_uint_512_or_bit(v, 308, (308<n)?1:0);
	ap_uint_512_or_bit(v, 309, (309<n)?1:0);
	ap_uint_512_or_bit(v, 310, (310<n)?1:0);
	ap_uint_512_or_bit(v, 311, (311<n)?1:0);
	ap_uint_512_or_bit(v, 312, (312<n)?1:0);
	ap_uint_512_or_bit(v, 313, (313<n)?1:0);
	ap_uint_512_or_bit(v, 314, (314<n)?1:0);
	ap_uint_512_or_bit(v, 315, (315<n)?1:0);
	ap_uint_512_or_bit(v, 316, (316<n)?1:0);
	ap_uint_512_or_bit(v, 317, (317<n)?1:0);
	ap_uint_512_or_bit(v, 318, (318<n)?1:0);
	ap_uint_512_or_bit(v, 319, (319<n)?1:0);
	ap_uint_512_or_bit(v, 320, (320<n)?1:0);
	ap_uint_512_or_bit(v, 321, (321<n)?1:0);
	ap_uint_512_or_bit(v, 322, (322<n)?1:0);
	ap_uint_512_or_bit(v, 323, (323<n)?1:0);
	ap_uint_512_or_bit(v, 324, (324<n)?1:0);
	ap_uint_512_or_bit(v, 325, (325<n)?1:0);
	ap_uint_512_or_bit(v, 326, (326<n)?1:0);
	ap_uint_512_or_bit(v, 327, (327<n)?1:0);
	ap_uint_512_or_bit(v, 328, (328<n)?1:0);
	ap_uint_512_or_bit(v, 329, (329<n)?1:0);
	ap_uint_512_or_bit(v, 330, (330<n)?1:0);
	ap_uint_512_or_bit(v, 331, (331<n)?1:0);
	ap_uint_512_or_bit(v, 332, (332<n)?1:0);
	ap_uint_512_or_bit(v, 333, (333<n)?1:0);
	ap_uint_512_or_bit(v, 334, (334<n)?1:0);
	ap_uint_512_or_bit(v, 335, (335<n)?1:0);
	ap_uint_512_or_bit(v, 336, (336<n)?1:0);
	ap_uint_512_or_bit(v, 337, (337<n)?1:0);
	ap_uint_512_or_bit(v, 338, (338<n)?1:0);
	ap_uint_512_or_bit(v, 339, (339<n)?1:0);
	ap_uint_512_or_bit(v, 340, (340<n)?1:0);
	ap_uint_512_or_bit(v, 341, (341<n)?1:0);
	ap_uint_512_or_bit(v, 342, (342<n)?1:0);
	ap_uint_512_or_bit(v, 343, (343<n)?1:0);
	ap_uint_512_or_bit(v, 344, (344<n)?1:0);
	ap_uint_512_or_bit(v, 345, (345<n)?1:0);
	ap_uint_512_or_bit(v, 346, (346<n)?1:0);
	ap_uint_512_or_bit(v, 347, (347<n)?1:0);
	ap_uint_512_or_bit(v, 348, (348<n)?1:0);
	ap_uint_512_or_bit(v, 349, (349<n)?1:0);
	ap_uint_512_or_bit(v, 350, (350<n)?1:0);
	ap_uint_512_or_bit(v, 351, (351<n)?1:0);
	ap_uint_512_or_bit(v, 352, (352<n)?1:0);
	ap_uint_512_or_bit(v, 353, (353<n)?1:0);
	ap_uint_512_or_bit(v, 354, (354<n)?1:0);
	ap_uint_512_or_bit(v, 355, (355<n)?1:0);
	ap_uint_512_or_bit(v, 356, (356<n)?1:0);
	ap_uint_512_or_bit(v, 357, (357<n)?1:0);
	ap_uint_512_or_bit(v, 358, (358<n)?1:0);
	ap_uint_512_or_bit(v, 359, (359<n)?1:0);
	ap_uint_512_or_bit(v, 360, (360<n)?1:0);
	ap_uint_512_or_bit(v, 361, (361<n)?1:0);
	ap_uint_512_or_bit(v, 362, (362<n)?1:0);
	ap_uint_512_or_bit(v, 363, (363<n)?1:0);
	ap_uint_512_or_bit(v, 364, (364<n)?1:0);
	ap_uint_512_or_bit(v, 365, (365<n)?1:0);
	ap_uint_512_or_bit(v, 366, (366<n)?1:0);
	ap_uint_512_or_bit(v, 367, (367<n)?1:0);
	ap_uint_512_or_bit(v, 368, (368<n)?1:0);
	ap_uint_512_or_bit(v, 369, (369<n)?1:0);
	ap_uint_512_or_bit(v, 370, (370<n)?1:0);
	ap_uint_512_or_bit(v, 371, (371<n)?1:0);
	ap_uint_512_or_bit(v, 372, (372<n)?1:0);
	ap_uint_512_or_bit(v, 373, (373<n)?1:0);
	ap_uint_512_or_bit(v, 374, (374<n)?1:0);
	ap_uint_512_or_bit(v, 375, (375<n)?1:0);
	ap_uint_512_or_bit(v, 376, (376<n)?1:0);
	ap_uint_512_or_bit(v, 377, (377<n)?1:0);
	ap_uint_512_or_bit(v, 378, (378<n)?1:0);
	ap_uint_512_or_bit(v, 379, (379<n)?1:0);
	ap_uint_512_or_bit(v, 380, (380<n)?1:0);
	ap_uint_512_or_bit(v, 381, (381<n)?1:0);
	ap_uint_512_or_bit(v, 382, (382<n)?1:0);
	ap_uint_512_or_bit(v, 383, (383<n)?1:0);
	ap_uint_512_or_bit(v, 384, (384<n)?1:0);
	ap_uint_512_or_bit(v, 385, (385<n)?1:0);
	ap_uint_512_or_bit(v, 386, (386<n)?1:0);
	ap_uint_512_or_bit(v, 387, (387<n)?1:0);
	ap_uint_512_or_bit(v, 388, (388<n)?1:0);
	ap_uint_512_or_bit(v, 389, (389<n)?1:0);
	ap_uint_512_or_bit(v, 390, (390<n)?1:0);
	ap_uint_512_or_bit(v, 391, (391<n)?1:0);
	ap_uint_512_or_bit(v, 392, (392<n)?1:0);
	ap_uint_512_or_bit(v, 393, (393<n)?1:0);
	ap_uint_512_or_bit(v, 394, (394<n)?1:0);
	ap_uint_512_or_bit(v, 395, (395<n)?1:0);
	ap_uint_512_or_bit(v, 396, (396<n)?1:0);
	ap_uint_512_or_bit(v, 397, (397<n)?1:0);
	ap_uint_512_or_bit(v, 398, (398<n)?1:0);
	ap_uint_512_or_bit(v, 399, (399<n)?1:0);
	ap_uint_512_or_bit(v, 400, (400<n)?1:0);
	ap_uint_512_or_bit(v, 401, (401<n)?1:0);
	ap_uint_512_or_bit(v, 402, (402<n)?1:0);
	ap_uint_512_or_bit(v, 403, (403<n)?1:0);
	ap_uint_512_or_bit(v, 404, (404<n)?1:0);
	ap_uint_512_or_bit(v, 405, (405<n)?1:0);
	ap_uint_512_or_bit(v, 406, (406<n)?1:0);
	ap_uint_512_or_bit(v, 407, (407<n)?1:0);
	ap_uint_512_or_bit(v, 408, (408<n)?1:0);
	ap_uint_512_or_bit(v, 409, (409<n)?1:0);
	ap_uint_512_or_bit(v, 410, (410<n)?1:0);
	ap_uint_512_or_bit(v, 411, (411<n)?1:0);
	ap_uint_512_or_bit(v, 412, (412<n)?1:0);
	ap_uint_512_or_bit(v, 413, (413<n)?1:0);
	ap_uint_512_or_bit(v, 414, (414<n)?1:0);
	ap_uint_512_or_bit(v, 415, (415<n)?1:0);
	ap_uint_512_or_bit(v, 416, (416<n)?1:0);
	ap_uint_512_or_bit(v, 417, (417<n)?1:0);
	ap_uint_512_or_bit(v, 418, (418<n)?1:0);
	ap_uint_512_or_bit(v, 419, (419<n)?1:0);
	ap_uint_512_or_bit(v, 420, (420<n)?1:0);
	ap_uint_512_or_bit(v, 421, (421<n)?1:0);
	ap_uint_512_or_bit(v, 422, (422<n)?1:0);
	ap_uint_512_or_bit(v, 423, (423<n)?1:0);
	ap_uint_512_or_bit(v, 424, (424<n)?1:0);
	ap_uint_512_or_bit(v, 425, (425<n)?1:0);
	ap_uint_512_or_bit(v, 426, (426<n)?1:0);
	ap_uint_512_or_bit(v, 427, (427<n)?1:0);
	ap_uint_512_or_bit(v, 428, (428<n)?1:0);
	ap_uint_512_or_bit(v, 429, (429<n)?1:0);
	ap_uint_512_or_bit(v, 430, (430<n)?1:0);
	ap_uint_512_or_bit(v, 431, (431<n)?1:0);
	ap_uint_512_or_bit(v, 432, (432<n)?1:0);
	ap_uint_512_or_bit(v, 433, (433<n)?1:0);
	ap_uint_512_or_bit(v, 434, (434<n)?1:0);
	ap_uint_512_or_bit(v, 435, (435<n)?1:0);
	ap_uint_512_or_bit(v, 436, (436<n)?1:0);
	ap_uint_512_or_bit(v, 437, (437<n)?1:0);
	ap_uint_512_or_bit(v, 438, (438<n)?1:0);
	ap_uint_512_or_bit(v, 439, (439<n)?1:0);
	ap_uint_512_or_bit(v, 440, (440<n)?1:0);
	ap_uint_512_or_bit(v, 441, (441<n)?1:0);
	ap_uint_512_or_bit(v, 442, (442<n)?1:0);
	ap_uint_512_or_bit(v, 443, (443<n)?1:0);
	ap_uint_512_or_bit(v, 444, (444<n)?1:0);
	ap_uint_512_or_bit(v, 445, (445<n)?1:0);
	ap_uint_512_or_bit(v, 446, (446<n)?1:0);
	ap_uint_512_or_bit(v, 447, (447<n)?1:0);
	ap_uint_512_or_bit(v, 448, (448<n)?1:0);
	ap_uint_512_or_bit(v, 449, (449<n)?1:0);
	ap_uint_512_or_bit(v, 450, (450<n)?1:0);
	ap_uint_512_or_bit(v, 451, (451<n)?1:0);
	ap_uint_512_or_bit(v, 452, (452<n)?1:0);
	ap_uint_512_or_bit(v, 453, (453<n)?1:0);
	ap_uint_512_or_bit(v, 454, (454<n)?1:0);
	ap_uint_512_or_bit(v, 455, (455<n)?1:0);
	ap_uint_512_or_bit(v, 456, (456<n)?1:0);
	ap_uint_512_or_bit(v, 457, (457<n)?1:0);
	ap_uint_512_or_bit(v, 458, (458<n)?1:0);
	ap_uint_512_or_bit(v, 459, (459<n)?1:0);
	ap_uint_512_or_bit(v, 460, (460<n)?1:0);
	ap_uint_512_or_bit(v, 461, (461<n)?1:0);
	ap_uint_512_or_bit(v, 462, (462<n)?1:0);
	ap_uint_512_or_bit(v, 463, (463<n)?1:0);
	ap_uint_512_or_bit(v, 464, (464<n)?1:0);
	ap_uint_512_or_bit(v, 465, (465<n)?1:0);
	ap_uint_512_or_bit(v, 466, (466<n)?1:0);
	ap_uint_512_or_bit(v, 467, (467<n)?1:0);
	ap_uint_512_or_bit(v, 468, (468<n)?1:0);
	ap_uint_512_or_bit(v, 469, (469<n)?1:0);
	ap_uint_512_or_bit(v, 470, (470<n)?1:0);
	ap_uint_512_or_bit(v, 471, (471<n)?1:0);
	ap_uint_512_or_bit(v, 472, (472<n)?1:0);
	ap_uint_512_or_bit(v, 473, (473<n)?1:0);
	ap_uint_512_or_bit(v, 474, (474<n)?1:0);
	ap_uint_512_or_bit(v, 475, (475<n)?1:0);
	ap_uint_512_or_bit(v, 476, (476<n)?1:0);
	ap_uint_512_or_bit(v, 477, (477<n)?1:0);
	ap_uint_512_or_bit(v, 478, (478<n)?1:0);
	ap_uint_512_or_bit(v, 479, (479<n)?1:0);
	ap_uint_512_or_bit(v, 480, (480<n)?1:0);
	ap_uint_512_or_bit(v, 481, (481<n)?1:0);
	ap_uint_512_or_bit(v, 482, (482<n)?1:0);
	ap_uint_512_or_bit(v, 483, (483<n)?1:0);
	ap_uint_512_or_bit(v, 484, (484<n)?1:0);
	ap_uint_512_or_bit(v, 485, (485<n)?1:0);
	ap_uint_512_or_bit(v, 486, (486<n)?1:0);
	ap_uint_512_or_bit(v, 487, (487<n)?1:0);
	ap_uint_512_or_bit(v, 488, (488<n)?1:0);
	ap_uint_512_or_bit(v, 489, (489<n)?1:0);
	ap_uint_512_or_bit(v, 490, (490<n)?1:0);
	ap_uint_512_or_bit(v, 491, (491<n)?1:0);
	ap_uint_512_or_bit(v, 492, (492<n)?1:0);
	ap_uint_512_or_bit(v, 493, (493<n)?1:0);
	ap_uint_512_or_bit(v, 494, (494<n)?1:0);
	ap_uint_512_or_bit(v, 495, (495<n)?1:0);
	ap_uint_512_or_bit(v, 496, (496<n)?1:0);
	ap_uint_512_or_bit(v, 497, (497<n)?1:0);
	ap_uint_512_or_bit(v, 498, (498<n)?1:0);
	ap_uint_512_or_bit(v, 499, (499<n)?1:0);
	ap_uint_512_or_bit(v, 500, (500<n)?1:0);
	ap_uint_512_or_bit(v, 501, (501<n)?1:0);
	ap_uint_512_or_bit(v, 502, (502<n)?1:0);
	ap_uint_512_or_bit(v, 503, (503<n)?1:0);
	ap_uint_512_or_bit(v, 504, (504<n)?1:0);
	ap_uint_512_or_bit(v, 505, (505<n)?1:0);
	ap_uint_512_or_bit(v, 506, (506<n)?1:0);
	ap_uint_512_or_bit(v, 507, (507<n)?1:0);
	ap_uint_512_or_bit(v, 508, (508<n)?1:0);
	ap_uint_512_or_bit(v, 509, (509<n)?1:0);
	ap_uint_512_or_bit(v, 510, (510<n)?1:0);
	ap_uint_512_or_bit(v, 511, (511<n)?1:0);
}

void ap_uint_512_onesHigh(ap_uint_512p v, int n)
{
	ap_uint_512_zero(v);

	
	ap_uint_512_or_bit(v, 512-1-0, (0<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-1, (1<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-2, (2<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-3, (3<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-4, (4<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-5, (5<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-6, (6<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-7, (7<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-8, (8<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-9, (9<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-10, (10<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-11, (11<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-12, (12<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-13, (13<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-14, (14<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-15, (15<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-16, (16<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-17, (17<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-18, (18<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-19, (19<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-20, (20<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-21, (21<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-22, (22<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-23, (23<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-24, (24<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-25, (25<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-26, (26<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-27, (27<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-28, (28<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-29, (29<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-30, (30<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-31, (31<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-32, (32<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-33, (33<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-34, (34<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-35, (35<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-36, (36<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-37, (37<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-38, (38<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-39, (39<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-40, (40<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-41, (41<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-42, (42<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-43, (43<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-44, (44<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-45, (45<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-46, (46<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-47, (47<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-48, (48<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-49, (49<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-50, (50<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-51, (51<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-52, (52<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-53, (53<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-54, (54<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-55, (55<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-56, (56<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-57, (57<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-58, (58<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-59, (59<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-60, (60<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-61, (61<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-62, (62<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-63, (63<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-64, (64<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-65, (65<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-66, (66<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-67, (67<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-68, (68<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-69, (69<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-70, (70<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-71, (71<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-72, (72<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-73, (73<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-74, (74<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-75, (75<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-76, (76<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-77, (77<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-78, (78<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-79, (79<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-80, (80<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-81, (81<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-82, (82<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-83, (83<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-84, (84<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-85, (85<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-86, (86<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-87, (87<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-88, (88<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-89, (89<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-90, (90<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-91, (91<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-92, (92<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-93, (93<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-94, (94<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-95, (95<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-96, (96<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-97, (97<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-98, (98<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-99, (99<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-100, (100<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-101, (101<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-102, (102<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-103, (103<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-104, (104<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-105, (105<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-106, (106<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-107, (107<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-108, (108<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-109, (109<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-110, (110<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-111, (111<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-112, (112<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-113, (113<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-114, (114<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-115, (115<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-116, (116<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-117, (117<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-118, (118<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-119, (119<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-120, (120<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-121, (121<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-122, (122<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-123, (123<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-124, (124<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-125, (125<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-126, (126<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-127, (127<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-128, (128<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-129, (129<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-130, (130<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-131, (131<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-132, (132<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-133, (133<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-134, (134<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-135, (135<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-136, (136<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-137, (137<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-138, (138<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-139, (139<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-140, (140<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-141, (141<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-142, (142<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-143, (143<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-144, (144<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-145, (145<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-146, (146<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-147, (147<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-148, (148<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-149, (149<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-150, (150<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-151, (151<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-152, (152<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-153, (153<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-154, (154<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-155, (155<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-156, (156<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-157, (157<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-158, (158<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-159, (159<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-160, (160<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-161, (161<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-162, (162<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-163, (163<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-164, (164<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-165, (165<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-166, (166<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-167, (167<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-168, (168<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-169, (169<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-170, (170<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-171, (171<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-172, (172<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-173, (173<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-174, (174<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-175, (175<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-176, (176<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-177, (177<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-178, (178<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-179, (179<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-180, (180<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-181, (181<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-182, (182<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-183, (183<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-184, (184<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-185, (185<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-186, (186<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-187, (187<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-188, (188<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-189, (189<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-190, (190<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-191, (191<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-192, (192<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-193, (193<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-194, (194<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-195, (195<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-196, (196<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-197, (197<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-198, (198<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-199, (199<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-200, (200<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-201, (201<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-202, (202<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-203, (203<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-204, (204<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-205, (205<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-206, (206<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-207, (207<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-208, (208<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-209, (209<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-210, (210<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-211, (211<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-212, (212<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-213, (213<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-214, (214<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-215, (215<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-216, (216<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-217, (217<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-218, (218<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-219, (219<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-220, (220<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-221, (221<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-222, (222<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-223, (223<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-224, (224<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-225, (225<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-226, (226<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-227, (227<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-228, (228<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-229, (229<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-230, (230<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-231, (231<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-232, (232<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-233, (233<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-234, (234<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-235, (235<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-236, (236<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-237, (237<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-238, (238<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-239, (239<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-240, (240<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-241, (241<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-242, (242<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-243, (243<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-244, (244<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-245, (245<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-246, (246<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-247, (247<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-248, (248<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-249, (249<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-250, (250<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-251, (251<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-252, (252<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-253, (253<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-254, (254<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-255, (255<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-256, (256<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-257, (257<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-258, (258<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-259, (259<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-260, (260<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-261, (261<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-262, (262<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-263, (263<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-264, (264<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-265, (265<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-266, (266<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-267, (267<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-268, (268<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-269, (269<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-270, (270<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-271, (271<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-272, (272<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-273, (273<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-274, (274<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-275, (275<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-276, (276<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-277, (277<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-278, (278<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-279, (279<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-280, (280<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-281, (281<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-282, (282<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-283, (283<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-284, (284<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-285, (285<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-286, (286<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-287, (287<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-288, (288<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-289, (289<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-290, (290<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-291, (291<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-292, (292<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-293, (293<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-294, (294<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-295, (295<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-296, (296<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-297, (297<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-298, (298<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-299, (299<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-300, (300<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-301, (301<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-302, (302<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-303, (303<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-304, (304<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-305, (305<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-306, (306<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-307, (307<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-308, (308<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-309, (309<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-310, (310<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-311, (311<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-312, (312<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-313, (313<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-314, (314<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-315, (315<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-316, (316<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-317, (317<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-318, (318<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-319, (319<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-320, (320<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-321, (321<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-322, (322<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-323, (323<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-324, (324<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-325, (325<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-326, (326<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-327, (327<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-328, (328<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-329, (329<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-330, (330<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-331, (331<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-332, (332<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-333, (333<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-334, (334<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-335, (335<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-336, (336<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-337, (337<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-338, (338<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-339, (339<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-340, (340<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-341, (341<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-342, (342<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-343, (343<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-344, (344<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-345, (345<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-346, (346<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-347, (347<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-348, (348<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-349, (349<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-350, (350<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-351, (351<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-352, (352<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-353, (353<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-354, (354<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-355, (355<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-356, (356<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-357, (357<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-358, (358<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-359, (359<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-360, (360<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-361, (361<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-362, (362<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-363, (363<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-364, (364<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-365, (365<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-366, (366<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-367, (367<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-368, (368<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-369, (369<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-370, (370<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-371, (371<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-372, (372<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-373, (373<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-374, (374<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-375, (375<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-376, (376<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-377, (377<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-378, (378<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-379, (379<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-380, (380<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-381, (381<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-382, (382<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-383, (383<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-384, (384<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-385, (385<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-386, (386<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-387, (387<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-388, (388<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-389, (389<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-390, (390<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-391, (391<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-392, (392<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-393, (393<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-394, (394<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-395, (395<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-396, (396<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-397, (397<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-398, (398<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-399, (399<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-400, (400<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-401, (401<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-402, (402<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-403, (403<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-404, (404<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-405, (405<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-406, (406<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-407, (407<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-408, (408<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-409, (409<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-410, (410<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-411, (411<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-412, (412<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-413, (413<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-414, (414<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-415, (415<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-416, (416<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-417, (417<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-418, (418<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-419, (419<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-420, (420<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-421, (421<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-422, (422<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-423, (423<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-424, (424<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-425, (425<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-426, (426<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-427, (427<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-428, (428<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-429, (429<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-430, (430<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-431, (431<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-432, (432<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-433, (433<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-434, (434<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-435, (435<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-436, (436<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-437, (437<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-438, (438<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-439, (439<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-440, (440<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-441, (441<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-442, (442<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-443, (443<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-444, (444<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-445, (445<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-446, (446<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-447, (447<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-448, (448<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-449, (449<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-450, (450<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-451, (451<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-452, (452<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-453, (453<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-454, (454<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-455, (455<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-456, (456<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-457, (457<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-458, (458<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-459, (459<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-460, (460<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-461, (461<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-462, (462<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-463, (463<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-464, (464<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-465, (465<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-466, (466<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-467, (467<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-468, (468<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-469, (469<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-470, (470<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-471, (471<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-472, (472<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-473, (473<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-474, (474<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-475, (475<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-476, (476<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-477, (477<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-478, (478<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-479, (479<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-480, (480<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-481, (481<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-482, (482<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-483, (483<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-484, (484<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-485, (485<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-486, (486<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-487, (487<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-488, (488<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-489, (489<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-490, (490<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-491, (491<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-492, (492<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-493, (493<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-494, (494<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-495, (495<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-496, (496<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-497, (497<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-498, (498<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-499, (499<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-500, (500<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-501, (501<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-502, (502<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-503, (503<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-504, (504<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-505, (505<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-506, (506<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-507, (507<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-508, (508<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-509, (509<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-510, (510<n)?1:0);
	ap_uint_512_or_bit(v, 512-1-511, (511<n)?1:0);
}


void ap_uint_512_not(ap_uint_512 x, ap_uint_512p ret)
{

	ret->w0 = ~x.w0;
	ret->w1 = ~x.w1;
	ret->w2 = ~x.w2;
	ret->w3 = ~x.w3;
	ret->w4 = ~x.w4;
	ret->w5 = ~x.w5;
	ret->w6 = ~x.w6;
	ret->w7 = ~x.w7;
	ret->w8 = ~x.w8;
	ret->w9 = ~x.w9;
	ret->w10 = ~x.w10;
	ret->w11 = ~x.w11;
	ret->w12 = ~x.w12;
	ret->w13 = ~x.w13;
	ret->w14 = ~x.w14;
	ret->w15 = ~x.w15;
}

void ap_uint_512_and(ap_uint_512 a, ap_uint_512 b, ap_uint_512p ret)
{

	ret->w0 = a.w0 & b.w0;
	ret->w1 = a.w1 & b.w1;
	ret->w2 = a.w2 & b.w2;
	ret->w3 = a.w3 & b.w3;
	ret->w4 = a.w4 & b.w4;
	ret->w5 = a.w5 & b.w5;
	ret->w6 = a.w6 & b.w6;
	ret->w7 = a.w7 & b.w7;
	ret->w8 = a.w8 & b.w8;
	ret->w9 = a.w9 & b.w9;
	ret->w10 = a.w10 & b.w10;
	ret->w11 = a.w11 & b.w11;
	ret->w12 = a.w12 & b.w12;
	ret->w13 = a.w13 & b.w13;
	ret->w14 = a.w14 & b.w14;
	ret->w15 = a.w15 & b.w15;
}

void ap_uint_512_and_self(ap_uint_512p a, ap_uint_512 b)
{

	a->w0 &= b.w0;
	a->w1 &= b.w1;
	a->w2 &= b.w2;
	a->w3 &= b.w3;
	a->w4 &= b.w4;
	a->w5 &= b.w5;
	a->w6 &= b.w6;
	a->w7 &= b.w7;
	a->w8 &= b.w8;
	a->w9 &= b.w9;
	a->w10 &= b.w10;
	a->w11 &= b.w11;
	a->w12 &= b.w12;
	a->w13 &= b.w13;
	a->w14 &= b.w14;
	a->w15 &= b.w15;
}


void ap_uint_512_or(ap_uint_512 a, ap_uint_512 b, ap_uint_512p ret)
{

	ret->w0 = a.w0 | b.w0;
	ret->w1 = a.w1 | b.w1;
	ret->w2 = a.w2 | b.w2;
	ret->w3 = a.w3 | b.w3;
	ret->w4 = a.w4 | b.w4;
	ret->w5 = a.w5 | b.w5;
	ret->w6 = a.w6 | b.w6;
	ret->w7 = a.w7 | b.w7;
	ret->w8 = a.w8 | b.w8;
	ret->w9 = a.w9 | b.w9;
	ret->w10 = a.w10 | b.w10;
	ret->w11 = a.w11 | b.w11;
	ret->w12 = a.w12 | b.w12;
	ret->w13 = a.w13 | b.w13;
	ret->w14 = a.w14 | b.w14;
	ret->w15 = a.w15 | b.w15;
}

void ap_uint_1024_or(ap_uint_1024 a, ap_uint_1024 b, ap_uint_1024p ret)
{

	ret->w0 = a.w0 | b.w0;
	ret->w1 = a.w1 | b.w1;
	ret->w2 = a.w2 | b.w2;
	ret->w3 = a.w3 | b.w3;
	ret->w4 = a.w4 | b.w4;
	ret->w5 = a.w5 | b.w5;
	ret->w6 = a.w6 | b.w6;
	ret->w7 = a.w7 | b.w7;
	ret->w8 = a.w8 | b.w8;
	ret->w9 = a.w9 | b.w9;
	ret->w10 = a.w10 | b.w10;
	ret->w11 = a.w11 | b.w11;
	ret->w12 = a.w12 | b.w12;
	ret->w13 = a.w13 | b.w13;
	ret->w14 = a.w14 | b.w14;
	ret->w15 = a.w15 | b.w15;
	ret->w16 = a.w16 | b.w16;
	ret->w17 = a.w17 | b.w17;
	ret->w18 = a.w18 | b.w18;
	ret->w19 = a.w19 | b.w19;
	ret->w20 = a.w20 | b.w20;
	ret->w21 = a.w21 | b.w21;
	ret->w22 = a.w22 | b.w22;
	ret->w23 = a.w23 | b.w23;
	ret->w24 = a.w24 | b.w24;
	ret->w25 = a.w25 | b.w25;
	ret->w26 = a.w26 | b.w26;
	ret->w27 = a.w27 | b.w27;
	ret->w28 = a.w28 | b.w28;
	ret->w29 = a.w29 | b.w29;
	ret->w30 = a.w30 | b.w30;
	ret->w31 = a.w31 | b.w31;

}

void ap_uint_1024_or_self(ap_uint_1024p a, ap_uint_1024 b)
{

	a->w0 |= b.w0;
	a->w1 |= b.w1;
	a->w2 |= b.w2;
	a->w3 |= b.w3;
	a->w4 |= b.w4;
	a->w5 |= b.w5;
	a->w6 |= b.w6;
	a->w7 |= b.w7;
	a->w8 |= b.w8;
	a->w9 |= b.w9;
	a->w10 |= b.w10;
	a->w11 |= b.w11;
	a->w12 |= b.w12;
	a->w13 |= b.w13;
	a->w14 |= b.w14;
	a->w15 |= b.w15;
	a->w16 |= b.w16;
	a->w17 |= b.w17;
	a->w18 |= b.w18;
	a->w19 |= b.w19;
	a->w20 |= b.w20;
	a->w21 |= b.w21;
	a->w22 |= b.w22;
	a->w23 |= b.w23;
	a->w24 |= b.w24;
	a->w25 |= b.w25;
	a->w26 |= b.w26;
	a->w27 |= b.w27;
	a->w28 |= b.w28;
	a->w29 |= b.w29;
	a->w30 |= b.w30;
	a->w31 |= b.w31;
}



void ap_uint_512_xor(ap_uint_512 a, ap_uint_512 b, ap_uint_512p ret)
{

	ret->w0 = a.w0 ^ b.w0;
	ret->w1 = a.w1 ^ b.w1;
	ret->w2 = a.w2 ^ b.w2;
	ret->w3 = a.w3 ^ b.w3;
	ret->w4 = a.w4 ^ b.w4;
	ret->w5 = a.w5 ^ b.w5;
	ret->w6 = a.w6 ^ b.w6;
	ret->w7 = a.w7 ^ b.w7;
	ret->w8 = a.w8 ^ b.w8;
	ret->w9 = a.w9 ^ b.w9;
	ret->w10 = a.w10 ^ b.w10;
	ret->w11 = a.w11 ^ b.w11;
	ret->w12 = a.w12 ^ b.w12;
	ret->w13 = a.w13 ^ b.w13;
	ret->w14 = a.w14 ^ b.w14;
	ret->w15 = a.w15 ^ b.w15;
	
}

unsigned int uint32_popCount(unsigned int w)
{
    unsigned char v0 = (w >> 0) & 0x1;
    unsigned char v1 = (w >> 1) & 0x1;
    unsigned char v2 = (w >> 2) & 0x1;
    unsigned char v3 = (w >> 3) & 0x1;
    unsigned char v4 = (w >> 4) & 0x1;
    unsigned char v5 = (w >> 5) & 0x1;
    unsigned char v6 = (w >> 6) & 0x1;
    unsigned char v7 = (w >> 7) & 0x1;
    unsigned char v8 = (w >> 8) & 0x1;
    unsigned char v9 = (w >> 9) & 0x1;
    unsigned char v10 = (w >> 10) & 0x1;
    unsigned char v11 = (w >> 11) & 0x1;
    unsigned char v12 = (w >> 12) & 0x1;
    unsigned char v13 = (w >> 13) & 0x1;
    unsigned char v14 = (w >> 14) & 0x1;
    unsigned char v15 = (w >> 15) & 0x1;
    unsigned char v16 = (w >> 16) & 0x1;
    unsigned char v17 = (w >> 17) & 0x1;
    unsigned char v18 = (w >> 18) & 0x1;
    unsigned char v19 = (w >> 19) & 0x1;
    unsigned char v20 = (w >> 20) & 0x1;
    unsigned char v21 = (w >> 21) & 0x1;
    unsigned char v22 = (w >> 22) & 0x1;
    unsigned char v23 = (w >> 23) & 0x1;
    unsigned char v24 = (w >> 24) & 0x1;
    unsigned char v25 = (w >> 25) & 0x1;
    unsigned char v26 = (w >> 26) & 0x1;
    unsigned char v27 = (w >> 27) & 0x1;
    unsigned char v28 = (w >> 28) & 0x1;
    unsigned char v29 = (w >> 29) & 0x1;
    unsigned char v30 = (w >> 30) & 0x1;
    unsigned char v31 = (w >> 31) & 0x1;
    
    return v0+v1+v2+v3+v4+v5+v6+v7+v8+v9+v10+v11+v12+v13+v14+v15+v16+v17+v18+v19+v20+v21+v22+v23+v24+v25+v26+v27+v28+v29+v30+v31+ 0 ;
}


unsigned int ap_uint_512_pop_count(ap_uint_512 x)
{
	unsigned int p=0;

	p += uint32_popCount(x.w0);
	p += uint32_popCount(x.w1);
	p += uint32_popCount(x.w2);
	p += uint32_popCount(x.w3);
	p += uint32_popCount(x.w4);
	p += uint32_popCount(x.w5);
	p += uint32_popCount(x.w6);
	p += uint32_popCount(x.w7);
	p += uint32_popCount(x.w8);
	p += uint32_popCount(x.w9);
	p += uint32_popCount(x.w10);
	p += uint32_popCount(x.w11);
	p += uint32_popCount(x.w12);
	p += uint32_popCount(x.w13);
	p += uint32_popCount(x.w14);
	p += uint32_popCount(x.w15);
	return p;
}

unsigned int uint32_manhattan_distance_a_and_not_b(unsigned int a, unsigned int b)
{

    unsigned int w = a & ~b;
    return uint32_popCount(w);
}



unsigned int ap_uint_1024_manhattan_distance_a_and_not_b(ap_uint_1024 a, ap_uint_1024 b)
{
	unsigned int d = 0;

	d += uint32_manhattan_distance_a_and_not_b(a.w0,b.w0);
	d += uint32_manhattan_distance_a_and_not_b(a.w1,b.w1);
	d += uint32_manhattan_distance_a_and_not_b(a.w2,b.w2);
	d += uint32_manhattan_distance_a_and_not_b(a.w3,b.w3);
	d += uint32_manhattan_distance_a_and_not_b(a.w4,b.w4);
	d += uint32_manhattan_distance_a_and_not_b(a.w5,b.w5);
	d += uint32_manhattan_distance_a_and_not_b(a.w6,b.w6);
	d += uint32_manhattan_distance_a_and_not_b(a.w7,b.w7);
	d += uint32_manhattan_distance_a_and_not_b(a.w8,b.w8);
	d += uint32_manhattan_distance_a_and_not_b(a.w9,b.w9);
	d += uint32_manhattan_distance_a_and_not_b(a.w10,b.w10);
	d += uint32_manhattan_distance_a_and_not_b(a.w11,b.w11);
	d += uint32_manhattan_distance_a_and_not_b(a.w12,b.w12);
	d += uint32_manhattan_distance_a_and_not_b(a.w13,b.w13);
	d += uint32_manhattan_distance_a_and_not_b(a.w14,b.w14);
	d += uint32_manhattan_distance_a_and_not_b(a.w15,b.w15);
	d += uint32_manhattan_distance_a_and_not_b(a.w16,b.w16);
	d += uint32_manhattan_distance_a_and_not_b(a.w17,b.w17);
	d += uint32_manhattan_distance_a_and_not_b(a.w18,b.w18);
	d += uint32_manhattan_distance_a_and_not_b(a.w19,b.w19);
	d += uint32_manhattan_distance_a_and_not_b(a.w20,b.w20);
	d += uint32_manhattan_distance_a_and_not_b(a.w21,b.w21);
	d += uint32_manhattan_distance_a_and_not_b(a.w22,b.w22);
	d += uint32_manhattan_distance_a_and_not_b(a.w23,b.w23);
	d += uint32_manhattan_distance_a_and_not_b(a.w24,b.w24);
	d += uint32_manhattan_distance_a_and_not_b(a.w25,b.w25);
	d += uint32_manhattan_distance_a_and_not_b(a.w26,b.w26);
	d += uint32_manhattan_distance_a_and_not_b(a.w27,b.w27);
	d += uint32_manhattan_distance_a_and_not_b(a.w28,b.w28);
	d += uint32_manhattan_distance_a_and_not_b(a.w29,b.w29);
	d += uint32_manhattan_distance_a_and_not_b(a.w30,b.w30);
	d += uint32_manhattan_distance_a_and_not_b(a.w31,b.w31);
	return d;
}

void ap_uint_512_shift_right(ap_uint_512 x, int shift, ap_uint_512p r)
{	
	ap_uint_512_zero(r);

	
	if ((0+shift) < 512) ap_uint_512_or_bit(r, 0, ap_uint_512_get_bit(x, (0+shift)));	
	if ((1+shift) < 512) ap_uint_512_or_bit(r, 1, ap_uint_512_get_bit(x, (1+shift)));	
	if ((2+shift) < 512) ap_uint_512_or_bit(r, 2, ap_uint_512_get_bit(x, (2+shift)));	
	if ((3+shift) < 512) ap_uint_512_or_bit(r, 3, ap_uint_512_get_bit(x, (3+shift)));	
	if ((4+shift) < 512) ap_uint_512_or_bit(r, 4, ap_uint_512_get_bit(x, (4+shift)));	
	if ((5+shift) < 512) ap_uint_512_or_bit(r, 5, ap_uint_512_get_bit(x, (5+shift)));	
	if ((6+shift) < 512) ap_uint_512_or_bit(r, 6, ap_uint_512_get_bit(x, (6+shift)));	
	if ((7+shift) < 512) ap_uint_512_or_bit(r, 7, ap_uint_512_get_bit(x, (7+shift)));	
	if ((8+shift) < 512) ap_uint_512_or_bit(r, 8, ap_uint_512_get_bit(x, (8+shift)));	
	if ((9+shift) < 512) ap_uint_512_or_bit(r, 9, ap_uint_512_get_bit(x, (9+shift)));	
	if ((10+shift) < 512) ap_uint_512_or_bit(r, 10, ap_uint_512_get_bit(x, (10+shift)));	
	if ((11+shift) < 512) ap_uint_512_or_bit(r, 11, ap_uint_512_get_bit(x, (11+shift)));	
	if ((12+shift) < 512) ap_uint_512_or_bit(r, 12, ap_uint_512_get_bit(x, (12+shift)));	
	if ((13+shift) < 512) ap_uint_512_or_bit(r, 13, ap_uint_512_get_bit(x, (13+shift)));	
	if ((14+shift) < 512) ap_uint_512_or_bit(r, 14, ap_uint_512_get_bit(x, (14+shift)));	
	if ((15+shift) < 512) ap_uint_512_or_bit(r, 15, ap_uint_512_get_bit(x, (15+shift)));	
	if ((16+shift) < 512) ap_uint_512_or_bit(r, 16, ap_uint_512_get_bit(x, (16+shift)));	
	if ((17+shift) < 512) ap_uint_512_or_bit(r, 17, ap_uint_512_get_bit(x, (17+shift)));	
	if ((18+shift) < 512) ap_uint_512_or_bit(r, 18, ap_uint_512_get_bit(x, (18+shift)));	
	if ((19+shift) < 512) ap_uint_512_or_bit(r, 19, ap_uint_512_get_bit(x, (19+shift)));	
	if ((20+shift) < 512) ap_uint_512_or_bit(r, 20, ap_uint_512_get_bit(x, (20+shift)));	
	if ((21+shift) < 512) ap_uint_512_or_bit(r, 21, ap_uint_512_get_bit(x, (21+shift)));	
	if ((22+shift) < 512) ap_uint_512_or_bit(r, 22, ap_uint_512_get_bit(x, (22+shift)));	
	if ((23+shift) < 512) ap_uint_512_or_bit(r, 23, ap_uint_512_get_bit(x, (23+shift)));	
	if ((24+shift) < 512) ap_uint_512_or_bit(r, 24, ap_uint_512_get_bit(x, (24+shift)));	
	if ((25+shift) < 512) ap_uint_512_or_bit(r, 25, ap_uint_512_get_bit(x, (25+shift)));	
	if ((26+shift) < 512) ap_uint_512_or_bit(r, 26, ap_uint_512_get_bit(x, (26+shift)));	
	if ((27+shift) < 512) ap_uint_512_or_bit(r, 27, ap_uint_512_get_bit(x, (27+shift)));	
	if ((28+shift) < 512) ap_uint_512_or_bit(r, 28, ap_uint_512_get_bit(x, (28+shift)));	
	if ((29+shift) < 512) ap_uint_512_or_bit(r, 29, ap_uint_512_get_bit(x, (29+shift)));	
	if ((30+shift) < 512) ap_uint_512_or_bit(r, 30, ap_uint_512_get_bit(x, (30+shift)));	
	if ((31+shift) < 512) ap_uint_512_or_bit(r, 31, ap_uint_512_get_bit(x, (31+shift)));	
	if ((32+shift) < 512) ap_uint_512_or_bit(r, 32, ap_uint_512_get_bit(x, (32+shift)));	
	if ((33+shift) < 512) ap_uint_512_or_bit(r, 33, ap_uint_512_get_bit(x, (33+shift)));	
	if ((34+shift) < 512) ap_uint_512_or_bit(r, 34, ap_uint_512_get_bit(x, (34+shift)));	
	if ((35+shift) < 512) ap_uint_512_or_bit(r, 35, ap_uint_512_get_bit(x, (35+shift)));	
	if ((36+shift) < 512) ap_uint_512_or_bit(r, 36, ap_uint_512_get_bit(x, (36+shift)));	
	if ((37+shift) < 512) ap_uint_512_or_bit(r, 37, ap_uint_512_get_bit(x, (37+shift)));	
	if ((38+shift) < 512) ap_uint_512_or_bit(r, 38, ap_uint_512_get_bit(x, (38+shift)));	
	if ((39+shift) < 512) ap_uint_512_or_bit(r, 39, ap_uint_512_get_bit(x, (39+shift)));	
	if ((40+shift) < 512) ap_uint_512_or_bit(r, 40, ap_uint_512_get_bit(x, (40+shift)));	
	if ((41+shift) < 512) ap_uint_512_or_bit(r, 41, ap_uint_512_get_bit(x, (41+shift)));	
	if ((42+shift) < 512) ap_uint_512_or_bit(r, 42, ap_uint_512_get_bit(x, (42+shift)));	
	if ((43+shift) < 512) ap_uint_512_or_bit(r, 43, ap_uint_512_get_bit(x, (43+shift)));	
	if ((44+shift) < 512) ap_uint_512_or_bit(r, 44, ap_uint_512_get_bit(x, (44+shift)));	
	if ((45+shift) < 512) ap_uint_512_or_bit(r, 45, ap_uint_512_get_bit(x, (45+shift)));	
	if ((46+shift) < 512) ap_uint_512_or_bit(r, 46, ap_uint_512_get_bit(x, (46+shift)));	
	if ((47+shift) < 512) ap_uint_512_or_bit(r, 47, ap_uint_512_get_bit(x, (47+shift)));	
	if ((48+shift) < 512) ap_uint_512_or_bit(r, 48, ap_uint_512_get_bit(x, (48+shift)));	
	if ((49+shift) < 512) ap_uint_512_or_bit(r, 49, ap_uint_512_get_bit(x, (49+shift)));	
	if ((50+shift) < 512) ap_uint_512_or_bit(r, 50, ap_uint_512_get_bit(x, (50+shift)));	
	if ((51+shift) < 512) ap_uint_512_or_bit(r, 51, ap_uint_512_get_bit(x, (51+shift)));	
	if ((52+shift) < 512) ap_uint_512_or_bit(r, 52, ap_uint_512_get_bit(x, (52+shift)));	
	if ((53+shift) < 512) ap_uint_512_or_bit(r, 53, ap_uint_512_get_bit(x, (53+shift)));	
	if ((54+shift) < 512) ap_uint_512_or_bit(r, 54, ap_uint_512_get_bit(x, (54+shift)));	
	if ((55+shift) < 512) ap_uint_512_or_bit(r, 55, ap_uint_512_get_bit(x, (55+shift)));	
	if ((56+shift) < 512) ap_uint_512_or_bit(r, 56, ap_uint_512_get_bit(x, (56+shift)));	
	if ((57+shift) < 512) ap_uint_512_or_bit(r, 57, ap_uint_512_get_bit(x, (57+shift)));	
	if ((58+shift) < 512) ap_uint_512_or_bit(r, 58, ap_uint_512_get_bit(x, (58+shift)));	
	if ((59+shift) < 512) ap_uint_512_or_bit(r, 59, ap_uint_512_get_bit(x, (59+shift)));	
	if ((60+shift) < 512) ap_uint_512_or_bit(r, 60, ap_uint_512_get_bit(x, (60+shift)));	
	if ((61+shift) < 512) ap_uint_512_or_bit(r, 61, ap_uint_512_get_bit(x, (61+shift)));	
	if ((62+shift) < 512) ap_uint_512_or_bit(r, 62, ap_uint_512_get_bit(x, (62+shift)));	
	if ((63+shift) < 512) ap_uint_512_or_bit(r, 63, ap_uint_512_get_bit(x, (63+shift)));	
	if ((64+shift) < 512) ap_uint_512_or_bit(r, 64, ap_uint_512_get_bit(x, (64+shift)));	
	if ((65+shift) < 512) ap_uint_512_or_bit(r, 65, ap_uint_512_get_bit(x, (65+shift)));	
	if ((66+shift) < 512) ap_uint_512_or_bit(r, 66, ap_uint_512_get_bit(x, (66+shift)));	
	if ((67+shift) < 512) ap_uint_512_or_bit(r, 67, ap_uint_512_get_bit(x, (67+shift)));	
	if ((68+shift) < 512) ap_uint_512_or_bit(r, 68, ap_uint_512_get_bit(x, (68+shift)));	
	if ((69+shift) < 512) ap_uint_512_or_bit(r, 69, ap_uint_512_get_bit(x, (69+shift)));	
	if ((70+shift) < 512) ap_uint_512_or_bit(r, 70, ap_uint_512_get_bit(x, (70+shift)));	
	if ((71+shift) < 512) ap_uint_512_or_bit(r, 71, ap_uint_512_get_bit(x, (71+shift)));	
	if ((72+shift) < 512) ap_uint_512_or_bit(r, 72, ap_uint_512_get_bit(x, (72+shift)));	
	if ((73+shift) < 512) ap_uint_512_or_bit(r, 73, ap_uint_512_get_bit(x, (73+shift)));	
	if ((74+shift) < 512) ap_uint_512_or_bit(r, 74, ap_uint_512_get_bit(x, (74+shift)));	
	if ((75+shift) < 512) ap_uint_512_or_bit(r, 75, ap_uint_512_get_bit(x, (75+shift)));	
	if ((76+shift) < 512) ap_uint_512_or_bit(r, 76, ap_uint_512_get_bit(x, (76+shift)));	
	if ((77+shift) < 512) ap_uint_512_or_bit(r, 77, ap_uint_512_get_bit(x, (77+shift)));	
	if ((78+shift) < 512) ap_uint_512_or_bit(r, 78, ap_uint_512_get_bit(x, (78+shift)));	
	if ((79+shift) < 512) ap_uint_512_or_bit(r, 79, ap_uint_512_get_bit(x, (79+shift)));	
	if ((80+shift) < 512) ap_uint_512_or_bit(r, 80, ap_uint_512_get_bit(x, (80+shift)));	
	if ((81+shift) < 512) ap_uint_512_or_bit(r, 81, ap_uint_512_get_bit(x, (81+shift)));	
	if ((82+shift) < 512) ap_uint_512_or_bit(r, 82, ap_uint_512_get_bit(x, (82+shift)));	
	if ((83+shift) < 512) ap_uint_512_or_bit(r, 83, ap_uint_512_get_bit(x, (83+shift)));	
	if ((84+shift) < 512) ap_uint_512_or_bit(r, 84, ap_uint_512_get_bit(x, (84+shift)));	
	if ((85+shift) < 512) ap_uint_512_or_bit(r, 85, ap_uint_512_get_bit(x, (85+shift)));	
	if ((86+shift) < 512) ap_uint_512_or_bit(r, 86, ap_uint_512_get_bit(x, (86+shift)));	
	if ((87+shift) < 512) ap_uint_512_or_bit(r, 87, ap_uint_512_get_bit(x, (87+shift)));	
	if ((88+shift) < 512) ap_uint_512_or_bit(r, 88, ap_uint_512_get_bit(x, (88+shift)));	
	if ((89+shift) < 512) ap_uint_512_or_bit(r, 89, ap_uint_512_get_bit(x, (89+shift)));	
	if ((90+shift) < 512) ap_uint_512_or_bit(r, 90, ap_uint_512_get_bit(x, (90+shift)));	
	if ((91+shift) < 512) ap_uint_512_or_bit(r, 91, ap_uint_512_get_bit(x, (91+shift)));	
	if ((92+shift) < 512) ap_uint_512_or_bit(r, 92, ap_uint_512_get_bit(x, (92+shift)));	
	if ((93+shift) < 512) ap_uint_512_or_bit(r, 93, ap_uint_512_get_bit(x, (93+shift)));	
	if ((94+shift) < 512) ap_uint_512_or_bit(r, 94, ap_uint_512_get_bit(x, (94+shift)));	
	if ((95+shift) < 512) ap_uint_512_or_bit(r, 95, ap_uint_512_get_bit(x, (95+shift)));	
	if ((96+shift) < 512) ap_uint_512_or_bit(r, 96, ap_uint_512_get_bit(x, (96+shift)));	
	if ((97+shift) < 512) ap_uint_512_or_bit(r, 97, ap_uint_512_get_bit(x, (97+shift)));	
	if ((98+shift) < 512) ap_uint_512_or_bit(r, 98, ap_uint_512_get_bit(x, (98+shift)));	
	if ((99+shift) < 512) ap_uint_512_or_bit(r, 99, ap_uint_512_get_bit(x, (99+shift)));	
	if ((100+shift) < 512) ap_uint_512_or_bit(r, 100, ap_uint_512_get_bit(x, (100+shift)));	
	if ((101+shift) < 512) ap_uint_512_or_bit(r, 101, ap_uint_512_get_bit(x, (101+shift)));	
	if ((102+shift) < 512) ap_uint_512_or_bit(r, 102, ap_uint_512_get_bit(x, (102+shift)));	
	if ((103+shift) < 512) ap_uint_512_or_bit(r, 103, ap_uint_512_get_bit(x, (103+shift)));	
	if ((104+shift) < 512) ap_uint_512_or_bit(r, 104, ap_uint_512_get_bit(x, (104+shift)));	
	if ((105+shift) < 512) ap_uint_512_or_bit(r, 105, ap_uint_512_get_bit(x, (105+shift)));	
	if ((106+shift) < 512) ap_uint_512_or_bit(r, 106, ap_uint_512_get_bit(x, (106+shift)));	
	if ((107+shift) < 512) ap_uint_512_or_bit(r, 107, ap_uint_512_get_bit(x, (107+shift)));	
	if ((108+shift) < 512) ap_uint_512_or_bit(r, 108, ap_uint_512_get_bit(x, (108+shift)));	
	if ((109+shift) < 512) ap_uint_512_or_bit(r, 109, ap_uint_512_get_bit(x, (109+shift)));	
	if ((110+shift) < 512) ap_uint_512_or_bit(r, 110, ap_uint_512_get_bit(x, (110+shift)));	
	if ((111+shift) < 512) ap_uint_512_or_bit(r, 111, ap_uint_512_get_bit(x, (111+shift)));	
	if ((112+shift) < 512) ap_uint_512_or_bit(r, 112, ap_uint_512_get_bit(x, (112+shift)));	
	if ((113+shift) < 512) ap_uint_512_or_bit(r, 113, ap_uint_512_get_bit(x, (113+shift)));	
	if ((114+shift) < 512) ap_uint_512_or_bit(r, 114, ap_uint_512_get_bit(x, (114+shift)));	
	if ((115+shift) < 512) ap_uint_512_or_bit(r, 115, ap_uint_512_get_bit(x, (115+shift)));	
	if ((116+shift) < 512) ap_uint_512_or_bit(r, 116, ap_uint_512_get_bit(x, (116+shift)));	
	if ((117+shift) < 512) ap_uint_512_or_bit(r, 117, ap_uint_512_get_bit(x, (117+shift)));	
	if ((118+shift) < 512) ap_uint_512_or_bit(r, 118, ap_uint_512_get_bit(x, (118+shift)));	
	if ((119+shift) < 512) ap_uint_512_or_bit(r, 119, ap_uint_512_get_bit(x, (119+shift)));	
	if ((120+shift) < 512) ap_uint_512_or_bit(r, 120, ap_uint_512_get_bit(x, (120+shift)));	
	if ((121+shift) < 512) ap_uint_512_or_bit(r, 121, ap_uint_512_get_bit(x, (121+shift)));	
	if ((122+shift) < 512) ap_uint_512_or_bit(r, 122, ap_uint_512_get_bit(x, (122+shift)));	
	if ((123+shift) < 512) ap_uint_512_or_bit(r, 123, ap_uint_512_get_bit(x, (123+shift)));	
	if ((124+shift) < 512) ap_uint_512_or_bit(r, 124, ap_uint_512_get_bit(x, (124+shift)));	
	if ((125+shift) < 512) ap_uint_512_or_bit(r, 125, ap_uint_512_get_bit(x, (125+shift)));	
	if ((126+shift) < 512) ap_uint_512_or_bit(r, 126, ap_uint_512_get_bit(x, (126+shift)));	
	if ((127+shift) < 512) ap_uint_512_or_bit(r, 127, ap_uint_512_get_bit(x, (127+shift)));	
	if ((128+shift) < 512) ap_uint_512_or_bit(r, 128, ap_uint_512_get_bit(x, (128+shift)));	
	if ((129+shift) < 512) ap_uint_512_or_bit(r, 129, ap_uint_512_get_bit(x, (129+shift)));	
	if ((130+shift) < 512) ap_uint_512_or_bit(r, 130, ap_uint_512_get_bit(x, (130+shift)));	
	if ((131+shift) < 512) ap_uint_512_or_bit(r, 131, ap_uint_512_get_bit(x, (131+shift)));	
	if ((132+shift) < 512) ap_uint_512_or_bit(r, 132, ap_uint_512_get_bit(x, (132+shift)));	
	if ((133+shift) < 512) ap_uint_512_or_bit(r, 133, ap_uint_512_get_bit(x, (133+shift)));	
	if ((134+shift) < 512) ap_uint_512_or_bit(r, 134, ap_uint_512_get_bit(x, (134+shift)));	
	if ((135+shift) < 512) ap_uint_512_or_bit(r, 135, ap_uint_512_get_bit(x, (135+shift)));	
	if ((136+shift) < 512) ap_uint_512_or_bit(r, 136, ap_uint_512_get_bit(x, (136+shift)));	
	if ((137+shift) < 512) ap_uint_512_or_bit(r, 137, ap_uint_512_get_bit(x, (137+shift)));	
	if ((138+shift) < 512) ap_uint_512_or_bit(r, 138, ap_uint_512_get_bit(x, (138+shift)));	
	if ((139+shift) < 512) ap_uint_512_or_bit(r, 139, ap_uint_512_get_bit(x, (139+shift)));	
	if ((140+shift) < 512) ap_uint_512_or_bit(r, 140, ap_uint_512_get_bit(x, (140+shift)));	
	if ((141+shift) < 512) ap_uint_512_or_bit(r, 141, ap_uint_512_get_bit(x, (141+shift)));	
	if ((142+shift) < 512) ap_uint_512_or_bit(r, 142, ap_uint_512_get_bit(x, (142+shift)));	
	if ((143+shift) < 512) ap_uint_512_or_bit(r, 143, ap_uint_512_get_bit(x, (143+shift)));	
	if ((144+shift) < 512) ap_uint_512_or_bit(r, 144, ap_uint_512_get_bit(x, (144+shift)));	
	if ((145+shift) < 512) ap_uint_512_or_bit(r, 145, ap_uint_512_get_bit(x, (145+shift)));	
	if ((146+shift) < 512) ap_uint_512_or_bit(r, 146, ap_uint_512_get_bit(x, (146+shift)));	
	if ((147+shift) < 512) ap_uint_512_or_bit(r, 147, ap_uint_512_get_bit(x, (147+shift)));	
	if ((148+shift) < 512) ap_uint_512_or_bit(r, 148, ap_uint_512_get_bit(x, (148+shift)));	
	if ((149+shift) < 512) ap_uint_512_or_bit(r, 149, ap_uint_512_get_bit(x, (149+shift)));	
	if ((150+shift) < 512) ap_uint_512_or_bit(r, 150, ap_uint_512_get_bit(x, (150+shift)));	
	if ((151+shift) < 512) ap_uint_512_or_bit(r, 151, ap_uint_512_get_bit(x, (151+shift)));	
	if ((152+shift) < 512) ap_uint_512_or_bit(r, 152, ap_uint_512_get_bit(x, (152+shift)));	
	if ((153+shift) < 512) ap_uint_512_or_bit(r, 153, ap_uint_512_get_bit(x, (153+shift)));	
	if ((154+shift) < 512) ap_uint_512_or_bit(r, 154, ap_uint_512_get_bit(x, (154+shift)));	
	if ((155+shift) < 512) ap_uint_512_or_bit(r, 155, ap_uint_512_get_bit(x, (155+shift)));	
	if ((156+shift) < 512) ap_uint_512_or_bit(r, 156, ap_uint_512_get_bit(x, (156+shift)));	
	if ((157+shift) < 512) ap_uint_512_or_bit(r, 157, ap_uint_512_get_bit(x, (157+shift)));	
	if ((158+shift) < 512) ap_uint_512_or_bit(r, 158, ap_uint_512_get_bit(x, (158+shift)));	
	if ((159+shift) < 512) ap_uint_512_or_bit(r, 159, ap_uint_512_get_bit(x, (159+shift)));	
	if ((160+shift) < 512) ap_uint_512_or_bit(r, 160, ap_uint_512_get_bit(x, (160+shift)));	
	if ((161+shift) < 512) ap_uint_512_or_bit(r, 161, ap_uint_512_get_bit(x, (161+shift)));	
	if ((162+shift) < 512) ap_uint_512_or_bit(r, 162, ap_uint_512_get_bit(x, (162+shift)));	
	if ((163+shift) < 512) ap_uint_512_or_bit(r, 163, ap_uint_512_get_bit(x, (163+shift)));	
	if ((164+shift) < 512) ap_uint_512_or_bit(r, 164, ap_uint_512_get_bit(x, (164+shift)));	
	if ((165+shift) < 512) ap_uint_512_or_bit(r, 165, ap_uint_512_get_bit(x, (165+shift)));	
	if ((166+shift) < 512) ap_uint_512_or_bit(r, 166, ap_uint_512_get_bit(x, (166+shift)));	
	if ((167+shift) < 512) ap_uint_512_or_bit(r, 167, ap_uint_512_get_bit(x, (167+shift)));	
	if ((168+shift) < 512) ap_uint_512_or_bit(r, 168, ap_uint_512_get_bit(x, (168+shift)));	
	if ((169+shift) < 512) ap_uint_512_or_bit(r, 169, ap_uint_512_get_bit(x, (169+shift)));	
	if ((170+shift) < 512) ap_uint_512_or_bit(r, 170, ap_uint_512_get_bit(x, (170+shift)));	
	if ((171+shift) < 512) ap_uint_512_or_bit(r, 171, ap_uint_512_get_bit(x, (171+shift)));	
	if ((172+shift) < 512) ap_uint_512_or_bit(r, 172, ap_uint_512_get_bit(x, (172+shift)));	
	if ((173+shift) < 512) ap_uint_512_or_bit(r, 173, ap_uint_512_get_bit(x, (173+shift)));	
	if ((174+shift) < 512) ap_uint_512_or_bit(r, 174, ap_uint_512_get_bit(x, (174+shift)));	
	if ((175+shift) < 512) ap_uint_512_or_bit(r, 175, ap_uint_512_get_bit(x, (175+shift)));	
	if ((176+shift) < 512) ap_uint_512_or_bit(r, 176, ap_uint_512_get_bit(x, (176+shift)));	
	if ((177+shift) < 512) ap_uint_512_or_bit(r, 177, ap_uint_512_get_bit(x, (177+shift)));	
	if ((178+shift) < 512) ap_uint_512_or_bit(r, 178, ap_uint_512_get_bit(x, (178+shift)));	
	if ((179+shift) < 512) ap_uint_512_or_bit(r, 179, ap_uint_512_get_bit(x, (179+shift)));	
	if ((180+shift) < 512) ap_uint_512_or_bit(r, 180, ap_uint_512_get_bit(x, (180+shift)));	
	if ((181+shift) < 512) ap_uint_512_or_bit(r, 181, ap_uint_512_get_bit(x, (181+shift)));	
	if ((182+shift) < 512) ap_uint_512_or_bit(r, 182, ap_uint_512_get_bit(x, (182+shift)));	
	if ((183+shift) < 512) ap_uint_512_or_bit(r, 183, ap_uint_512_get_bit(x, (183+shift)));	
	if ((184+shift) < 512) ap_uint_512_or_bit(r, 184, ap_uint_512_get_bit(x, (184+shift)));	
	if ((185+shift) < 512) ap_uint_512_or_bit(r, 185, ap_uint_512_get_bit(x, (185+shift)));	
	if ((186+shift) < 512) ap_uint_512_or_bit(r, 186, ap_uint_512_get_bit(x, (186+shift)));	
	if ((187+shift) < 512) ap_uint_512_or_bit(r, 187, ap_uint_512_get_bit(x, (187+shift)));	
	if ((188+shift) < 512) ap_uint_512_or_bit(r, 188, ap_uint_512_get_bit(x, (188+shift)));	
	if ((189+shift) < 512) ap_uint_512_or_bit(r, 189, ap_uint_512_get_bit(x, (189+shift)));	
	if ((190+shift) < 512) ap_uint_512_or_bit(r, 190, ap_uint_512_get_bit(x, (190+shift)));	
	if ((191+shift) < 512) ap_uint_512_or_bit(r, 191, ap_uint_512_get_bit(x, (191+shift)));	
	if ((192+shift) < 512) ap_uint_512_or_bit(r, 192, ap_uint_512_get_bit(x, (192+shift)));	
	if ((193+shift) < 512) ap_uint_512_or_bit(r, 193, ap_uint_512_get_bit(x, (193+shift)));	
	if ((194+shift) < 512) ap_uint_512_or_bit(r, 194, ap_uint_512_get_bit(x, (194+shift)));	
	if ((195+shift) < 512) ap_uint_512_or_bit(r, 195, ap_uint_512_get_bit(x, (195+shift)));	
	if ((196+shift) < 512) ap_uint_512_or_bit(r, 196, ap_uint_512_get_bit(x, (196+shift)));	
	if ((197+shift) < 512) ap_uint_512_or_bit(r, 197, ap_uint_512_get_bit(x, (197+shift)));	
	if ((198+shift) < 512) ap_uint_512_or_bit(r, 198, ap_uint_512_get_bit(x, (198+shift)));	
	if ((199+shift) < 512) ap_uint_512_or_bit(r, 199, ap_uint_512_get_bit(x, (199+shift)));	
	if ((200+shift) < 512) ap_uint_512_or_bit(r, 200, ap_uint_512_get_bit(x, (200+shift)));	
	if ((201+shift) < 512) ap_uint_512_or_bit(r, 201, ap_uint_512_get_bit(x, (201+shift)));	
	if ((202+shift) < 512) ap_uint_512_or_bit(r, 202, ap_uint_512_get_bit(x, (202+shift)));	
	if ((203+shift) < 512) ap_uint_512_or_bit(r, 203, ap_uint_512_get_bit(x, (203+shift)));	
	if ((204+shift) < 512) ap_uint_512_or_bit(r, 204, ap_uint_512_get_bit(x, (204+shift)));	
	if ((205+shift) < 512) ap_uint_512_or_bit(r, 205, ap_uint_512_get_bit(x, (205+shift)));	
	if ((206+shift) < 512) ap_uint_512_or_bit(r, 206, ap_uint_512_get_bit(x, (206+shift)));	
	if ((207+shift) < 512) ap_uint_512_or_bit(r, 207, ap_uint_512_get_bit(x, (207+shift)));	
	if ((208+shift) < 512) ap_uint_512_or_bit(r, 208, ap_uint_512_get_bit(x, (208+shift)));	
	if ((209+shift) < 512) ap_uint_512_or_bit(r, 209, ap_uint_512_get_bit(x, (209+shift)));	
	if ((210+shift) < 512) ap_uint_512_or_bit(r, 210, ap_uint_512_get_bit(x, (210+shift)));	
	if ((211+shift) < 512) ap_uint_512_or_bit(r, 211, ap_uint_512_get_bit(x, (211+shift)));	
	if ((212+shift) < 512) ap_uint_512_or_bit(r, 212, ap_uint_512_get_bit(x, (212+shift)));	
	if ((213+shift) < 512) ap_uint_512_or_bit(r, 213, ap_uint_512_get_bit(x, (213+shift)));	
	if ((214+shift) < 512) ap_uint_512_or_bit(r, 214, ap_uint_512_get_bit(x, (214+shift)));	
	if ((215+shift) < 512) ap_uint_512_or_bit(r, 215, ap_uint_512_get_bit(x, (215+shift)));	
	if ((216+shift) < 512) ap_uint_512_or_bit(r, 216, ap_uint_512_get_bit(x, (216+shift)));	
	if ((217+shift) < 512) ap_uint_512_or_bit(r, 217, ap_uint_512_get_bit(x, (217+shift)));	
	if ((218+shift) < 512) ap_uint_512_or_bit(r, 218, ap_uint_512_get_bit(x, (218+shift)));	
	if ((219+shift) < 512) ap_uint_512_or_bit(r, 219, ap_uint_512_get_bit(x, (219+shift)));	
	if ((220+shift) < 512) ap_uint_512_or_bit(r, 220, ap_uint_512_get_bit(x, (220+shift)));	
	if ((221+shift) < 512) ap_uint_512_or_bit(r, 221, ap_uint_512_get_bit(x, (221+shift)));	
	if ((222+shift) < 512) ap_uint_512_or_bit(r, 222, ap_uint_512_get_bit(x, (222+shift)));	
	if ((223+shift) < 512) ap_uint_512_or_bit(r, 223, ap_uint_512_get_bit(x, (223+shift)));	
	if ((224+shift) < 512) ap_uint_512_or_bit(r, 224, ap_uint_512_get_bit(x, (224+shift)));	
	if ((225+shift) < 512) ap_uint_512_or_bit(r, 225, ap_uint_512_get_bit(x, (225+shift)));	
	if ((226+shift) < 512) ap_uint_512_or_bit(r, 226, ap_uint_512_get_bit(x, (226+shift)));	
	if ((227+shift) < 512) ap_uint_512_or_bit(r, 227, ap_uint_512_get_bit(x, (227+shift)));	
	if ((228+shift) < 512) ap_uint_512_or_bit(r, 228, ap_uint_512_get_bit(x, (228+shift)));	
	if ((229+shift) < 512) ap_uint_512_or_bit(r, 229, ap_uint_512_get_bit(x, (229+shift)));	
	if ((230+shift) < 512) ap_uint_512_or_bit(r, 230, ap_uint_512_get_bit(x, (230+shift)));	
	if ((231+shift) < 512) ap_uint_512_or_bit(r, 231, ap_uint_512_get_bit(x, (231+shift)));	
	if ((232+shift) < 512) ap_uint_512_or_bit(r, 232, ap_uint_512_get_bit(x, (232+shift)));	
	if ((233+shift) < 512) ap_uint_512_or_bit(r, 233, ap_uint_512_get_bit(x, (233+shift)));	
	if ((234+shift) < 512) ap_uint_512_or_bit(r, 234, ap_uint_512_get_bit(x, (234+shift)));	
	if ((235+shift) < 512) ap_uint_512_or_bit(r, 235, ap_uint_512_get_bit(x, (235+shift)));	
	if ((236+shift) < 512) ap_uint_512_or_bit(r, 236, ap_uint_512_get_bit(x, (236+shift)));	
	if ((237+shift) < 512) ap_uint_512_or_bit(r, 237, ap_uint_512_get_bit(x, (237+shift)));	
	if ((238+shift) < 512) ap_uint_512_or_bit(r, 238, ap_uint_512_get_bit(x, (238+shift)));	
	if ((239+shift) < 512) ap_uint_512_or_bit(r, 239, ap_uint_512_get_bit(x, (239+shift)));	
	if ((240+shift) < 512) ap_uint_512_or_bit(r, 240, ap_uint_512_get_bit(x, (240+shift)));	
	if ((241+shift) < 512) ap_uint_512_or_bit(r, 241, ap_uint_512_get_bit(x, (241+shift)));	
	if ((242+shift) < 512) ap_uint_512_or_bit(r, 242, ap_uint_512_get_bit(x, (242+shift)));	
	if ((243+shift) < 512) ap_uint_512_or_bit(r, 243, ap_uint_512_get_bit(x, (243+shift)));	
	if ((244+shift) < 512) ap_uint_512_or_bit(r, 244, ap_uint_512_get_bit(x, (244+shift)));	
	if ((245+shift) < 512) ap_uint_512_or_bit(r, 245, ap_uint_512_get_bit(x, (245+shift)));	
	if ((246+shift) < 512) ap_uint_512_or_bit(r, 246, ap_uint_512_get_bit(x, (246+shift)));	
	if ((247+shift) < 512) ap_uint_512_or_bit(r, 247, ap_uint_512_get_bit(x, (247+shift)));	
	if ((248+shift) < 512) ap_uint_512_or_bit(r, 248, ap_uint_512_get_bit(x, (248+shift)));	
	if ((249+shift) < 512) ap_uint_512_or_bit(r, 249, ap_uint_512_get_bit(x, (249+shift)));	
	if ((250+shift) < 512) ap_uint_512_or_bit(r, 250, ap_uint_512_get_bit(x, (250+shift)));	
	if ((251+shift) < 512) ap_uint_512_or_bit(r, 251, ap_uint_512_get_bit(x, (251+shift)));	
	if ((252+shift) < 512) ap_uint_512_or_bit(r, 252, ap_uint_512_get_bit(x, (252+shift)));	
	if ((253+shift) < 512) ap_uint_512_or_bit(r, 253, ap_uint_512_get_bit(x, (253+shift)));	
	if ((254+shift) < 512) ap_uint_512_or_bit(r, 254, ap_uint_512_get_bit(x, (254+shift)));	
	if ((255+shift) < 512) ap_uint_512_or_bit(r, 255, ap_uint_512_get_bit(x, (255+shift)));	
	if ((256+shift) < 512) ap_uint_512_or_bit(r, 256, ap_uint_512_get_bit(x, (256+shift)));	
	if ((257+shift) < 512) ap_uint_512_or_bit(r, 257, ap_uint_512_get_bit(x, (257+shift)));	
	if ((258+shift) < 512) ap_uint_512_or_bit(r, 258, ap_uint_512_get_bit(x, (258+shift)));	
	if ((259+shift) < 512) ap_uint_512_or_bit(r, 259, ap_uint_512_get_bit(x, (259+shift)));	
	if ((260+shift) < 512) ap_uint_512_or_bit(r, 260, ap_uint_512_get_bit(x, (260+shift)));	
	if ((261+shift) < 512) ap_uint_512_or_bit(r, 261, ap_uint_512_get_bit(x, (261+shift)));	
	if ((262+shift) < 512) ap_uint_512_or_bit(r, 262, ap_uint_512_get_bit(x, (262+shift)));	
	if ((263+shift) < 512) ap_uint_512_or_bit(r, 263, ap_uint_512_get_bit(x, (263+shift)));	
	if ((264+shift) < 512) ap_uint_512_or_bit(r, 264, ap_uint_512_get_bit(x, (264+shift)));	
	if ((265+shift) < 512) ap_uint_512_or_bit(r, 265, ap_uint_512_get_bit(x, (265+shift)));	
	if ((266+shift) < 512) ap_uint_512_or_bit(r, 266, ap_uint_512_get_bit(x, (266+shift)));	
	if ((267+shift) < 512) ap_uint_512_or_bit(r, 267, ap_uint_512_get_bit(x, (267+shift)));	
	if ((268+shift) < 512) ap_uint_512_or_bit(r, 268, ap_uint_512_get_bit(x, (268+shift)));	
	if ((269+shift) < 512) ap_uint_512_or_bit(r, 269, ap_uint_512_get_bit(x, (269+shift)));	
	if ((270+shift) < 512) ap_uint_512_or_bit(r, 270, ap_uint_512_get_bit(x, (270+shift)));	
	if ((271+shift) < 512) ap_uint_512_or_bit(r, 271, ap_uint_512_get_bit(x, (271+shift)));	
	if ((272+shift) < 512) ap_uint_512_or_bit(r, 272, ap_uint_512_get_bit(x, (272+shift)));	
	if ((273+shift) < 512) ap_uint_512_or_bit(r, 273, ap_uint_512_get_bit(x, (273+shift)));	
	if ((274+shift) < 512) ap_uint_512_or_bit(r, 274, ap_uint_512_get_bit(x, (274+shift)));	
	if ((275+shift) < 512) ap_uint_512_or_bit(r, 275, ap_uint_512_get_bit(x, (275+shift)));	
	if ((276+shift) < 512) ap_uint_512_or_bit(r, 276, ap_uint_512_get_bit(x, (276+shift)));	
	if ((277+shift) < 512) ap_uint_512_or_bit(r, 277, ap_uint_512_get_bit(x, (277+shift)));	
	if ((278+shift) < 512) ap_uint_512_or_bit(r, 278, ap_uint_512_get_bit(x, (278+shift)));	
	if ((279+shift) < 512) ap_uint_512_or_bit(r, 279, ap_uint_512_get_bit(x, (279+shift)));	
	if ((280+shift) < 512) ap_uint_512_or_bit(r, 280, ap_uint_512_get_bit(x, (280+shift)));	
	if ((281+shift) < 512) ap_uint_512_or_bit(r, 281, ap_uint_512_get_bit(x, (281+shift)));	
	if ((282+shift) < 512) ap_uint_512_or_bit(r, 282, ap_uint_512_get_bit(x, (282+shift)));	
	if ((283+shift) < 512) ap_uint_512_or_bit(r, 283, ap_uint_512_get_bit(x, (283+shift)));	
	if ((284+shift) < 512) ap_uint_512_or_bit(r, 284, ap_uint_512_get_bit(x, (284+shift)));	
	if ((285+shift) < 512) ap_uint_512_or_bit(r, 285, ap_uint_512_get_bit(x, (285+shift)));	
	if ((286+shift) < 512) ap_uint_512_or_bit(r, 286, ap_uint_512_get_bit(x, (286+shift)));	
	if ((287+shift) < 512) ap_uint_512_or_bit(r, 287, ap_uint_512_get_bit(x, (287+shift)));	
	if ((288+shift) < 512) ap_uint_512_or_bit(r, 288, ap_uint_512_get_bit(x, (288+shift)));	
	if ((289+shift) < 512) ap_uint_512_or_bit(r, 289, ap_uint_512_get_bit(x, (289+shift)));	
	if ((290+shift) < 512) ap_uint_512_or_bit(r, 290, ap_uint_512_get_bit(x, (290+shift)));	
	if ((291+shift) < 512) ap_uint_512_or_bit(r, 291, ap_uint_512_get_bit(x, (291+shift)));	
	if ((292+shift) < 512) ap_uint_512_or_bit(r, 292, ap_uint_512_get_bit(x, (292+shift)));	
	if ((293+shift) < 512) ap_uint_512_or_bit(r, 293, ap_uint_512_get_bit(x, (293+shift)));	
	if ((294+shift) < 512) ap_uint_512_or_bit(r, 294, ap_uint_512_get_bit(x, (294+shift)));	
	if ((295+shift) < 512) ap_uint_512_or_bit(r, 295, ap_uint_512_get_bit(x, (295+shift)));	
	if ((296+shift) < 512) ap_uint_512_or_bit(r, 296, ap_uint_512_get_bit(x, (296+shift)));	
	if ((297+shift) < 512) ap_uint_512_or_bit(r, 297, ap_uint_512_get_bit(x, (297+shift)));	
	if ((298+shift) < 512) ap_uint_512_or_bit(r, 298, ap_uint_512_get_bit(x, (298+shift)));	
	if ((299+shift) < 512) ap_uint_512_or_bit(r, 299, ap_uint_512_get_bit(x, (299+shift)));	
	if ((300+shift) < 512) ap_uint_512_or_bit(r, 300, ap_uint_512_get_bit(x, (300+shift)));	
	if ((301+shift) < 512) ap_uint_512_or_bit(r, 301, ap_uint_512_get_bit(x, (301+shift)));	
	if ((302+shift) < 512) ap_uint_512_or_bit(r, 302, ap_uint_512_get_bit(x, (302+shift)));	
	if ((303+shift) < 512) ap_uint_512_or_bit(r, 303, ap_uint_512_get_bit(x, (303+shift)));	
	if ((304+shift) < 512) ap_uint_512_or_bit(r, 304, ap_uint_512_get_bit(x, (304+shift)));	
	if ((305+shift) < 512) ap_uint_512_or_bit(r, 305, ap_uint_512_get_bit(x, (305+shift)));	
	if ((306+shift) < 512) ap_uint_512_or_bit(r, 306, ap_uint_512_get_bit(x, (306+shift)));	
	if ((307+shift) < 512) ap_uint_512_or_bit(r, 307, ap_uint_512_get_bit(x, (307+shift)));	
	if ((308+shift) < 512) ap_uint_512_or_bit(r, 308, ap_uint_512_get_bit(x, (308+shift)));	
	if ((309+shift) < 512) ap_uint_512_or_bit(r, 309, ap_uint_512_get_bit(x, (309+shift)));	
	if ((310+shift) < 512) ap_uint_512_or_bit(r, 310, ap_uint_512_get_bit(x, (310+shift)));	
	if ((311+shift) < 512) ap_uint_512_or_bit(r, 311, ap_uint_512_get_bit(x, (311+shift)));	
	if ((312+shift) < 512) ap_uint_512_or_bit(r, 312, ap_uint_512_get_bit(x, (312+shift)));	
	if ((313+shift) < 512) ap_uint_512_or_bit(r, 313, ap_uint_512_get_bit(x, (313+shift)));	
	if ((314+shift) < 512) ap_uint_512_or_bit(r, 314, ap_uint_512_get_bit(x, (314+shift)));	
	if ((315+shift) < 512) ap_uint_512_or_bit(r, 315, ap_uint_512_get_bit(x, (315+shift)));	
	if ((316+shift) < 512) ap_uint_512_or_bit(r, 316, ap_uint_512_get_bit(x, (316+shift)));	
	if ((317+shift) < 512) ap_uint_512_or_bit(r, 317, ap_uint_512_get_bit(x, (317+shift)));	
	if ((318+shift) < 512) ap_uint_512_or_bit(r, 318, ap_uint_512_get_bit(x, (318+shift)));	
	if ((319+shift) < 512) ap_uint_512_or_bit(r, 319, ap_uint_512_get_bit(x, (319+shift)));	
	if ((320+shift) < 512) ap_uint_512_or_bit(r, 320, ap_uint_512_get_bit(x, (320+shift)));	
	if ((321+shift) < 512) ap_uint_512_or_bit(r, 321, ap_uint_512_get_bit(x, (321+shift)));	
	if ((322+shift) < 512) ap_uint_512_or_bit(r, 322, ap_uint_512_get_bit(x, (322+shift)));	
	if ((323+shift) < 512) ap_uint_512_or_bit(r, 323, ap_uint_512_get_bit(x, (323+shift)));	
	if ((324+shift) < 512) ap_uint_512_or_bit(r, 324, ap_uint_512_get_bit(x, (324+shift)));	
	if ((325+shift) < 512) ap_uint_512_or_bit(r, 325, ap_uint_512_get_bit(x, (325+shift)));	
	if ((326+shift) < 512) ap_uint_512_or_bit(r, 326, ap_uint_512_get_bit(x, (326+shift)));	
	if ((327+shift) < 512) ap_uint_512_or_bit(r, 327, ap_uint_512_get_bit(x, (327+shift)));	
	if ((328+shift) < 512) ap_uint_512_or_bit(r, 328, ap_uint_512_get_bit(x, (328+shift)));	
	if ((329+shift) < 512) ap_uint_512_or_bit(r, 329, ap_uint_512_get_bit(x, (329+shift)));	
	if ((330+shift) < 512) ap_uint_512_or_bit(r, 330, ap_uint_512_get_bit(x, (330+shift)));	
	if ((331+shift) < 512) ap_uint_512_or_bit(r, 331, ap_uint_512_get_bit(x, (331+shift)));	
	if ((332+shift) < 512) ap_uint_512_or_bit(r, 332, ap_uint_512_get_bit(x, (332+shift)));	
	if ((333+shift) < 512) ap_uint_512_or_bit(r, 333, ap_uint_512_get_bit(x, (333+shift)));	
	if ((334+shift) < 512) ap_uint_512_or_bit(r, 334, ap_uint_512_get_bit(x, (334+shift)));	
	if ((335+shift) < 512) ap_uint_512_or_bit(r, 335, ap_uint_512_get_bit(x, (335+shift)));	
	if ((336+shift) < 512) ap_uint_512_or_bit(r, 336, ap_uint_512_get_bit(x, (336+shift)));	
	if ((337+shift) < 512) ap_uint_512_or_bit(r, 337, ap_uint_512_get_bit(x, (337+shift)));	
	if ((338+shift) < 512) ap_uint_512_or_bit(r, 338, ap_uint_512_get_bit(x, (338+shift)));	
	if ((339+shift) < 512) ap_uint_512_or_bit(r, 339, ap_uint_512_get_bit(x, (339+shift)));	
	if ((340+shift) < 512) ap_uint_512_or_bit(r, 340, ap_uint_512_get_bit(x, (340+shift)));	
	if ((341+shift) < 512) ap_uint_512_or_bit(r, 341, ap_uint_512_get_bit(x, (341+shift)));	
	if ((342+shift) < 512) ap_uint_512_or_bit(r, 342, ap_uint_512_get_bit(x, (342+shift)));	
	if ((343+shift) < 512) ap_uint_512_or_bit(r, 343, ap_uint_512_get_bit(x, (343+shift)));	
	if ((344+shift) < 512) ap_uint_512_or_bit(r, 344, ap_uint_512_get_bit(x, (344+shift)));	
	if ((345+shift) < 512) ap_uint_512_or_bit(r, 345, ap_uint_512_get_bit(x, (345+shift)));	
	if ((346+shift) < 512) ap_uint_512_or_bit(r, 346, ap_uint_512_get_bit(x, (346+shift)));	
	if ((347+shift) < 512) ap_uint_512_or_bit(r, 347, ap_uint_512_get_bit(x, (347+shift)));	
	if ((348+shift) < 512) ap_uint_512_or_bit(r, 348, ap_uint_512_get_bit(x, (348+shift)));	
	if ((349+shift) < 512) ap_uint_512_or_bit(r, 349, ap_uint_512_get_bit(x, (349+shift)));	
	if ((350+shift) < 512) ap_uint_512_or_bit(r, 350, ap_uint_512_get_bit(x, (350+shift)));	
	if ((351+shift) < 512) ap_uint_512_or_bit(r, 351, ap_uint_512_get_bit(x, (351+shift)));	
	if ((352+shift) < 512) ap_uint_512_or_bit(r, 352, ap_uint_512_get_bit(x, (352+shift)));	
	if ((353+shift) < 512) ap_uint_512_or_bit(r, 353, ap_uint_512_get_bit(x, (353+shift)));	
	if ((354+shift) < 512) ap_uint_512_or_bit(r, 354, ap_uint_512_get_bit(x, (354+shift)));	
	if ((355+shift) < 512) ap_uint_512_or_bit(r, 355, ap_uint_512_get_bit(x, (355+shift)));	
	if ((356+shift) < 512) ap_uint_512_or_bit(r, 356, ap_uint_512_get_bit(x, (356+shift)));	
	if ((357+shift) < 512) ap_uint_512_or_bit(r, 357, ap_uint_512_get_bit(x, (357+shift)));	
	if ((358+shift) < 512) ap_uint_512_or_bit(r, 358, ap_uint_512_get_bit(x, (358+shift)));	
	if ((359+shift) < 512) ap_uint_512_or_bit(r, 359, ap_uint_512_get_bit(x, (359+shift)));	
	if ((360+shift) < 512) ap_uint_512_or_bit(r, 360, ap_uint_512_get_bit(x, (360+shift)));	
	if ((361+shift) < 512) ap_uint_512_or_bit(r, 361, ap_uint_512_get_bit(x, (361+shift)));	
	if ((362+shift) < 512) ap_uint_512_or_bit(r, 362, ap_uint_512_get_bit(x, (362+shift)));	
	if ((363+shift) < 512) ap_uint_512_or_bit(r, 363, ap_uint_512_get_bit(x, (363+shift)));	
	if ((364+shift) < 512) ap_uint_512_or_bit(r, 364, ap_uint_512_get_bit(x, (364+shift)));	
	if ((365+shift) < 512) ap_uint_512_or_bit(r, 365, ap_uint_512_get_bit(x, (365+shift)));	
	if ((366+shift) < 512) ap_uint_512_or_bit(r, 366, ap_uint_512_get_bit(x, (366+shift)));	
	if ((367+shift) < 512) ap_uint_512_or_bit(r, 367, ap_uint_512_get_bit(x, (367+shift)));	
	if ((368+shift) < 512) ap_uint_512_or_bit(r, 368, ap_uint_512_get_bit(x, (368+shift)));	
	if ((369+shift) < 512) ap_uint_512_or_bit(r, 369, ap_uint_512_get_bit(x, (369+shift)));	
	if ((370+shift) < 512) ap_uint_512_or_bit(r, 370, ap_uint_512_get_bit(x, (370+shift)));	
	if ((371+shift) < 512) ap_uint_512_or_bit(r, 371, ap_uint_512_get_bit(x, (371+shift)));	
	if ((372+shift) < 512) ap_uint_512_or_bit(r, 372, ap_uint_512_get_bit(x, (372+shift)));	
	if ((373+shift) < 512) ap_uint_512_or_bit(r, 373, ap_uint_512_get_bit(x, (373+shift)));	
	if ((374+shift) < 512) ap_uint_512_or_bit(r, 374, ap_uint_512_get_bit(x, (374+shift)));	
	if ((375+shift) < 512) ap_uint_512_or_bit(r, 375, ap_uint_512_get_bit(x, (375+shift)));	
	if ((376+shift) < 512) ap_uint_512_or_bit(r, 376, ap_uint_512_get_bit(x, (376+shift)));	
	if ((377+shift) < 512) ap_uint_512_or_bit(r, 377, ap_uint_512_get_bit(x, (377+shift)));	
	if ((378+shift) < 512) ap_uint_512_or_bit(r, 378, ap_uint_512_get_bit(x, (378+shift)));	
	if ((379+shift) < 512) ap_uint_512_or_bit(r, 379, ap_uint_512_get_bit(x, (379+shift)));	
	if ((380+shift) < 512) ap_uint_512_or_bit(r, 380, ap_uint_512_get_bit(x, (380+shift)));	
	if ((381+shift) < 512) ap_uint_512_or_bit(r, 381, ap_uint_512_get_bit(x, (381+shift)));	
	if ((382+shift) < 512) ap_uint_512_or_bit(r, 382, ap_uint_512_get_bit(x, (382+shift)));	
	if ((383+shift) < 512) ap_uint_512_or_bit(r, 383, ap_uint_512_get_bit(x, (383+shift)));	
	if ((384+shift) < 512) ap_uint_512_or_bit(r, 384, ap_uint_512_get_bit(x, (384+shift)));	
	if ((385+shift) < 512) ap_uint_512_or_bit(r, 385, ap_uint_512_get_bit(x, (385+shift)));	
	if ((386+shift) < 512) ap_uint_512_or_bit(r, 386, ap_uint_512_get_bit(x, (386+shift)));	
	if ((387+shift) < 512) ap_uint_512_or_bit(r, 387, ap_uint_512_get_bit(x, (387+shift)));	
	if ((388+shift) < 512) ap_uint_512_or_bit(r, 388, ap_uint_512_get_bit(x, (388+shift)));	
	if ((389+shift) < 512) ap_uint_512_or_bit(r, 389, ap_uint_512_get_bit(x, (389+shift)));	
	if ((390+shift) < 512) ap_uint_512_or_bit(r, 390, ap_uint_512_get_bit(x, (390+shift)));	
	if ((391+shift) < 512) ap_uint_512_or_bit(r, 391, ap_uint_512_get_bit(x, (391+shift)));	
	if ((392+shift) < 512) ap_uint_512_or_bit(r, 392, ap_uint_512_get_bit(x, (392+shift)));	
	if ((393+shift) < 512) ap_uint_512_or_bit(r, 393, ap_uint_512_get_bit(x, (393+shift)));	
	if ((394+shift) < 512) ap_uint_512_or_bit(r, 394, ap_uint_512_get_bit(x, (394+shift)));	
	if ((395+shift) < 512) ap_uint_512_or_bit(r, 395, ap_uint_512_get_bit(x, (395+shift)));	
	if ((396+shift) < 512) ap_uint_512_or_bit(r, 396, ap_uint_512_get_bit(x, (396+shift)));	
	if ((397+shift) < 512) ap_uint_512_or_bit(r, 397, ap_uint_512_get_bit(x, (397+shift)));	
	if ((398+shift) < 512) ap_uint_512_or_bit(r, 398, ap_uint_512_get_bit(x, (398+shift)));	
	if ((399+shift) < 512) ap_uint_512_or_bit(r, 399, ap_uint_512_get_bit(x, (399+shift)));	
	if ((400+shift) < 512) ap_uint_512_or_bit(r, 400, ap_uint_512_get_bit(x, (400+shift)));	
	if ((401+shift) < 512) ap_uint_512_or_bit(r, 401, ap_uint_512_get_bit(x, (401+shift)));	
	if ((402+shift) < 512) ap_uint_512_or_bit(r, 402, ap_uint_512_get_bit(x, (402+shift)));	
	if ((403+shift) < 512) ap_uint_512_or_bit(r, 403, ap_uint_512_get_bit(x, (403+shift)));	
	if ((404+shift) < 512) ap_uint_512_or_bit(r, 404, ap_uint_512_get_bit(x, (404+shift)));	
	if ((405+shift) < 512) ap_uint_512_or_bit(r, 405, ap_uint_512_get_bit(x, (405+shift)));	
	if ((406+shift) < 512) ap_uint_512_or_bit(r, 406, ap_uint_512_get_bit(x, (406+shift)));	
	if ((407+shift) < 512) ap_uint_512_or_bit(r, 407, ap_uint_512_get_bit(x, (407+shift)));	
	if ((408+shift) < 512) ap_uint_512_or_bit(r, 408, ap_uint_512_get_bit(x, (408+shift)));	
	if ((409+shift) < 512) ap_uint_512_or_bit(r, 409, ap_uint_512_get_bit(x, (409+shift)));	
	if ((410+shift) < 512) ap_uint_512_or_bit(r, 410, ap_uint_512_get_bit(x, (410+shift)));	
	if ((411+shift) < 512) ap_uint_512_or_bit(r, 411, ap_uint_512_get_bit(x, (411+shift)));	
	if ((412+shift) < 512) ap_uint_512_or_bit(r, 412, ap_uint_512_get_bit(x, (412+shift)));	
	if ((413+shift) < 512) ap_uint_512_or_bit(r, 413, ap_uint_512_get_bit(x, (413+shift)));	
	if ((414+shift) < 512) ap_uint_512_or_bit(r, 414, ap_uint_512_get_bit(x, (414+shift)));	
	if ((415+shift) < 512) ap_uint_512_or_bit(r, 415, ap_uint_512_get_bit(x, (415+shift)));	
	if ((416+shift) < 512) ap_uint_512_or_bit(r, 416, ap_uint_512_get_bit(x, (416+shift)));	
	if ((417+shift) < 512) ap_uint_512_or_bit(r, 417, ap_uint_512_get_bit(x, (417+shift)));	
	if ((418+shift) < 512) ap_uint_512_or_bit(r, 418, ap_uint_512_get_bit(x, (418+shift)));	
	if ((419+shift) < 512) ap_uint_512_or_bit(r, 419, ap_uint_512_get_bit(x, (419+shift)));	
	if ((420+shift) < 512) ap_uint_512_or_bit(r, 420, ap_uint_512_get_bit(x, (420+shift)));	
	if ((421+shift) < 512) ap_uint_512_or_bit(r, 421, ap_uint_512_get_bit(x, (421+shift)));	
	if ((422+shift) < 512) ap_uint_512_or_bit(r, 422, ap_uint_512_get_bit(x, (422+shift)));	
	if ((423+shift) < 512) ap_uint_512_or_bit(r, 423, ap_uint_512_get_bit(x, (423+shift)));	
	if ((424+shift) < 512) ap_uint_512_or_bit(r, 424, ap_uint_512_get_bit(x, (424+shift)));	
	if ((425+shift) < 512) ap_uint_512_or_bit(r, 425, ap_uint_512_get_bit(x, (425+shift)));	
	if ((426+shift) < 512) ap_uint_512_or_bit(r, 426, ap_uint_512_get_bit(x, (426+shift)));	
	if ((427+shift) < 512) ap_uint_512_or_bit(r, 427, ap_uint_512_get_bit(x, (427+shift)));	
	if ((428+shift) < 512) ap_uint_512_or_bit(r, 428, ap_uint_512_get_bit(x, (428+shift)));	
	if ((429+shift) < 512) ap_uint_512_or_bit(r, 429, ap_uint_512_get_bit(x, (429+shift)));	
	if ((430+shift) < 512) ap_uint_512_or_bit(r, 430, ap_uint_512_get_bit(x, (430+shift)));	
	if ((431+shift) < 512) ap_uint_512_or_bit(r, 431, ap_uint_512_get_bit(x, (431+shift)));	
	if ((432+shift) < 512) ap_uint_512_or_bit(r, 432, ap_uint_512_get_bit(x, (432+shift)));	
	if ((433+shift) < 512) ap_uint_512_or_bit(r, 433, ap_uint_512_get_bit(x, (433+shift)));	
	if ((434+shift) < 512) ap_uint_512_or_bit(r, 434, ap_uint_512_get_bit(x, (434+shift)));	
	if ((435+shift) < 512) ap_uint_512_or_bit(r, 435, ap_uint_512_get_bit(x, (435+shift)));	
	if ((436+shift) < 512) ap_uint_512_or_bit(r, 436, ap_uint_512_get_bit(x, (436+shift)));	
	if ((437+shift) < 512) ap_uint_512_or_bit(r, 437, ap_uint_512_get_bit(x, (437+shift)));	
	if ((438+shift) < 512) ap_uint_512_or_bit(r, 438, ap_uint_512_get_bit(x, (438+shift)));	
	if ((439+shift) < 512) ap_uint_512_or_bit(r, 439, ap_uint_512_get_bit(x, (439+shift)));	
	if ((440+shift) < 512) ap_uint_512_or_bit(r, 440, ap_uint_512_get_bit(x, (440+shift)));	
	if ((441+shift) < 512) ap_uint_512_or_bit(r, 441, ap_uint_512_get_bit(x, (441+shift)));	
	if ((442+shift) < 512) ap_uint_512_or_bit(r, 442, ap_uint_512_get_bit(x, (442+shift)));	
	if ((443+shift) < 512) ap_uint_512_or_bit(r, 443, ap_uint_512_get_bit(x, (443+shift)));	
	if ((444+shift) < 512) ap_uint_512_or_bit(r, 444, ap_uint_512_get_bit(x, (444+shift)));	
	if ((445+shift) < 512) ap_uint_512_or_bit(r, 445, ap_uint_512_get_bit(x, (445+shift)));	
	if ((446+shift) < 512) ap_uint_512_or_bit(r, 446, ap_uint_512_get_bit(x, (446+shift)));	
	if ((447+shift) < 512) ap_uint_512_or_bit(r, 447, ap_uint_512_get_bit(x, (447+shift)));	
	if ((448+shift) < 512) ap_uint_512_or_bit(r, 448, ap_uint_512_get_bit(x, (448+shift)));	
	if ((449+shift) < 512) ap_uint_512_or_bit(r, 449, ap_uint_512_get_bit(x, (449+shift)));	
	if ((450+shift) < 512) ap_uint_512_or_bit(r, 450, ap_uint_512_get_bit(x, (450+shift)));	
	if ((451+shift) < 512) ap_uint_512_or_bit(r, 451, ap_uint_512_get_bit(x, (451+shift)));	
	if ((452+shift) < 512) ap_uint_512_or_bit(r, 452, ap_uint_512_get_bit(x, (452+shift)));	
	if ((453+shift) < 512) ap_uint_512_or_bit(r, 453, ap_uint_512_get_bit(x, (453+shift)));	
	if ((454+shift) < 512) ap_uint_512_or_bit(r, 454, ap_uint_512_get_bit(x, (454+shift)));	
	if ((455+shift) < 512) ap_uint_512_or_bit(r, 455, ap_uint_512_get_bit(x, (455+shift)));	
	if ((456+shift) < 512) ap_uint_512_or_bit(r, 456, ap_uint_512_get_bit(x, (456+shift)));	
	if ((457+shift) < 512) ap_uint_512_or_bit(r, 457, ap_uint_512_get_bit(x, (457+shift)));	
	if ((458+shift) < 512) ap_uint_512_or_bit(r, 458, ap_uint_512_get_bit(x, (458+shift)));	
	if ((459+shift) < 512) ap_uint_512_or_bit(r, 459, ap_uint_512_get_bit(x, (459+shift)));	
	if ((460+shift) < 512) ap_uint_512_or_bit(r, 460, ap_uint_512_get_bit(x, (460+shift)));	
	if ((461+shift) < 512) ap_uint_512_or_bit(r, 461, ap_uint_512_get_bit(x, (461+shift)));	
	if ((462+shift) < 512) ap_uint_512_or_bit(r, 462, ap_uint_512_get_bit(x, (462+shift)));	
	if ((463+shift) < 512) ap_uint_512_or_bit(r, 463, ap_uint_512_get_bit(x, (463+shift)));	
	if ((464+shift) < 512) ap_uint_512_or_bit(r, 464, ap_uint_512_get_bit(x, (464+shift)));	
	if ((465+shift) < 512) ap_uint_512_or_bit(r, 465, ap_uint_512_get_bit(x, (465+shift)));	
	if ((466+shift) < 512) ap_uint_512_or_bit(r, 466, ap_uint_512_get_bit(x, (466+shift)));	
	if ((467+shift) < 512) ap_uint_512_or_bit(r, 467, ap_uint_512_get_bit(x, (467+shift)));	
	if ((468+shift) < 512) ap_uint_512_or_bit(r, 468, ap_uint_512_get_bit(x, (468+shift)));	
	if ((469+shift) < 512) ap_uint_512_or_bit(r, 469, ap_uint_512_get_bit(x, (469+shift)));	
	if ((470+shift) < 512) ap_uint_512_or_bit(r, 470, ap_uint_512_get_bit(x, (470+shift)));	
	if ((471+shift) < 512) ap_uint_512_or_bit(r, 471, ap_uint_512_get_bit(x, (471+shift)));	
	if ((472+shift) < 512) ap_uint_512_or_bit(r, 472, ap_uint_512_get_bit(x, (472+shift)));	
	if ((473+shift) < 512) ap_uint_512_or_bit(r, 473, ap_uint_512_get_bit(x, (473+shift)));	
	if ((474+shift) < 512) ap_uint_512_or_bit(r, 474, ap_uint_512_get_bit(x, (474+shift)));	
	if ((475+shift) < 512) ap_uint_512_or_bit(r, 475, ap_uint_512_get_bit(x, (475+shift)));	
	if ((476+shift) < 512) ap_uint_512_or_bit(r, 476, ap_uint_512_get_bit(x, (476+shift)));	
	if ((477+shift) < 512) ap_uint_512_or_bit(r, 477, ap_uint_512_get_bit(x, (477+shift)));	
	if ((478+shift) < 512) ap_uint_512_or_bit(r, 478, ap_uint_512_get_bit(x, (478+shift)));	
	if ((479+shift) < 512) ap_uint_512_or_bit(r, 479, ap_uint_512_get_bit(x, (479+shift)));	
	if ((480+shift) < 512) ap_uint_512_or_bit(r, 480, ap_uint_512_get_bit(x, (480+shift)));	
	if ((481+shift) < 512) ap_uint_512_or_bit(r, 481, ap_uint_512_get_bit(x, (481+shift)));	
	if ((482+shift) < 512) ap_uint_512_or_bit(r, 482, ap_uint_512_get_bit(x, (482+shift)));	
	if ((483+shift) < 512) ap_uint_512_or_bit(r, 483, ap_uint_512_get_bit(x, (483+shift)));	
	if ((484+shift) < 512) ap_uint_512_or_bit(r, 484, ap_uint_512_get_bit(x, (484+shift)));	
	if ((485+shift) < 512) ap_uint_512_or_bit(r, 485, ap_uint_512_get_bit(x, (485+shift)));	
	if ((486+shift) < 512) ap_uint_512_or_bit(r, 486, ap_uint_512_get_bit(x, (486+shift)));	
	if ((487+shift) < 512) ap_uint_512_or_bit(r, 487, ap_uint_512_get_bit(x, (487+shift)));	
	if ((488+shift) < 512) ap_uint_512_or_bit(r, 488, ap_uint_512_get_bit(x, (488+shift)));	
	if ((489+shift) < 512) ap_uint_512_or_bit(r, 489, ap_uint_512_get_bit(x, (489+shift)));	
	if ((490+shift) < 512) ap_uint_512_or_bit(r, 490, ap_uint_512_get_bit(x, (490+shift)));	
	if ((491+shift) < 512) ap_uint_512_or_bit(r, 491, ap_uint_512_get_bit(x, (491+shift)));	
	if ((492+shift) < 512) ap_uint_512_or_bit(r, 492, ap_uint_512_get_bit(x, (492+shift)));	
	if ((493+shift) < 512) ap_uint_512_or_bit(r, 493, ap_uint_512_get_bit(x, (493+shift)));	
	if ((494+shift) < 512) ap_uint_512_or_bit(r, 494, ap_uint_512_get_bit(x, (494+shift)));	
	if ((495+shift) < 512) ap_uint_512_or_bit(r, 495, ap_uint_512_get_bit(x, (495+shift)));	
	if ((496+shift) < 512) ap_uint_512_or_bit(r, 496, ap_uint_512_get_bit(x, (496+shift)));	
	if ((497+shift) < 512) ap_uint_512_or_bit(r, 497, ap_uint_512_get_bit(x, (497+shift)));	
	if ((498+shift) < 512) ap_uint_512_or_bit(r, 498, ap_uint_512_get_bit(x, (498+shift)));	
	if ((499+shift) < 512) ap_uint_512_or_bit(r, 499, ap_uint_512_get_bit(x, (499+shift)));	
	if ((500+shift) < 512) ap_uint_512_or_bit(r, 500, ap_uint_512_get_bit(x, (500+shift)));	
	if ((501+shift) < 512) ap_uint_512_or_bit(r, 501, ap_uint_512_get_bit(x, (501+shift)));	
	if ((502+shift) < 512) ap_uint_512_or_bit(r, 502, ap_uint_512_get_bit(x, (502+shift)));	
	if ((503+shift) < 512) ap_uint_512_or_bit(r, 503, ap_uint_512_get_bit(x, (503+shift)));	
	if ((504+shift) < 512) ap_uint_512_or_bit(r, 504, ap_uint_512_get_bit(x, (504+shift)));	
	if ((505+shift) < 512) ap_uint_512_or_bit(r, 505, ap_uint_512_get_bit(x, (505+shift)));	
	if ((506+shift) < 512) ap_uint_512_or_bit(r, 506, ap_uint_512_get_bit(x, (506+shift)));	
	if ((507+shift) < 512) ap_uint_512_or_bit(r, 507, ap_uint_512_get_bit(x, (507+shift)));	
	if ((508+shift) < 512) ap_uint_512_or_bit(r, 508, ap_uint_512_get_bit(x, (508+shift)));	
	if ((509+shift) < 512) ap_uint_512_or_bit(r, 509, ap_uint_512_get_bit(x, (509+shift)));	
	if ((510+shift) < 512) ap_uint_512_or_bit(r, 510, ap_uint_512_get_bit(x, (510+shift)));	
	if ((511+shift) < 512) ap_uint_512_or_bit(r, 511, ap_uint_512_get_bit(x, (511+shift)));	

}


void ap_uint_512_shift_right_self(int shift, ap_uint_512p r)
{
	ap_uint_512 aux;
	ap_uint_512_set(AP_UINT_PTR(aux), AP_UINT_FROM_PTR(r));
	ap_uint_512_shift_right(aux, shift, r);
}

/**
* @param shift is determined by a uchar because must be < 64 
*/
void ap_uint_512_shift_left_bytes(ap_uint_512 x, unsigned char shift, ap_uint_512p r)
{
	int word_shift = shift >> 2; 	// shift / 4;
	int byte_shift = shift & 0x3; 	// shift % 4;

	
	{
		
		int src_word_hi = 15 - word_shift;
		int src_word_lo = 15 - word_shift -1;

		unsigned int whi = (src_word_hi >= 0)? ap_uint_512_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo >= 0)? ap_uint_512_getDword(x, src_word_lo) : 0;

		
		r->w15 = (byte_shift == 0)? whi :  (whi << (8 * byte_shift)) | (wlo >> (8 * (4-byte_shift)));
		

	}
	{
		
		int src_word_hi = 14 - word_shift;
		int src_word_lo = 14 - word_shift -1;

		unsigned int whi = (src_word_hi >= 0)? ap_uint_512_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo >= 0)? ap_uint_512_getDword(x, src_word_lo) : 0;

		
		r->w14 = (byte_shift == 0)? whi :  (whi << (8 * byte_shift)) | (wlo >> (8 * (4-byte_shift)));
		

	}
	{
		
		int src_word_hi = 13 - word_shift;
		int src_word_lo = 13 - word_shift -1;

		unsigned int whi = (src_word_hi >= 0)? ap_uint_512_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo >= 0)? ap_uint_512_getDword(x, src_word_lo) : 0;

		
		r->w13 = (byte_shift == 0)? whi :  (whi << (8 * byte_shift)) | (wlo >> (8 * (4-byte_shift)));
		

	}
	{
		
		int src_word_hi = 12 - word_shift;
		int src_word_lo = 12 - word_shift -1;

		unsigned int whi = (src_word_hi >= 0)? ap_uint_512_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo >= 0)? ap_uint_512_getDword(x, src_word_lo) : 0;

		
		r->w12 = (byte_shift == 0)? whi :  (whi << (8 * byte_shift)) | (wlo >> (8 * (4-byte_shift)));
		

	}
	{
		
		int src_word_hi = 11 - word_shift;
		int src_word_lo = 11 - word_shift -1;

		unsigned int whi = (src_word_hi >= 0)? ap_uint_512_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo >= 0)? ap_uint_512_getDword(x, src_word_lo) : 0;

		
		r->w11 = (byte_shift == 0)? whi :  (whi << (8 * byte_shift)) | (wlo >> (8 * (4-byte_shift)));
		

	}
	{
		
		int src_word_hi = 10 - word_shift;
		int src_word_lo = 10 - word_shift -1;

		unsigned int whi = (src_word_hi >= 0)? ap_uint_512_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo >= 0)? ap_uint_512_getDword(x, src_word_lo) : 0;

		
		r->w10 = (byte_shift == 0)? whi :  (whi << (8 * byte_shift)) | (wlo >> (8 * (4-byte_shift)));
		

	}
	{
		
		int src_word_hi = 9 - word_shift;
		int src_word_lo = 9 - word_shift -1;

		unsigned int whi = (src_word_hi >= 0)? ap_uint_512_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo >= 0)? ap_uint_512_getDword(x, src_word_lo) : 0;

		
		r->w9 = (byte_shift == 0)? whi :  (whi << (8 * byte_shift)) | (wlo >> (8 * (4-byte_shift)));
		

	}
	{
		
		int src_word_hi = 8 - word_shift;
		int src_word_lo = 8 - word_shift -1;

		unsigned int whi = (src_word_hi >= 0)? ap_uint_512_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo >= 0)? ap_uint_512_getDword(x, src_word_lo) : 0;

		
		r->w8 = (byte_shift == 0)? whi :  (whi << (8 * byte_shift)) | (wlo >> (8 * (4-byte_shift)));
		

	}
	{
		
		int src_word_hi = 7 - word_shift;
		int src_word_lo = 7 - word_shift -1;

		unsigned int whi = (src_word_hi >= 0)? ap_uint_512_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo >= 0)? ap_uint_512_getDword(x, src_word_lo) : 0;

		
		r->w7 = (byte_shift == 0)? whi :  (whi << (8 * byte_shift)) | (wlo >> (8 * (4-byte_shift)));
		

	}
	{
		
		int src_word_hi = 6 - word_shift;
		int src_word_lo = 6 - word_shift -1;

		unsigned int whi = (src_word_hi >= 0)? ap_uint_512_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo >= 0)? ap_uint_512_getDword(x, src_word_lo) : 0;

		
		r->w6 = (byte_shift == 0)? whi :  (whi << (8 * byte_shift)) | (wlo >> (8 * (4-byte_shift)));
		

	}
	{
		
		int src_word_hi = 5 - word_shift;
		int src_word_lo = 5 - word_shift -1;

		unsigned int whi = (src_word_hi >= 0)? ap_uint_512_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo >= 0)? ap_uint_512_getDword(x, src_word_lo) : 0;

		
		r->w5 = (byte_shift == 0)? whi :  (whi << (8 * byte_shift)) | (wlo >> (8 * (4-byte_shift)));
		

	}
	{
		
		int src_word_hi = 4 - word_shift;
		int src_word_lo = 4 - word_shift -1;

		unsigned int whi = (src_word_hi >= 0)? ap_uint_512_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo >= 0)? ap_uint_512_getDword(x, src_word_lo) : 0;

		
		r->w4 = (byte_shift == 0)? whi :  (whi << (8 * byte_shift)) | (wlo >> (8 * (4-byte_shift)));
		

	}
	{
		
		int src_word_hi = 3 - word_shift;
		int src_word_lo = 3 - word_shift -1;

		unsigned int whi = (src_word_hi >= 0)? ap_uint_512_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo >= 0)? ap_uint_512_getDword(x, src_word_lo) : 0;

		
		r->w3 = (byte_shift == 0)? whi :  (whi << (8 * byte_shift)) | (wlo >> (8 * (4-byte_shift)));
		

	}
	{
		
		int src_word_hi = 2 - word_shift;
		int src_word_lo = 2 - word_shift -1;

		unsigned int whi = (src_word_hi >= 0)? ap_uint_512_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo >= 0)? ap_uint_512_getDword(x, src_word_lo) : 0;

		
		r->w2 = (byte_shift == 0)? whi :  (whi << (8 * byte_shift)) | (wlo >> (8 * (4-byte_shift)));
		

	}
	{
		
		int src_word_hi = 1 - word_shift;
		int src_word_lo = 1 - word_shift -1;

		unsigned int whi = (src_word_hi >= 0)? ap_uint_512_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo >= 0)? ap_uint_512_getDword(x, src_word_lo) : 0;

		
		r->w1 = (byte_shift == 0)? whi :  (whi << (8 * byte_shift)) | (wlo >> (8 * (4-byte_shift)));
		

	}
	{
		
		int src_word_hi = 0 - word_shift;
		int src_word_lo = 0 - word_shift -1;

		unsigned int whi = (src_word_hi >= 0)? ap_uint_512_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo >= 0)? ap_uint_512_getDword(x, src_word_lo) : 0;

		
		r->w0 = (byte_shift == 0)? whi :  (whi << (8 * byte_shift)) | (wlo >> (8 * (4-byte_shift)));
		

	}
}

void ap_uint_512_shift_left(ap_uint_512 x, unsigned int shift, ap_uint_512p r)
{
	int word_shift = shift >> 5; 	// shift / 32;
	int bit_shift = shift & 0x1F; 	// shift % 32;

	
	{
		
		int src_word_hi = 15 - word_shift;
		int src_word_lo = 15 - word_shift -1;

		unsigned int whi = (src_word_hi >= 0)? ap_uint_512_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo >= 0)? ap_uint_512_getDword(x, src_word_lo) : 0;

		
		r->w15 = (bit_shift == 0)? whi :  (whi << bit_shift) | (wlo >> (32-bit_shift));
		

	}
	{
		
		int src_word_hi = 14 - word_shift;
		int src_word_lo = 14 - word_shift -1;

		unsigned int whi = (src_word_hi >= 0)? ap_uint_512_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo >= 0)? ap_uint_512_getDword(x, src_word_lo) : 0;

		
		r->w14 = (bit_shift == 0)? whi :  (whi << bit_shift) | (wlo >> (32-bit_shift));
		

	}
	{
		
		int src_word_hi = 13 - word_shift;
		int src_word_lo = 13 - word_shift -1;

		unsigned int whi = (src_word_hi >= 0)? ap_uint_512_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo >= 0)? ap_uint_512_getDword(x, src_word_lo) : 0;

		
		r->w13 = (bit_shift == 0)? whi :  (whi << bit_shift) | (wlo >> (32-bit_shift));
		

	}
	{
		
		int src_word_hi = 12 - word_shift;
		int src_word_lo = 12 - word_shift -1;

		unsigned int whi = (src_word_hi >= 0)? ap_uint_512_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo >= 0)? ap_uint_512_getDword(x, src_word_lo) : 0;

		
		r->w12 = (bit_shift == 0)? whi :  (whi << bit_shift) | (wlo >> (32-bit_shift));
		

	}
	{
		
		int src_word_hi = 11 - word_shift;
		int src_word_lo = 11 - word_shift -1;

		unsigned int whi = (src_word_hi >= 0)? ap_uint_512_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo >= 0)? ap_uint_512_getDword(x, src_word_lo) : 0;

		
		r->w11 = (bit_shift == 0)? whi :  (whi << bit_shift) | (wlo >> (32-bit_shift));
		

	}
	{
		
		int src_word_hi = 10 - word_shift;
		int src_word_lo = 10 - word_shift -1;

		unsigned int whi = (src_word_hi >= 0)? ap_uint_512_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo >= 0)? ap_uint_512_getDword(x, src_word_lo) : 0;

		
		r->w10 = (bit_shift == 0)? whi :  (whi << bit_shift) | (wlo >> (32-bit_shift));
		

	}
	{
		
		int src_word_hi = 9 - word_shift;
		int src_word_lo = 9 - word_shift -1;

		unsigned int whi = (src_word_hi >= 0)? ap_uint_512_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo >= 0)? ap_uint_512_getDword(x, src_word_lo) : 0;

		
		r->w9 = (bit_shift == 0)? whi :  (whi << bit_shift) | (wlo >> (32-bit_shift));
		

	}
	{
		
		int src_word_hi = 8 - word_shift;
		int src_word_lo = 8 - word_shift -1;

		unsigned int whi = (src_word_hi >= 0)? ap_uint_512_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo >= 0)? ap_uint_512_getDword(x, src_word_lo) : 0;

		
		r->w8 = (bit_shift == 0)? whi :  (whi << bit_shift) | (wlo >> (32-bit_shift));
		

	}
	{
		
		int src_word_hi = 7 - word_shift;
		int src_word_lo = 7 - word_shift -1;

		unsigned int whi = (src_word_hi >= 0)? ap_uint_512_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo >= 0)? ap_uint_512_getDword(x, src_word_lo) : 0;

		
		r->w7 = (bit_shift == 0)? whi :  (whi << bit_shift) | (wlo >> (32-bit_shift));
		

	}
	{
		
		int src_word_hi = 6 - word_shift;
		int src_word_lo = 6 - word_shift -1;

		unsigned int whi = (src_word_hi >= 0)? ap_uint_512_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo >= 0)? ap_uint_512_getDword(x, src_word_lo) : 0;

		
		r->w6 = (bit_shift == 0)? whi :  (whi << bit_shift) | (wlo >> (32-bit_shift));
		

	}
	{
		
		int src_word_hi = 5 - word_shift;
		int src_word_lo = 5 - word_shift -1;

		unsigned int whi = (src_word_hi >= 0)? ap_uint_512_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo >= 0)? ap_uint_512_getDword(x, src_word_lo) : 0;

		
		r->w5 = (bit_shift == 0)? whi :  (whi << bit_shift) | (wlo >> (32-bit_shift));
		

	}
	{
		
		int src_word_hi = 4 - word_shift;
		int src_word_lo = 4 - word_shift -1;

		unsigned int whi = (src_word_hi >= 0)? ap_uint_512_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo >= 0)? ap_uint_512_getDword(x, src_word_lo) : 0;

		
		r->w4 = (bit_shift == 0)? whi :  (whi << bit_shift) | (wlo >> (32-bit_shift));
		

	}
	{
		
		int src_word_hi = 3 - word_shift;
		int src_word_lo = 3 - word_shift -1;

		unsigned int whi = (src_word_hi >= 0)? ap_uint_512_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo >= 0)? ap_uint_512_getDword(x, src_word_lo) : 0;

		
		r->w3 = (bit_shift == 0)? whi :  (whi << bit_shift) | (wlo >> (32-bit_shift));
		

	}
	{
		
		int src_word_hi = 2 - word_shift;
		int src_word_lo = 2 - word_shift -1;

		unsigned int whi = (src_word_hi >= 0)? ap_uint_512_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo >= 0)? ap_uint_512_getDword(x, src_word_lo) : 0;

		
		r->w2 = (bit_shift == 0)? whi :  (whi << bit_shift) | (wlo >> (32-bit_shift));
		

	}
	{
		
		int src_word_hi = 1 - word_shift;
		int src_word_lo = 1 - word_shift -1;

		unsigned int whi = (src_word_hi >= 0)? ap_uint_512_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo >= 0)? ap_uint_512_getDword(x, src_word_lo) : 0;

		
		r->w1 = (bit_shift == 0)? whi :  (whi << bit_shift) | (wlo >> (32-bit_shift));
		

	}
	{
		
		int src_word_hi = 0 - word_shift;
		int src_word_lo = 0 - word_shift -1;

		unsigned int whi = (src_word_hi >= 0)? ap_uint_512_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo >= 0)? ap_uint_512_getDword(x, src_word_lo) : 0;

		
		r->w0 = (bit_shift == 0)? whi :  (whi << bit_shift) | (wlo >> (32-bit_shift));
		

	}
}

void ap_uint_512_shift_left_self(int shift, ap_uint_512p r)
{
	ap_uint_512 aux;
	ap_uint_512_set(AP_UINT_PTR(aux), AP_UINT_FROM_PTR(r));
	ap_uint_512_shift_left(aux, shift, r);
}


void ap_uint_512_print(ap_uint_512 r)
{
	printf("0x");

	for (int i=0; i < 512/32; i++)
		printf("%08X ", ap_uint_512_getDword(r, (512/32)-1-i));
}


void ap_uint_512_printBinHigh(ap_uint_512 r, int len)
{
	for (int i=0; i < len; i++)
	{
		int bit = ap_uint_512_get_bit(r, 512-1-i);
		printf("%d", bit);
	}
}

void ap_uint_1024_printBinHigh(ap_uint_1024 r, int len)
{
	for (int i=0; i < len; i++)
	{
		int bit = ap_uint_1024_get_bit(r, 1024-1-i);
		printf("%d", bit);
	}
}

/**
* Decode a value
*/
void ap_uint_1024_decode(unsigned int v, int bits, ap_uint_1024p ret)
{
#ifdef FPGA_EMULATION
	assert(bits == 10);
#endif
	ap_uint_1024_zero(ret);
	ap_uint_1024_or_bit(ret, v, 1);

}

#ifdef FPGA_DEBUG

void test_my_ap_uint()
{
	ap_uint_512 v;
	ap_uint_512_setLowByte(AP_UINT_PTR(v), 0, 0xAAAA);
	
	printf("1) Initial V=");
	ap_uint_512_print(v);
	printf("\n");
	
	ap_uint_512_shift_left_self(32, AP_UINT_PTR(v));
	
	printf("2) Shift Left (32bits) V=");
	ap_uint_512_print(v);
	printf("\n");
	
	ap_uint_512_shift_right_self(16, AP_UINT_PTR(v));
	
	printf("3) Shift Right (16bits) V=");
	ap_uint_512_print(v);
	printf("\n");	
	
	printf("4) SetByte 0 V=");
	ap_uint_512_setLowByte(AP_UINT_PTR(v), 0, 0x55);
	ap_uint_512_shift_left_self(8, AP_UINT_PTR(v));
	ap_uint_512_setLowByte(AP_UINT_PTR(v), 0, 0x44);
	ap_uint_512_print(v);
	printf("\n");	

	printf("5) SetLow Ones 35 V=");
	ap_uint_512_onesLow(AP_UINT_PTR(v), 35);
	ap_uint_512_print(v);
	printf("\n");	

	unsigned char b = ap_uint_512_getLowByte(v, 1);
	printf("6) GetByte [1] = 0x%02X\n", b);

}

#endif


