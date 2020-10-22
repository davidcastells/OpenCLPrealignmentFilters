 
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

/**
* Sets a byte in a 32bits word of the 512 stream.
* It cannot be used concurrently
*/
void ap_uint_512_set_word_byte(ap_uint_512p v, int wordidx, int byteidx, int value)
{
	unsigned int mask = (0xFF << (byteidx * 8));
	unsigned int nmask = ~mask;

	
	if (wordidx == 0){ v->w0 = (v->w0 & nmask) | (value << (byteidx*8)); }
	if (wordidx == 1){ v->w1 = (v->w1 & nmask) | (value << (byteidx*8)); }
	if (wordidx == 2){ v->w2 = (v->w2 & nmask) | (value << (byteidx*8)); }
	if (wordidx == 3){ v->w3 = (v->w3 & nmask) | (value << (byteidx*8)); }
	if (wordidx == 4){ v->w4 = (v->w4 & nmask) | (value << (byteidx*8)); }
	if (wordidx == 5){ v->w5 = (v->w5 & nmask) | (value << (byteidx*8)); }
	if (wordidx == 6){ v->w6 = (v->w6 & nmask) | (value << (byteidx*8)); }
	if (wordidx == 7){ v->w7 = (v->w7 & nmask) | (value << (byteidx*8)); }
	if (wordidx == 8){ v->w8 = (v->w8 & nmask) | (value << (byteidx*8)); }
	if (wordidx == 9){ v->w9 = (v->w9 & nmask) | (value << (byteidx*8)); }
	if (wordidx == 10){ v->w10 = (v->w10 & nmask) | (value << (byteidx*8)); }
	if (wordidx == 11){ v->w11 = (v->w11 & nmask) | (value << (byteidx*8)); }
	if (wordidx == 12){ v->w12 = (v->w12 & nmask) | (value << (byteidx*8)); }
	if (wordidx == 13){ v->w13 = (v->w13 & nmask) | (value << (byteidx*8)); }
	if (wordidx == 14){ v->w14 = (v->w14 & nmask) | (value << (byteidx*8)); }
	if (wordidx == 15){ v->w15 = (v->w15 & nmask) | (value << (byteidx*8)); }			
}

void ap_uint_512_or_word_byte(ap_uint_512p v, int wordidx, int byteidx, int value)
{
	
	if (wordidx == 0){ v->w0 = v->w0  | (value << (byteidx*8)); }
	if (wordidx == 1){ v->w1 = v->w1  | (value << (byteidx*8)); }
	if (wordidx == 2){ v->w2 = v->w2  | (value << (byteidx*8)); }
	if (wordidx == 3){ v->w3 = v->w3  | (value << (byteidx*8)); }
	if (wordidx == 4){ v->w4 = v->w4  | (value << (byteidx*8)); }
	if (wordidx == 5){ v->w5 = v->w5  | (value << (byteidx*8)); }
	if (wordidx == 6){ v->w6 = v->w6  | (value << (byteidx*8)); }
	if (wordidx == 7){ v->w7 = v->w7  | (value << (byteidx*8)); }
	if (wordidx == 8){ v->w8 = v->w8  | (value << (byteidx*8)); }
	if (wordidx == 9){ v->w9 = v->w9  | (value << (byteidx*8)); }
	if (wordidx == 10){ v->w10 = v->w10  | (value << (byteidx*8)); }
	if (wordidx == 11){ v->w11 = v->w11  | (value << (byteidx*8)); }
	if (wordidx == 12){ v->w12 = v->w12  | (value << (byteidx*8)); }
	if (wordidx == 13){ v->w13 = v->w13  | (value << (byteidx*8)); }
	if (wordidx == 14){ v->w14 = v->w14  | (value << (byteidx*8)); }
	if (wordidx == 15){ v->w15 = v->w15  | (value << (byteidx*8)); }	
	
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

	int wordidx = (index * 8) / 32;
	int byteidx = (index % (32/8));
	
	ap_uint_512_set_word_byte(v, wordidx, byteidx, value);

}

void ap_uint_512_orLowByteConcurrent(ap_uint_512p v, int index, int value)
{	
	int wordidx = (index * 8) / 32;
	int byteidx = (index % (32/8));
	
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

unsigned char ap_uint_512_getLowByte(ap_uint_512 v, int index)
{
	int wordidx = (index * 8) / 32;
	int byteidx = (index % (32/8));

	unsigned int dword = ap_uint_512_getDword(v, wordidx);

	return (dword >> (8*byteidx)) & 0xFF;
}

unsigned int ap_uint_512_getDword(ap_uint_512 v, int wordidx)
{	
	
	if (wordidx == 0){ return v.w0;}
	if (wordidx == 1){ return v.w1;}
	if (wordidx == 2){ return v.w2;}
	if (wordidx == 3){ return v.w3;}
	if (wordidx == 4){ return v.w4;}
	if (wordidx == 5){ return v.w5;}
	if (wordidx == 6){ return v.w6;}
	if (wordidx == 7){ return v.w7;}
	if (wordidx == 8){ return v.w8;}
	if (wordidx == 9){ return v.w9;}
	if (wordidx == 10){ return v.w10;}
	if (wordidx == 11){ return v.w11;}
	if (wordidx == 12){ return v.w12;}
	if (wordidx == 13){ return v.w13;}
	if (wordidx == 14){ return v.w14;}
	if (wordidx == 15){ return v.w15;}	



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
	int wordidx = bit / 32;
	int bitidx = (bit % 32);
	
	
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

}

void ap_uint_512_or_bit(ap_uint_512p v, int bit, int x)
{
	int wordidx = bit / 32;
	int bitidx = (bit % 32);

	
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
	
}


void ap_uint_1024_or_bit(ap_uint_1024p v, int bit, int x)
{
	int wordidx = bit / 32;
	int bitidx = (bit % 32);

	
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
	int wordidx = bit / 32;
	int bitidx = (bit % 32);
	
	
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

	#pragma unroll
	for (int i=0; i < 512; i++)
	{
		ap_uint_512_or_bit(v, i, (i<n)?1:0);
	}
}

void ap_uint_512_onesHigh(ap_uint_512p v, int n)
{
	ap_uint_512_zero(v);

	#pragma unroll
	for (int i=0; i < 512; i++)
	{
		ap_uint_512_or_bit(v, 512-1-i, (i<n)?1:0);
	}
}

int ap_uint_512_get_bit(ap_uint_512 x, int bit)
{

	int wordidx = bit / 32;
	int bitidx = (bit % 32);

	
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

	int wordidx = bit / 32;
	int bitidx = (bit % 32);

	
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

unsigned int ap_uint_512_pop_count(ap_uint_512 x)
{
	unsigned int p=0;
	#pragma unroll
	for (int i=0; i < 512; i++)
	{
		int v = ap_uint_512_get_bit(x, i);
		if (v)
			p++;
	}
	return p;
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
	ap_uint_512 aux;
	ap_uint_512_set(AP_UINT_PTR(aux), AP_UINT_FROM_PTR(a));
	ap_uint_512_and(aux, b, a);
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

	#pragma unroll
	for (int i=0; i < 512; i++)
	{
		int src = i+shift;
		
		if (src >= 512)
		{
			// already zero
			//ap_uint_512_set_bit(r, i, 0);
		}
		else
			ap_uint_512_or_bit(r, i, ap_uint_512_get_bit(x, src));
	}

}


void ap_uint_512_shift_right_self(int shift, ap_uint_512p r)
{
	ap_uint_512 aux;
	ap_uint_512_set(AP_UINT_PTR(aux), AP_UINT_FROM_PTR(r));
	ap_uint_512_shift_right(aux, shift, r);
}


void ap_uint_512_shift_left_bytes(ap_uint_512 x, unsigned char shift, ap_uint_512p r)
{
	ap_uint_512_zero(r);

	#pragma unroll
	for (int i=0; i < 512/8; i++)
	{
		int src = i-shift;
		
		if (src < 0)
		{
			// already zero
			//ap_uint_512_set_bit(r, i, 0);
		}
		else
		{
			int byte = ap_uint_512_getLowByte(x, src);

			ap_uint_512_orLowByteConcurrent(r, i, byte);
		}
	}
}

void ap_uint_512_shift_left(ap_uint_512 x, int shift, ap_uint_512p r)
{
	ap_uint_512_zero(r);

	#pragma unroll
	for (int i=0; i < 512; i++)
	{
		int src = i-shift;
		
		if (src < 0)
		{
			// already zero
			//ap_uint_512_set_bit(r, i, 0);
		}
		else
			ap_uint_512_or_bit(r, i, ap_uint_512_get_bit(x, src));
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


