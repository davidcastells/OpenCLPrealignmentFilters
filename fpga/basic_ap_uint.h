 
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
void ap_uint_512_set_word_byte(ap_uint_512p v, int wordidx, int byteidx, unsigned int value)
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

void ap_uint_512_or_word_byte(ap_uint_512p v, int wordidx, int byteidx, unsigned int value)
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


void ap_uint_512_shift_left_bytes(ap_uint_512 x, unsigned char shift, ap_uint_512p r)
{
	ap_uint_512_zero(r);

      
	if ((0-shift) >= 0)
	{
		int byte = ap_uint_512_getLowByte(x, (0-shift));
		ap_uint_512_orLowByteConcurrent(r, 0, byte);
	}
	if ((1-shift) >= 0)
	{
		int byte = ap_uint_512_getLowByte(x, (1-shift));
		ap_uint_512_orLowByteConcurrent(r, 1, byte);
	}
	if ((2-shift) >= 0)
	{
		int byte = ap_uint_512_getLowByte(x, (2-shift));
		ap_uint_512_orLowByteConcurrent(r, 2, byte);
	}
	if ((3-shift) >= 0)
	{
		int byte = ap_uint_512_getLowByte(x, (3-shift));
		ap_uint_512_orLowByteConcurrent(r, 3, byte);
	}
	if ((4-shift) >= 0)
	{
		int byte = ap_uint_512_getLowByte(x, (4-shift));
		ap_uint_512_orLowByteConcurrent(r, 4, byte);
	}
	if ((5-shift) >= 0)
	{
		int byte = ap_uint_512_getLowByte(x, (5-shift));
		ap_uint_512_orLowByteConcurrent(r, 5, byte);
	}
	if ((6-shift) >= 0)
	{
		int byte = ap_uint_512_getLowByte(x, (6-shift));
		ap_uint_512_orLowByteConcurrent(r, 6, byte);
	}
	if ((7-shift) >= 0)
	{
		int byte = ap_uint_512_getLowByte(x, (7-shift));
		ap_uint_512_orLowByteConcurrent(r, 7, byte);
	}
	if ((8-shift) >= 0)
	{
		int byte = ap_uint_512_getLowByte(x, (8-shift));
		ap_uint_512_orLowByteConcurrent(r, 8, byte);
	}
	if ((9-shift) >= 0)
	{
		int byte = ap_uint_512_getLowByte(x, (9-shift));
		ap_uint_512_orLowByteConcurrent(r, 9, byte);
	}
	if ((10-shift) >= 0)
	{
		int byte = ap_uint_512_getLowByte(x, (10-shift));
		ap_uint_512_orLowByteConcurrent(r, 10, byte);
	}
	if ((11-shift) >= 0)
	{
		int byte = ap_uint_512_getLowByte(x, (11-shift));
		ap_uint_512_orLowByteConcurrent(r, 11, byte);
	}
	if ((12-shift) >= 0)
	{
		int byte = ap_uint_512_getLowByte(x, (12-shift));
		ap_uint_512_orLowByteConcurrent(r, 12, byte);
	}
	if ((13-shift) >= 0)
	{
		int byte = ap_uint_512_getLowByte(x, (13-shift));
		ap_uint_512_orLowByteConcurrent(r, 13, byte);
	}
	if ((14-shift) >= 0)
	{
		int byte = ap_uint_512_getLowByte(x, (14-shift));
		ap_uint_512_orLowByteConcurrent(r, 14, byte);
	}
	if ((15-shift) >= 0)
	{
		int byte = ap_uint_512_getLowByte(x, (15-shift));
		ap_uint_512_orLowByteConcurrent(r, 15, byte);
	}
	if ((16-shift) >= 0)
	{
		int byte = ap_uint_512_getLowByte(x, (16-shift));
		ap_uint_512_orLowByteConcurrent(r, 16, byte);
	}
	if ((17-shift) >= 0)
	{
		int byte = ap_uint_512_getLowByte(x, (17-shift));
		ap_uint_512_orLowByteConcurrent(r, 17, byte);
	}
	if ((18-shift) >= 0)
	{
		int byte = ap_uint_512_getLowByte(x, (18-shift));
		ap_uint_512_orLowByteConcurrent(r, 18, byte);
	}
	if ((19-shift) >= 0)
	{
		int byte = ap_uint_512_getLowByte(x, (19-shift));
		ap_uint_512_orLowByteConcurrent(r, 19, byte);
	}
	if ((20-shift) >= 0)
	{
		int byte = ap_uint_512_getLowByte(x, (20-shift));
		ap_uint_512_orLowByteConcurrent(r, 20, byte);
	}
	if ((21-shift) >= 0)
	{
		int byte = ap_uint_512_getLowByte(x, (21-shift));
		ap_uint_512_orLowByteConcurrent(r, 21, byte);
	}
	if ((22-shift) >= 0)
	{
		int byte = ap_uint_512_getLowByte(x, (22-shift));
		ap_uint_512_orLowByteConcurrent(r, 22, byte);
	}
	if ((23-shift) >= 0)
	{
		int byte = ap_uint_512_getLowByte(x, (23-shift));
		ap_uint_512_orLowByteConcurrent(r, 23, byte);
	}
	if ((24-shift) >= 0)
	{
		int byte = ap_uint_512_getLowByte(x, (24-shift));
		ap_uint_512_orLowByteConcurrent(r, 24, byte);
	}
	if ((25-shift) >= 0)
	{
		int byte = ap_uint_512_getLowByte(x, (25-shift));
		ap_uint_512_orLowByteConcurrent(r, 25, byte);
	}
	if ((26-shift) >= 0)
	{
		int byte = ap_uint_512_getLowByte(x, (26-shift));
		ap_uint_512_orLowByteConcurrent(r, 26, byte);
	}
	if ((27-shift) >= 0)
	{
		int byte = ap_uint_512_getLowByte(x, (27-shift));
		ap_uint_512_orLowByteConcurrent(r, 27, byte);
	}
	if ((28-shift) >= 0)
	{
		int byte = ap_uint_512_getLowByte(x, (28-shift));
		ap_uint_512_orLowByteConcurrent(r, 28, byte);
	}
	if ((29-shift) >= 0)
	{
		int byte = ap_uint_512_getLowByte(x, (29-shift));
		ap_uint_512_orLowByteConcurrent(r, 29, byte);
	}
	if ((30-shift) >= 0)
	{
		int byte = ap_uint_512_getLowByte(x, (30-shift));
		ap_uint_512_orLowByteConcurrent(r, 30, byte);
	}
	if ((31-shift) >= 0)
	{
		int byte = ap_uint_512_getLowByte(x, (31-shift));
		ap_uint_512_orLowByteConcurrent(r, 31, byte);
	}
	if ((32-shift) >= 0)
	{
		int byte = ap_uint_512_getLowByte(x, (32-shift));
		ap_uint_512_orLowByteConcurrent(r, 32, byte);
	}
	if ((33-shift) >= 0)
	{
		int byte = ap_uint_512_getLowByte(x, (33-shift));
		ap_uint_512_orLowByteConcurrent(r, 33, byte);
	}
	if ((34-shift) >= 0)
	{
		int byte = ap_uint_512_getLowByte(x, (34-shift));
		ap_uint_512_orLowByteConcurrent(r, 34, byte);
	}
	if ((35-shift) >= 0)
	{
		int byte = ap_uint_512_getLowByte(x, (35-shift));
		ap_uint_512_orLowByteConcurrent(r, 35, byte);
	}
	if ((36-shift) >= 0)
	{
		int byte = ap_uint_512_getLowByte(x, (36-shift));
		ap_uint_512_orLowByteConcurrent(r, 36, byte);
	}
	if ((37-shift) >= 0)
	{
		int byte = ap_uint_512_getLowByte(x, (37-shift));
		ap_uint_512_orLowByteConcurrent(r, 37, byte);
	}
	if ((38-shift) >= 0)
	{
		int byte = ap_uint_512_getLowByte(x, (38-shift));
		ap_uint_512_orLowByteConcurrent(r, 38, byte);
	}
	if ((39-shift) >= 0)
	{
		int byte = ap_uint_512_getLowByte(x, (39-shift));
		ap_uint_512_orLowByteConcurrent(r, 39, byte);
	}
	if ((40-shift) >= 0)
	{
		int byte = ap_uint_512_getLowByte(x, (40-shift));
		ap_uint_512_orLowByteConcurrent(r, 40, byte);
	}
	if ((41-shift) >= 0)
	{
		int byte = ap_uint_512_getLowByte(x, (41-shift));
		ap_uint_512_orLowByteConcurrent(r, 41, byte);
	}
	if ((42-shift) >= 0)
	{
		int byte = ap_uint_512_getLowByte(x, (42-shift));
		ap_uint_512_orLowByteConcurrent(r, 42, byte);
	}
	if ((43-shift) >= 0)
	{
		int byte = ap_uint_512_getLowByte(x, (43-shift));
		ap_uint_512_orLowByteConcurrent(r, 43, byte);
	}
	if ((44-shift) >= 0)
	{
		int byte = ap_uint_512_getLowByte(x, (44-shift));
		ap_uint_512_orLowByteConcurrent(r, 44, byte);
	}
	if ((45-shift) >= 0)
	{
		int byte = ap_uint_512_getLowByte(x, (45-shift));
		ap_uint_512_orLowByteConcurrent(r, 45, byte);
	}
	if ((46-shift) >= 0)
	{
		int byte = ap_uint_512_getLowByte(x, (46-shift));
		ap_uint_512_orLowByteConcurrent(r, 46, byte);
	}
	if ((47-shift) >= 0)
	{
		int byte = ap_uint_512_getLowByte(x, (47-shift));
		ap_uint_512_orLowByteConcurrent(r, 47, byte);
	}
	if ((48-shift) >= 0)
	{
		int byte = ap_uint_512_getLowByte(x, (48-shift));
		ap_uint_512_orLowByteConcurrent(r, 48, byte);
	}
	if ((49-shift) >= 0)
	{
		int byte = ap_uint_512_getLowByte(x, (49-shift));
		ap_uint_512_orLowByteConcurrent(r, 49, byte);
	}
	if ((50-shift) >= 0)
	{
		int byte = ap_uint_512_getLowByte(x, (50-shift));
		ap_uint_512_orLowByteConcurrent(r, 50, byte);
	}
	if ((51-shift) >= 0)
	{
		int byte = ap_uint_512_getLowByte(x, (51-shift));
		ap_uint_512_orLowByteConcurrent(r, 51, byte);
	}
	if ((52-shift) >= 0)
	{
		int byte = ap_uint_512_getLowByte(x, (52-shift));
		ap_uint_512_orLowByteConcurrent(r, 52, byte);
	}
	if ((53-shift) >= 0)
	{
		int byte = ap_uint_512_getLowByte(x, (53-shift));
		ap_uint_512_orLowByteConcurrent(r, 53, byte);
	}
	if ((54-shift) >= 0)
	{
		int byte = ap_uint_512_getLowByte(x, (54-shift));
		ap_uint_512_orLowByteConcurrent(r, 54, byte);
	}
	if ((55-shift) >= 0)
	{
		int byte = ap_uint_512_getLowByte(x, (55-shift));
		ap_uint_512_orLowByteConcurrent(r, 55, byte);
	}
	if ((56-shift) >= 0)
	{
		int byte = ap_uint_512_getLowByte(x, (56-shift));
		ap_uint_512_orLowByteConcurrent(r, 56, byte);
	}
	if ((57-shift) >= 0)
	{
		int byte = ap_uint_512_getLowByte(x, (57-shift));
		ap_uint_512_orLowByteConcurrent(r, 57, byte);
	}
	if ((58-shift) >= 0)
	{
		int byte = ap_uint_512_getLowByte(x, (58-shift));
		ap_uint_512_orLowByteConcurrent(r, 58, byte);
	}
	if ((59-shift) >= 0)
	{
		int byte = ap_uint_512_getLowByte(x, (59-shift));
		ap_uint_512_orLowByteConcurrent(r, 59, byte);
	}
	if ((60-shift) >= 0)
	{
		int byte = ap_uint_512_getLowByte(x, (60-shift));
		ap_uint_512_orLowByteConcurrent(r, 60, byte);
	}
	if ((61-shift) >= 0)
	{
		int byte = ap_uint_512_getLowByte(x, (61-shift));
		ap_uint_512_orLowByteConcurrent(r, 61, byte);
	}
	if ((62-shift) >= 0)
	{
		int byte = ap_uint_512_getLowByte(x, (62-shift));
		ap_uint_512_orLowByteConcurrent(r, 62, byte);
	}
	if ((63-shift) >= 0)
	{
		int byte = ap_uint_512_getLowByte(x, (63-shift));
		ap_uint_512_orLowByteConcurrent(r, 63, byte);
	}
}

void ap_uint_512_shift_left(ap_uint_512 x, int shift, ap_uint_512p r)
{
	ap_uint_512_zero(r);

	
	if ((0-shift) >= 0) ap_uint_512_or_bit(r, 0, ap_uint_512_get_bit(x, (0-shift)));
	if ((1-shift) >= 0) ap_uint_512_or_bit(r, 1, ap_uint_512_get_bit(x, (1-shift)));
	if ((2-shift) >= 0) ap_uint_512_or_bit(r, 2, ap_uint_512_get_bit(x, (2-shift)));
	if ((3-shift) >= 0) ap_uint_512_or_bit(r, 3, ap_uint_512_get_bit(x, (3-shift)));
	if ((4-shift) >= 0) ap_uint_512_or_bit(r, 4, ap_uint_512_get_bit(x, (4-shift)));
	if ((5-shift) >= 0) ap_uint_512_or_bit(r, 5, ap_uint_512_get_bit(x, (5-shift)));
	if ((6-shift) >= 0) ap_uint_512_or_bit(r, 6, ap_uint_512_get_bit(x, (6-shift)));
	if ((7-shift) >= 0) ap_uint_512_or_bit(r, 7, ap_uint_512_get_bit(x, (7-shift)));
	if ((8-shift) >= 0) ap_uint_512_or_bit(r, 8, ap_uint_512_get_bit(x, (8-shift)));
	if ((9-shift) >= 0) ap_uint_512_or_bit(r, 9, ap_uint_512_get_bit(x, (9-shift)));
	if ((10-shift) >= 0) ap_uint_512_or_bit(r, 10, ap_uint_512_get_bit(x, (10-shift)));
	if ((11-shift) >= 0) ap_uint_512_or_bit(r, 11, ap_uint_512_get_bit(x, (11-shift)));
	if ((12-shift) >= 0) ap_uint_512_or_bit(r, 12, ap_uint_512_get_bit(x, (12-shift)));
	if ((13-shift) >= 0) ap_uint_512_or_bit(r, 13, ap_uint_512_get_bit(x, (13-shift)));
	if ((14-shift) >= 0) ap_uint_512_or_bit(r, 14, ap_uint_512_get_bit(x, (14-shift)));
	if ((15-shift) >= 0) ap_uint_512_or_bit(r, 15, ap_uint_512_get_bit(x, (15-shift)));
	if ((16-shift) >= 0) ap_uint_512_or_bit(r, 16, ap_uint_512_get_bit(x, (16-shift)));
	if ((17-shift) >= 0) ap_uint_512_or_bit(r, 17, ap_uint_512_get_bit(x, (17-shift)));
	if ((18-shift) >= 0) ap_uint_512_or_bit(r, 18, ap_uint_512_get_bit(x, (18-shift)));
	if ((19-shift) >= 0) ap_uint_512_or_bit(r, 19, ap_uint_512_get_bit(x, (19-shift)));
	if ((20-shift) >= 0) ap_uint_512_or_bit(r, 20, ap_uint_512_get_bit(x, (20-shift)));
	if ((21-shift) >= 0) ap_uint_512_or_bit(r, 21, ap_uint_512_get_bit(x, (21-shift)));
	if ((22-shift) >= 0) ap_uint_512_or_bit(r, 22, ap_uint_512_get_bit(x, (22-shift)));
	if ((23-shift) >= 0) ap_uint_512_or_bit(r, 23, ap_uint_512_get_bit(x, (23-shift)));
	if ((24-shift) >= 0) ap_uint_512_or_bit(r, 24, ap_uint_512_get_bit(x, (24-shift)));
	if ((25-shift) >= 0) ap_uint_512_or_bit(r, 25, ap_uint_512_get_bit(x, (25-shift)));
	if ((26-shift) >= 0) ap_uint_512_or_bit(r, 26, ap_uint_512_get_bit(x, (26-shift)));
	if ((27-shift) >= 0) ap_uint_512_or_bit(r, 27, ap_uint_512_get_bit(x, (27-shift)));
	if ((28-shift) >= 0) ap_uint_512_or_bit(r, 28, ap_uint_512_get_bit(x, (28-shift)));
	if ((29-shift) >= 0) ap_uint_512_or_bit(r, 29, ap_uint_512_get_bit(x, (29-shift)));
	if ((30-shift) >= 0) ap_uint_512_or_bit(r, 30, ap_uint_512_get_bit(x, (30-shift)));
	if ((31-shift) >= 0) ap_uint_512_or_bit(r, 31, ap_uint_512_get_bit(x, (31-shift)));
	if ((32-shift) >= 0) ap_uint_512_or_bit(r, 32, ap_uint_512_get_bit(x, (32-shift)));
	if ((33-shift) >= 0) ap_uint_512_or_bit(r, 33, ap_uint_512_get_bit(x, (33-shift)));
	if ((34-shift) >= 0) ap_uint_512_or_bit(r, 34, ap_uint_512_get_bit(x, (34-shift)));
	if ((35-shift) >= 0) ap_uint_512_or_bit(r, 35, ap_uint_512_get_bit(x, (35-shift)));
	if ((36-shift) >= 0) ap_uint_512_or_bit(r, 36, ap_uint_512_get_bit(x, (36-shift)));
	if ((37-shift) >= 0) ap_uint_512_or_bit(r, 37, ap_uint_512_get_bit(x, (37-shift)));
	if ((38-shift) >= 0) ap_uint_512_or_bit(r, 38, ap_uint_512_get_bit(x, (38-shift)));
	if ((39-shift) >= 0) ap_uint_512_or_bit(r, 39, ap_uint_512_get_bit(x, (39-shift)));
	if ((40-shift) >= 0) ap_uint_512_or_bit(r, 40, ap_uint_512_get_bit(x, (40-shift)));
	if ((41-shift) >= 0) ap_uint_512_or_bit(r, 41, ap_uint_512_get_bit(x, (41-shift)));
	if ((42-shift) >= 0) ap_uint_512_or_bit(r, 42, ap_uint_512_get_bit(x, (42-shift)));
	if ((43-shift) >= 0) ap_uint_512_or_bit(r, 43, ap_uint_512_get_bit(x, (43-shift)));
	if ((44-shift) >= 0) ap_uint_512_or_bit(r, 44, ap_uint_512_get_bit(x, (44-shift)));
	if ((45-shift) >= 0) ap_uint_512_or_bit(r, 45, ap_uint_512_get_bit(x, (45-shift)));
	if ((46-shift) >= 0) ap_uint_512_or_bit(r, 46, ap_uint_512_get_bit(x, (46-shift)));
	if ((47-shift) >= 0) ap_uint_512_or_bit(r, 47, ap_uint_512_get_bit(x, (47-shift)));
	if ((48-shift) >= 0) ap_uint_512_or_bit(r, 48, ap_uint_512_get_bit(x, (48-shift)));
	if ((49-shift) >= 0) ap_uint_512_or_bit(r, 49, ap_uint_512_get_bit(x, (49-shift)));
	if ((50-shift) >= 0) ap_uint_512_or_bit(r, 50, ap_uint_512_get_bit(x, (50-shift)));
	if ((51-shift) >= 0) ap_uint_512_or_bit(r, 51, ap_uint_512_get_bit(x, (51-shift)));
	if ((52-shift) >= 0) ap_uint_512_or_bit(r, 52, ap_uint_512_get_bit(x, (52-shift)));
	if ((53-shift) >= 0) ap_uint_512_or_bit(r, 53, ap_uint_512_get_bit(x, (53-shift)));
	if ((54-shift) >= 0) ap_uint_512_or_bit(r, 54, ap_uint_512_get_bit(x, (54-shift)));
	if ((55-shift) >= 0) ap_uint_512_or_bit(r, 55, ap_uint_512_get_bit(x, (55-shift)));
	if ((56-shift) >= 0) ap_uint_512_or_bit(r, 56, ap_uint_512_get_bit(x, (56-shift)));
	if ((57-shift) >= 0) ap_uint_512_or_bit(r, 57, ap_uint_512_get_bit(x, (57-shift)));
	if ((58-shift) >= 0) ap_uint_512_or_bit(r, 58, ap_uint_512_get_bit(x, (58-shift)));
	if ((59-shift) >= 0) ap_uint_512_or_bit(r, 59, ap_uint_512_get_bit(x, (59-shift)));
	if ((60-shift) >= 0) ap_uint_512_or_bit(r, 60, ap_uint_512_get_bit(x, (60-shift)));
	if ((61-shift) >= 0) ap_uint_512_or_bit(r, 61, ap_uint_512_get_bit(x, (61-shift)));
	if ((62-shift) >= 0) ap_uint_512_or_bit(r, 62, ap_uint_512_get_bit(x, (62-shift)));
	if ((63-shift) >= 0) ap_uint_512_or_bit(r, 63, ap_uint_512_get_bit(x, (63-shift)));
	if ((64-shift) >= 0) ap_uint_512_or_bit(r, 64, ap_uint_512_get_bit(x, (64-shift)));
	if ((65-shift) >= 0) ap_uint_512_or_bit(r, 65, ap_uint_512_get_bit(x, (65-shift)));
	if ((66-shift) >= 0) ap_uint_512_or_bit(r, 66, ap_uint_512_get_bit(x, (66-shift)));
	if ((67-shift) >= 0) ap_uint_512_or_bit(r, 67, ap_uint_512_get_bit(x, (67-shift)));
	if ((68-shift) >= 0) ap_uint_512_or_bit(r, 68, ap_uint_512_get_bit(x, (68-shift)));
	if ((69-shift) >= 0) ap_uint_512_or_bit(r, 69, ap_uint_512_get_bit(x, (69-shift)));
	if ((70-shift) >= 0) ap_uint_512_or_bit(r, 70, ap_uint_512_get_bit(x, (70-shift)));
	if ((71-shift) >= 0) ap_uint_512_or_bit(r, 71, ap_uint_512_get_bit(x, (71-shift)));
	if ((72-shift) >= 0) ap_uint_512_or_bit(r, 72, ap_uint_512_get_bit(x, (72-shift)));
	if ((73-shift) >= 0) ap_uint_512_or_bit(r, 73, ap_uint_512_get_bit(x, (73-shift)));
	if ((74-shift) >= 0) ap_uint_512_or_bit(r, 74, ap_uint_512_get_bit(x, (74-shift)));
	if ((75-shift) >= 0) ap_uint_512_or_bit(r, 75, ap_uint_512_get_bit(x, (75-shift)));
	if ((76-shift) >= 0) ap_uint_512_or_bit(r, 76, ap_uint_512_get_bit(x, (76-shift)));
	if ((77-shift) >= 0) ap_uint_512_or_bit(r, 77, ap_uint_512_get_bit(x, (77-shift)));
	if ((78-shift) >= 0) ap_uint_512_or_bit(r, 78, ap_uint_512_get_bit(x, (78-shift)));
	if ((79-shift) >= 0) ap_uint_512_or_bit(r, 79, ap_uint_512_get_bit(x, (79-shift)));
	if ((80-shift) >= 0) ap_uint_512_or_bit(r, 80, ap_uint_512_get_bit(x, (80-shift)));
	if ((81-shift) >= 0) ap_uint_512_or_bit(r, 81, ap_uint_512_get_bit(x, (81-shift)));
	if ((82-shift) >= 0) ap_uint_512_or_bit(r, 82, ap_uint_512_get_bit(x, (82-shift)));
	if ((83-shift) >= 0) ap_uint_512_or_bit(r, 83, ap_uint_512_get_bit(x, (83-shift)));
	if ((84-shift) >= 0) ap_uint_512_or_bit(r, 84, ap_uint_512_get_bit(x, (84-shift)));
	if ((85-shift) >= 0) ap_uint_512_or_bit(r, 85, ap_uint_512_get_bit(x, (85-shift)));
	if ((86-shift) >= 0) ap_uint_512_or_bit(r, 86, ap_uint_512_get_bit(x, (86-shift)));
	if ((87-shift) >= 0) ap_uint_512_or_bit(r, 87, ap_uint_512_get_bit(x, (87-shift)));
	if ((88-shift) >= 0) ap_uint_512_or_bit(r, 88, ap_uint_512_get_bit(x, (88-shift)));
	if ((89-shift) >= 0) ap_uint_512_or_bit(r, 89, ap_uint_512_get_bit(x, (89-shift)));
	if ((90-shift) >= 0) ap_uint_512_or_bit(r, 90, ap_uint_512_get_bit(x, (90-shift)));
	if ((91-shift) >= 0) ap_uint_512_or_bit(r, 91, ap_uint_512_get_bit(x, (91-shift)));
	if ((92-shift) >= 0) ap_uint_512_or_bit(r, 92, ap_uint_512_get_bit(x, (92-shift)));
	if ((93-shift) >= 0) ap_uint_512_or_bit(r, 93, ap_uint_512_get_bit(x, (93-shift)));
	if ((94-shift) >= 0) ap_uint_512_or_bit(r, 94, ap_uint_512_get_bit(x, (94-shift)));
	if ((95-shift) >= 0) ap_uint_512_or_bit(r, 95, ap_uint_512_get_bit(x, (95-shift)));
	if ((96-shift) >= 0) ap_uint_512_or_bit(r, 96, ap_uint_512_get_bit(x, (96-shift)));
	if ((97-shift) >= 0) ap_uint_512_or_bit(r, 97, ap_uint_512_get_bit(x, (97-shift)));
	if ((98-shift) >= 0) ap_uint_512_or_bit(r, 98, ap_uint_512_get_bit(x, (98-shift)));
	if ((99-shift) >= 0) ap_uint_512_or_bit(r, 99, ap_uint_512_get_bit(x, (99-shift)));
	if ((100-shift) >= 0) ap_uint_512_or_bit(r, 100, ap_uint_512_get_bit(x, (100-shift)));
	if ((101-shift) >= 0) ap_uint_512_or_bit(r, 101, ap_uint_512_get_bit(x, (101-shift)));
	if ((102-shift) >= 0) ap_uint_512_or_bit(r, 102, ap_uint_512_get_bit(x, (102-shift)));
	if ((103-shift) >= 0) ap_uint_512_or_bit(r, 103, ap_uint_512_get_bit(x, (103-shift)));
	if ((104-shift) >= 0) ap_uint_512_or_bit(r, 104, ap_uint_512_get_bit(x, (104-shift)));
	if ((105-shift) >= 0) ap_uint_512_or_bit(r, 105, ap_uint_512_get_bit(x, (105-shift)));
	if ((106-shift) >= 0) ap_uint_512_or_bit(r, 106, ap_uint_512_get_bit(x, (106-shift)));
	if ((107-shift) >= 0) ap_uint_512_or_bit(r, 107, ap_uint_512_get_bit(x, (107-shift)));
	if ((108-shift) >= 0) ap_uint_512_or_bit(r, 108, ap_uint_512_get_bit(x, (108-shift)));
	if ((109-shift) >= 0) ap_uint_512_or_bit(r, 109, ap_uint_512_get_bit(x, (109-shift)));
	if ((110-shift) >= 0) ap_uint_512_or_bit(r, 110, ap_uint_512_get_bit(x, (110-shift)));
	if ((111-shift) >= 0) ap_uint_512_or_bit(r, 111, ap_uint_512_get_bit(x, (111-shift)));
	if ((112-shift) >= 0) ap_uint_512_or_bit(r, 112, ap_uint_512_get_bit(x, (112-shift)));
	if ((113-shift) >= 0) ap_uint_512_or_bit(r, 113, ap_uint_512_get_bit(x, (113-shift)));
	if ((114-shift) >= 0) ap_uint_512_or_bit(r, 114, ap_uint_512_get_bit(x, (114-shift)));
	if ((115-shift) >= 0) ap_uint_512_or_bit(r, 115, ap_uint_512_get_bit(x, (115-shift)));
	if ((116-shift) >= 0) ap_uint_512_or_bit(r, 116, ap_uint_512_get_bit(x, (116-shift)));
	if ((117-shift) >= 0) ap_uint_512_or_bit(r, 117, ap_uint_512_get_bit(x, (117-shift)));
	if ((118-shift) >= 0) ap_uint_512_or_bit(r, 118, ap_uint_512_get_bit(x, (118-shift)));
	if ((119-shift) >= 0) ap_uint_512_or_bit(r, 119, ap_uint_512_get_bit(x, (119-shift)));
	if ((120-shift) >= 0) ap_uint_512_or_bit(r, 120, ap_uint_512_get_bit(x, (120-shift)));
	if ((121-shift) >= 0) ap_uint_512_or_bit(r, 121, ap_uint_512_get_bit(x, (121-shift)));
	if ((122-shift) >= 0) ap_uint_512_or_bit(r, 122, ap_uint_512_get_bit(x, (122-shift)));
	if ((123-shift) >= 0) ap_uint_512_or_bit(r, 123, ap_uint_512_get_bit(x, (123-shift)));
	if ((124-shift) >= 0) ap_uint_512_or_bit(r, 124, ap_uint_512_get_bit(x, (124-shift)));
	if ((125-shift) >= 0) ap_uint_512_or_bit(r, 125, ap_uint_512_get_bit(x, (125-shift)));
	if ((126-shift) >= 0) ap_uint_512_or_bit(r, 126, ap_uint_512_get_bit(x, (126-shift)));
	if ((127-shift) >= 0) ap_uint_512_or_bit(r, 127, ap_uint_512_get_bit(x, (127-shift)));
	if ((128-shift) >= 0) ap_uint_512_or_bit(r, 128, ap_uint_512_get_bit(x, (128-shift)));
	if ((129-shift) >= 0) ap_uint_512_or_bit(r, 129, ap_uint_512_get_bit(x, (129-shift)));
	if ((130-shift) >= 0) ap_uint_512_or_bit(r, 130, ap_uint_512_get_bit(x, (130-shift)));
	if ((131-shift) >= 0) ap_uint_512_or_bit(r, 131, ap_uint_512_get_bit(x, (131-shift)));
	if ((132-shift) >= 0) ap_uint_512_or_bit(r, 132, ap_uint_512_get_bit(x, (132-shift)));
	if ((133-shift) >= 0) ap_uint_512_or_bit(r, 133, ap_uint_512_get_bit(x, (133-shift)));
	if ((134-shift) >= 0) ap_uint_512_or_bit(r, 134, ap_uint_512_get_bit(x, (134-shift)));
	if ((135-shift) >= 0) ap_uint_512_or_bit(r, 135, ap_uint_512_get_bit(x, (135-shift)));
	if ((136-shift) >= 0) ap_uint_512_or_bit(r, 136, ap_uint_512_get_bit(x, (136-shift)));
	if ((137-shift) >= 0) ap_uint_512_or_bit(r, 137, ap_uint_512_get_bit(x, (137-shift)));
	if ((138-shift) >= 0) ap_uint_512_or_bit(r, 138, ap_uint_512_get_bit(x, (138-shift)));
	if ((139-shift) >= 0) ap_uint_512_or_bit(r, 139, ap_uint_512_get_bit(x, (139-shift)));
	if ((140-shift) >= 0) ap_uint_512_or_bit(r, 140, ap_uint_512_get_bit(x, (140-shift)));
	if ((141-shift) >= 0) ap_uint_512_or_bit(r, 141, ap_uint_512_get_bit(x, (141-shift)));
	if ((142-shift) >= 0) ap_uint_512_or_bit(r, 142, ap_uint_512_get_bit(x, (142-shift)));
	if ((143-shift) >= 0) ap_uint_512_or_bit(r, 143, ap_uint_512_get_bit(x, (143-shift)));
	if ((144-shift) >= 0) ap_uint_512_or_bit(r, 144, ap_uint_512_get_bit(x, (144-shift)));
	if ((145-shift) >= 0) ap_uint_512_or_bit(r, 145, ap_uint_512_get_bit(x, (145-shift)));
	if ((146-shift) >= 0) ap_uint_512_or_bit(r, 146, ap_uint_512_get_bit(x, (146-shift)));
	if ((147-shift) >= 0) ap_uint_512_or_bit(r, 147, ap_uint_512_get_bit(x, (147-shift)));
	if ((148-shift) >= 0) ap_uint_512_or_bit(r, 148, ap_uint_512_get_bit(x, (148-shift)));
	if ((149-shift) >= 0) ap_uint_512_or_bit(r, 149, ap_uint_512_get_bit(x, (149-shift)));
	if ((150-shift) >= 0) ap_uint_512_or_bit(r, 150, ap_uint_512_get_bit(x, (150-shift)));
	if ((151-shift) >= 0) ap_uint_512_or_bit(r, 151, ap_uint_512_get_bit(x, (151-shift)));
	if ((152-shift) >= 0) ap_uint_512_or_bit(r, 152, ap_uint_512_get_bit(x, (152-shift)));
	if ((153-shift) >= 0) ap_uint_512_or_bit(r, 153, ap_uint_512_get_bit(x, (153-shift)));
	if ((154-shift) >= 0) ap_uint_512_or_bit(r, 154, ap_uint_512_get_bit(x, (154-shift)));
	if ((155-shift) >= 0) ap_uint_512_or_bit(r, 155, ap_uint_512_get_bit(x, (155-shift)));
	if ((156-shift) >= 0) ap_uint_512_or_bit(r, 156, ap_uint_512_get_bit(x, (156-shift)));
	if ((157-shift) >= 0) ap_uint_512_or_bit(r, 157, ap_uint_512_get_bit(x, (157-shift)));
	if ((158-shift) >= 0) ap_uint_512_or_bit(r, 158, ap_uint_512_get_bit(x, (158-shift)));
	if ((159-shift) >= 0) ap_uint_512_or_bit(r, 159, ap_uint_512_get_bit(x, (159-shift)));
	if ((160-shift) >= 0) ap_uint_512_or_bit(r, 160, ap_uint_512_get_bit(x, (160-shift)));
	if ((161-shift) >= 0) ap_uint_512_or_bit(r, 161, ap_uint_512_get_bit(x, (161-shift)));
	if ((162-shift) >= 0) ap_uint_512_or_bit(r, 162, ap_uint_512_get_bit(x, (162-shift)));
	if ((163-shift) >= 0) ap_uint_512_or_bit(r, 163, ap_uint_512_get_bit(x, (163-shift)));
	if ((164-shift) >= 0) ap_uint_512_or_bit(r, 164, ap_uint_512_get_bit(x, (164-shift)));
	if ((165-shift) >= 0) ap_uint_512_or_bit(r, 165, ap_uint_512_get_bit(x, (165-shift)));
	if ((166-shift) >= 0) ap_uint_512_or_bit(r, 166, ap_uint_512_get_bit(x, (166-shift)));
	if ((167-shift) >= 0) ap_uint_512_or_bit(r, 167, ap_uint_512_get_bit(x, (167-shift)));
	if ((168-shift) >= 0) ap_uint_512_or_bit(r, 168, ap_uint_512_get_bit(x, (168-shift)));
	if ((169-shift) >= 0) ap_uint_512_or_bit(r, 169, ap_uint_512_get_bit(x, (169-shift)));
	if ((170-shift) >= 0) ap_uint_512_or_bit(r, 170, ap_uint_512_get_bit(x, (170-shift)));
	if ((171-shift) >= 0) ap_uint_512_or_bit(r, 171, ap_uint_512_get_bit(x, (171-shift)));
	if ((172-shift) >= 0) ap_uint_512_or_bit(r, 172, ap_uint_512_get_bit(x, (172-shift)));
	if ((173-shift) >= 0) ap_uint_512_or_bit(r, 173, ap_uint_512_get_bit(x, (173-shift)));
	if ((174-shift) >= 0) ap_uint_512_or_bit(r, 174, ap_uint_512_get_bit(x, (174-shift)));
	if ((175-shift) >= 0) ap_uint_512_or_bit(r, 175, ap_uint_512_get_bit(x, (175-shift)));
	if ((176-shift) >= 0) ap_uint_512_or_bit(r, 176, ap_uint_512_get_bit(x, (176-shift)));
	if ((177-shift) >= 0) ap_uint_512_or_bit(r, 177, ap_uint_512_get_bit(x, (177-shift)));
	if ((178-shift) >= 0) ap_uint_512_or_bit(r, 178, ap_uint_512_get_bit(x, (178-shift)));
	if ((179-shift) >= 0) ap_uint_512_or_bit(r, 179, ap_uint_512_get_bit(x, (179-shift)));
	if ((180-shift) >= 0) ap_uint_512_or_bit(r, 180, ap_uint_512_get_bit(x, (180-shift)));
	if ((181-shift) >= 0) ap_uint_512_or_bit(r, 181, ap_uint_512_get_bit(x, (181-shift)));
	if ((182-shift) >= 0) ap_uint_512_or_bit(r, 182, ap_uint_512_get_bit(x, (182-shift)));
	if ((183-shift) >= 0) ap_uint_512_or_bit(r, 183, ap_uint_512_get_bit(x, (183-shift)));
	if ((184-shift) >= 0) ap_uint_512_or_bit(r, 184, ap_uint_512_get_bit(x, (184-shift)));
	if ((185-shift) >= 0) ap_uint_512_or_bit(r, 185, ap_uint_512_get_bit(x, (185-shift)));
	if ((186-shift) >= 0) ap_uint_512_or_bit(r, 186, ap_uint_512_get_bit(x, (186-shift)));
	if ((187-shift) >= 0) ap_uint_512_or_bit(r, 187, ap_uint_512_get_bit(x, (187-shift)));
	if ((188-shift) >= 0) ap_uint_512_or_bit(r, 188, ap_uint_512_get_bit(x, (188-shift)));
	if ((189-shift) >= 0) ap_uint_512_or_bit(r, 189, ap_uint_512_get_bit(x, (189-shift)));
	if ((190-shift) >= 0) ap_uint_512_or_bit(r, 190, ap_uint_512_get_bit(x, (190-shift)));
	if ((191-shift) >= 0) ap_uint_512_or_bit(r, 191, ap_uint_512_get_bit(x, (191-shift)));
	if ((192-shift) >= 0) ap_uint_512_or_bit(r, 192, ap_uint_512_get_bit(x, (192-shift)));
	if ((193-shift) >= 0) ap_uint_512_or_bit(r, 193, ap_uint_512_get_bit(x, (193-shift)));
	if ((194-shift) >= 0) ap_uint_512_or_bit(r, 194, ap_uint_512_get_bit(x, (194-shift)));
	if ((195-shift) >= 0) ap_uint_512_or_bit(r, 195, ap_uint_512_get_bit(x, (195-shift)));
	if ((196-shift) >= 0) ap_uint_512_or_bit(r, 196, ap_uint_512_get_bit(x, (196-shift)));
	if ((197-shift) >= 0) ap_uint_512_or_bit(r, 197, ap_uint_512_get_bit(x, (197-shift)));
	if ((198-shift) >= 0) ap_uint_512_or_bit(r, 198, ap_uint_512_get_bit(x, (198-shift)));
	if ((199-shift) >= 0) ap_uint_512_or_bit(r, 199, ap_uint_512_get_bit(x, (199-shift)));
	if ((200-shift) >= 0) ap_uint_512_or_bit(r, 200, ap_uint_512_get_bit(x, (200-shift)));
	if ((201-shift) >= 0) ap_uint_512_or_bit(r, 201, ap_uint_512_get_bit(x, (201-shift)));
	if ((202-shift) >= 0) ap_uint_512_or_bit(r, 202, ap_uint_512_get_bit(x, (202-shift)));
	if ((203-shift) >= 0) ap_uint_512_or_bit(r, 203, ap_uint_512_get_bit(x, (203-shift)));
	if ((204-shift) >= 0) ap_uint_512_or_bit(r, 204, ap_uint_512_get_bit(x, (204-shift)));
	if ((205-shift) >= 0) ap_uint_512_or_bit(r, 205, ap_uint_512_get_bit(x, (205-shift)));
	if ((206-shift) >= 0) ap_uint_512_or_bit(r, 206, ap_uint_512_get_bit(x, (206-shift)));
	if ((207-shift) >= 0) ap_uint_512_or_bit(r, 207, ap_uint_512_get_bit(x, (207-shift)));
	if ((208-shift) >= 0) ap_uint_512_or_bit(r, 208, ap_uint_512_get_bit(x, (208-shift)));
	if ((209-shift) >= 0) ap_uint_512_or_bit(r, 209, ap_uint_512_get_bit(x, (209-shift)));
	if ((210-shift) >= 0) ap_uint_512_or_bit(r, 210, ap_uint_512_get_bit(x, (210-shift)));
	if ((211-shift) >= 0) ap_uint_512_or_bit(r, 211, ap_uint_512_get_bit(x, (211-shift)));
	if ((212-shift) >= 0) ap_uint_512_or_bit(r, 212, ap_uint_512_get_bit(x, (212-shift)));
	if ((213-shift) >= 0) ap_uint_512_or_bit(r, 213, ap_uint_512_get_bit(x, (213-shift)));
	if ((214-shift) >= 0) ap_uint_512_or_bit(r, 214, ap_uint_512_get_bit(x, (214-shift)));
	if ((215-shift) >= 0) ap_uint_512_or_bit(r, 215, ap_uint_512_get_bit(x, (215-shift)));
	if ((216-shift) >= 0) ap_uint_512_or_bit(r, 216, ap_uint_512_get_bit(x, (216-shift)));
	if ((217-shift) >= 0) ap_uint_512_or_bit(r, 217, ap_uint_512_get_bit(x, (217-shift)));
	if ((218-shift) >= 0) ap_uint_512_or_bit(r, 218, ap_uint_512_get_bit(x, (218-shift)));
	if ((219-shift) >= 0) ap_uint_512_or_bit(r, 219, ap_uint_512_get_bit(x, (219-shift)));
	if ((220-shift) >= 0) ap_uint_512_or_bit(r, 220, ap_uint_512_get_bit(x, (220-shift)));
	if ((221-shift) >= 0) ap_uint_512_or_bit(r, 221, ap_uint_512_get_bit(x, (221-shift)));
	if ((222-shift) >= 0) ap_uint_512_or_bit(r, 222, ap_uint_512_get_bit(x, (222-shift)));
	if ((223-shift) >= 0) ap_uint_512_or_bit(r, 223, ap_uint_512_get_bit(x, (223-shift)));
	if ((224-shift) >= 0) ap_uint_512_or_bit(r, 224, ap_uint_512_get_bit(x, (224-shift)));
	if ((225-shift) >= 0) ap_uint_512_or_bit(r, 225, ap_uint_512_get_bit(x, (225-shift)));
	if ((226-shift) >= 0) ap_uint_512_or_bit(r, 226, ap_uint_512_get_bit(x, (226-shift)));
	if ((227-shift) >= 0) ap_uint_512_or_bit(r, 227, ap_uint_512_get_bit(x, (227-shift)));
	if ((228-shift) >= 0) ap_uint_512_or_bit(r, 228, ap_uint_512_get_bit(x, (228-shift)));
	if ((229-shift) >= 0) ap_uint_512_or_bit(r, 229, ap_uint_512_get_bit(x, (229-shift)));
	if ((230-shift) >= 0) ap_uint_512_or_bit(r, 230, ap_uint_512_get_bit(x, (230-shift)));
	if ((231-shift) >= 0) ap_uint_512_or_bit(r, 231, ap_uint_512_get_bit(x, (231-shift)));
	if ((232-shift) >= 0) ap_uint_512_or_bit(r, 232, ap_uint_512_get_bit(x, (232-shift)));
	if ((233-shift) >= 0) ap_uint_512_or_bit(r, 233, ap_uint_512_get_bit(x, (233-shift)));
	if ((234-shift) >= 0) ap_uint_512_or_bit(r, 234, ap_uint_512_get_bit(x, (234-shift)));
	if ((235-shift) >= 0) ap_uint_512_or_bit(r, 235, ap_uint_512_get_bit(x, (235-shift)));
	if ((236-shift) >= 0) ap_uint_512_or_bit(r, 236, ap_uint_512_get_bit(x, (236-shift)));
	if ((237-shift) >= 0) ap_uint_512_or_bit(r, 237, ap_uint_512_get_bit(x, (237-shift)));
	if ((238-shift) >= 0) ap_uint_512_or_bit(r, 238, ap_uint_512_get_bit(x, (238-shift)));
	if ((239-shift) >= 0) ap_uint_512_or_bit(r, 239, ap_uint_512_get_bit(x, (239-shift)));
	if ((240-shift) >= 0) ap_uint_512_or_bit(r, 240, ap_uint_512_get_bit(x, (240-shift)));
	if ((241-shift) >= 0) ap_uint_512_or_bit(r, 241, ap_uint_512_get_bit(x, (241-shift)));
	if ((242-shift) >= 0) ap_uint_512_or_bit(r, 242, ap_uint_512_get_bit(x, (242-shift)));
	if ((243-shift) >= 0) ap_uint_512_or_bit(r, 243, ap_uint_512_get_bit(x, (243-shift)));
	if ((244-shift) >= 0) ap_uint_512_or_bit(r, 244, ap_uint_512_get_bit(x, (244-shift)));
	if ((245-shift) >= 0) ap_uint_512_or_bit(r, 245, ap_uint_512_get_bit(x, (245-shift)));
	if ((246-shift) >= 0) ap_uint_512_or_bit(r, 246, ap_uint_512_get_bit(x, (246-shift)));
	if ((247-shift) >= 0) ap_uint_512_or_bit(r, 247, ap_uint_512_get_bit(x, (247-shift)));
	if ((248-shift) >= 0) ap_uint_512_or_bit(r, 248, ap_uint_512_get_bit(x, (248-shift)));
	if ((249-shift) >= 0) ap_uint_512_or_bit(r, 249, ap_uint_512_get_bit(x, (249-shift)));
	if ((250-shift) >= 0) ap_uint_512_or_bit(r, 250, ap_uint_512_get_bit(x, (250-shift)));
	if ((251-shift) >= 0) ap_uint_512_or_bit(r, 251, ap_uint_512_get_bit(x, (251-shift)));
	if ((252-shift) >= 0) ap_uint_512_or_bit(r, 252, ap_uint_512_get_bit(x, (252-shift)));
	if ((253-shift) >= 0) ap_uint_512_or_bit(r, 253, ap_uint_512_get_bit(x, (253-shift)));
	if ((254-shift) >= 0) ap_uint_512_or_bit(r, 254, ap_uint_512_get_bit(x, (254-shift)));
	if ((255-shift) >= 0) ap_uint_512_or_bit(r, 255, ap_uint_512_get_bit(x, (255-shift)));
	if ((256-shift) >= 0) ap_uint_512_or_bit(r, 256, ap_uint_512_get_bit(x, (256-shift)));
	if ((257-shift) >= 0) ap_uint_512_or_bit(r, 257, ap_uint_512_get_bit(x, (257-shift)));
	if ((258-shift) >= 0) ap_uint_512_or_bit(r, 258, ap_uint_512_get_bit(x, (258-shift)));
	if ((259-shift) >= 0) ap_uint_512_or_bit(r, 259, ap_uint_512_get_bit(x, (259-shift)));
	if ((260-shift) >= 0) ap_uint_512_or_bit(r, 260, ap_uint_512_get_bit(x, (260-shift)));
	if ((261-shift) >= 0) ap_uint_512_or_bit(r, 261, ap_uint_512_get_bit(x, (261-shift)));
	if ((262-shift) >= 0) ap_uint_512_or_bit(r, 262, ap_uint_512_get_bit(x, (262-shift)));
	if ((263-shift) >= 0) ap_uint_512_or_bit(r, 263, ap_uint_512_get_bit(x, (263-shift)));
	if ((264-shift) >= 0) ap_uint_512_or_bit(r, 264, ap_uint_512_get_bit(x, (264-shift)));
	if ((265-shift) >= 0) ap_uint_512_or_bit(r, 265, ap_uint_512_get_bit(x, (265-shift)));
	if ((266-shift) >= 0) ap_uint_512_or_bit(r, 266, ap_uint_512_get_bit(x, (266-shift)));
	if ((267-shift) >= 0) ap_uint_512_or_bit(r, 267, ap_uint_512_get_bit(x, (267-shift)));
	if ((268-shift) >= 0) ap_uint_512_or_bit(r, 268, ap_uint_512_get_bit(x, (268-shift)));
	if ((269-shift) >= 0) ap_uint_512_or_bit(r, 269, ap_uint_512_get_bit(x, (269-shift)));
	if ((270-shift) >= 0) ap_uint_512_or_bit(r, 270, ap_uint_512_get_bit(x, (270-shift)));
	if ((271-shift) >= 0) ap_uint_512_or_bit(r, 271, ap_uint_512_get_bit(x, (271-shift)));
	if ((272-shift) >= 0) ap_uint_512_or_bit(r, 272, ap_uint_512_get_bit(x, (272-shift)));
	if ((273-shift) >= 0) ap_uint_512_or_bit(r, 273, ap_uint_512_get_bit(x, (273-shift)));
	if ((274-shift) >= 0) ap_uint_512_or_bit(r, 274, ap_uint_512_get_bit(x, (274-shift)));
	if ((275-shift) >= 0) ap_uint_512_or_bit(r, 275, ap_uint_512_get_bit(x, (275-shift)));
	if ((276-shift) >= 0) ap_uint_512_or_bit(r, 276, ap_uint_512_get_bit(x, (276-shift)));
	if ((277-shift) >= 0) ap_uint_512_or_bit(r, 277, ap_uint_512_get_bit(x, (277-shift)));
	if ((278-shift) >= 0) ap_uint_512_or_bit(r, 278, ap_uint_512_get_bit(x, (278-shift)));
	if ((279-shift) >= 0) ap_uint_512_or_bit(r, 279, ap_uint_512_get_bit(x, (279-shift)));
	if ((280-shift) >= 0) ap_uint_512_or_bit(r, 280, ap_uint_512_get_bit(x, (280-shift)));
	if ((281-shift) >= 0) ap_uint_512_or_bit(r, 281, ap_uint_512_get_bit(x, (281-shift)));
	if ((282-shift) >= 0) ap_uint_512_or_bit(r, 282, ap_uint_512_get_bit(x, (282-shift)));
	if ((283-shift) >= 0) ap_uint_512_or_bit(r, 283, ap_uint_512_get_bit(x, (283-shift)));
	if ((284-shift) >= 0) ap_uint_512_or_bit(r, 284, ap_uint_512_get_bit(x, (284-shift)));
	if ((285-shift) >= 0) ap_uint_512_or_bit(r, 285, ap_uint_512_get_bit(x, (285-shift)));
	if ((286-shift) >= 0) ap_uint_512_or_bit(r, 286, ap_uint_512_get_bit(x, (286-shift)));
	if ((287-shift) >= 0) ap_uint_512_or_bit(r, 287, ap_uint_512_get_bit(x, (287-shift)));
	if ((288-shift) >= 0) ap_uint_512_or_bit(r, 288, ap_uint_512_get_bit(x, (288-shift)));
	if ((289-shift) >= 0) ap_uint_512_or_bit(r, 289, ap_uint_512_get_bit(x, (289-shift)));
	if ((290-shift) >= 0) ap_uint_512_or_bit(r, 290, ap_uint_512_get_bit(x, (290-shift)));
	if ((291-shift) >= 0) ap_uint_512_or_bit(r, 291, ap_uint_512_get_bit(x, (291-shift)));
	if ((292-shift) >= 0) ap_uint_512_or_bit(r, 292, ap_uint_512_get_bit(x, (292-shift)));
	if ((293-shift) >= 0) ap_uint_512_or_bit(r, 293, ap_uint_512_get_bit(x, (293-shift)));
	if ((294-shift) >= 0) ap_uint_512_or_bit(r, 294, ap_uint_512_get_bit(x, (294-shift)));
	if ((295-shift) >= 0) ap_uint_512_or_bit(r, 295, ap_uint_512_get_bit(x, (295-shift)));
	if ((296-shift) >= 0) ap_uint_512_or_bit(r, 296, ap_uint_512_get_bit(x, (296-shift)));
	if ((297-shift) >= 0) ap_uint_512_or_bit(r, 297, ap_uint_512_get_bit(x, (297-shift)));
	if ((298-shift) >= 0) ap_uint_512_or_bit(r, 298, ap_uint_512_get_bit(x, (298-shift)));
	if ((299-shift) >= 0) ap_uint_512_or_bit(r, 299, ap_uint_512_get_bit(x, (299-shift)));
	if ((300-shift) >= 0) ap_uint_512_or_bit(r, 300, ap_uint_512_get_bit(x, (300-shift)));
	if ((301-shift) >= 0) ap_uint_512_or_bit(r, 301, ap_uint_512_get_bit(x, (301-shift)));
	if ((302-shift) >= 0) ap_uint_512_or_bit(r, 302, ap_uint_512_get_bit(x, (302-shift)));
	if ((303-shift) >= 0) ap_uint_512_or_bit(r, 303, ap_uint_512_get_bit(x, (303-shift)));
	if ((304-shift) >= 0) ap_uint_512_or_bit(r, 304, ap_uint_512_get_bit(x, (304-shift)));
	if ((305-shift) >= 0) ap_uint_512_or_bit(r, 305, ap_uint_512_get_bit(x, (305-shift)));
	if ((306-shift) >= 0) ap_uint_512_or_bit(r, 306, ap_uint_512_get_bit(x, (306-shift)));
	if ((307-shift) >= 0) ap_uint_512_or_bit(r, 307, ap_uint_512_get_bit(x, (307-shift)));
	if ((308-shift) >= 0) ap_uint_512_or_bit(r, 308, ap_uint_512_get_bit(x, (308-shift)));
	if ((309-shift) >= 0) ap_uint_512_or_bit(r, 309, ap_uint_512_get_bit(x, (309-shift)));
	if ((310-shift) >= 0) ap_uint_512_or_bit(r, 310, ap_uint_512_get_bit(x, (310-shift)));
	if ((311-shift) >= 0) ap_uint_512_or_bit(r, 311, ap_uint_512_get_bit(x, (311-shift)));
	if ((312-shift) >= 0) ap_uint_512_or_bit(r, 312, ap_uint_512_get_bit(x, (312-shift)));
	if ((313-shift) >= 0) ap_uint_512_or_bit(r, 313, ap_uint_512_get_bit(x, (313-shift)));
	if ((314-shift) >= 0) ap_uint_512_or_bit(r, 314, ap_uint_512_get_bit(x, (314-shift)));
	if ((315-shift) >= 0) ap_uint_512_or_bit(r, 315, ap_uint_512_get_bit(x, (315-shift)));
	if ((316-shift) >= 0) ap_uint_512_or_bit(r, 316, ap_uint_512_get_bit(x, (316-shift)));
	if ((317-shift) >= 0) ap_uint_512_or_bit(r, 317, ap_uint_512_get_bit(x, (317-shift)));
	if ((318-shift) >= 0) ap_uint_512_or_bit(r, 318, ap_uint_512_get_bit(x, (318-shift)));
	if ((319-shift) >= 0) ap_uint_512_or_bit(r, 319, ap_uint_512_get_bit(x, (319-shift)));
	if ((320-shift) >= 0) ap_uint_512_or_bit(r, 320, ap_uint_512_get_bit(x, (320-shift)));
	if ((321-shift) >= 0) ap_uint_512_or_bit(r, 321, ap_uint_512_get_bit(x, (321-shift)));
	if ((322-shift) >= 0) ap_uint_512_or_bit(r, 322, ap_uint_512_get_bit(x, (322-shift)));
	if ((323-shift) >= 0) ap_uint_512_or_bit(r, 323, ap_uint_512_get_bit(x, (323-shift)));
	if ((324-shift) >= 0) ap_uint_512_or_bit(r, 324, ap_uint_512_get_bit(x, (324-shift)));
	if ((325-shift) >= 0) ap_uint_512_or_bit(r, 325, ap_uint_512_get_bit(x, (325-shift)));
	if ((326-shift) >= 0) ap_uint_512_or_bit(r, 326, ap_uint_512_get_bit(x, (326-shift)));
	if ((327-shift) >= 0) ap_uint_512_or_bit(r, 327, ap_uint_512_get_bit(x, (327-shift)));
	if ((328-shift) >= 0) ap_uint_512_or_bit(r, 328, ap_uint_512_get_bit(x, (328-shift)));
	if ((329-shift) >= 0) ap_uint_512_or_bit(r, 329, ap_uint_512_get_bit(x, (329-shift)));
	if ((330-shift) >= 0) ap_uint_512_or_bit(r, 330, ap_uint_512_get_bit(x, (330-shift)));
	if ((331-shift) >= 0) ap_uint_512_or_bit(r, 331, ap_uint_512_get_bit(x, (331-shift)));
	if ((332-shift) >= 0) ap_uint_512_or_bit(r, 332, ap_uint_512_get_bit(x, (332-shift)));
	if ((333-shift) >= 0) ap_uint_512_or_bit(r, 333, ap_uint_512_get_bit(x, (333-shift)));
	if ((334-shift) >= 0) ap_uint_512_or_bit(r, 334, ap_uint_512_get_bit(x, (334-shift)));
	if ((335-shift) >= 0) ap_uint_512_or_bit(r, 335, ap_uint_512_get_bit(x, (335-shift)));
	if ((336-shift) >= 0) ap_uint_512_or_bit(r, 336, ap_uint_512_get_bit(x, (336-shift)));
	if ((337-shift) >= 0) ap_uint_512_or_bit(r, 337, ap_uint_512_get_bit(x, (337-shift)));
	if ((338-shift) >= 0) ap_uint_512_or_bit(r, 338, ap_uint_512_get_bit(x, (338-shift)));
	if ((339-shift) >= 0) ap_uint_512_or_bit(r, 339, ap_uint_512_get_bit(x, (339-shift)));
	if ((340-shift) >= 0) ap_uint_512_or_bit(r, 340, ap_uint_512_get_bit(x, (340-shift)));
	if ((341-shift) >= 0) ap_uint_512_or_bit(r, 341, ap_uint_512_get_bit(x, (341-shift)));
	if ((342-shift) >= 0) ap_uint_512_or_bit(r, 342, ap_uint_512_get_bit(x, (342-shift)));
	if ((343-shift) >= 0) ap_uint_512_or_bit(r, 343, ap_uint_512_get_bit(x, (343-shift)));
	if ((344-shift) >= 0) ap_uint_512_or_bit(r, 344, ap_uint_512_get_bit(x, (344-shift)));
	if ((345-shift) >= 0) ap_uint_512_or_bit(r, 345, ap_uint_512_get_bit(x, (345-shift)));
	if ((346-shift) >= 0) ap_uint_512_or_bit(r, 346, ap_uint_512_get_bit(x, (346-shift)));
	if ((347-shift) >= 0) ap_uint_512_or_bit(r, 347, ap_uint_512_get_bit(x, (347-shift)));
	if ((348-shift) >= 0) ap_uint_512_or_bit(r, 348, ap_uint_512_get_bit(x, (348-shift)));
	if ((349-shift) >= 0) ap_uint_512_or_bit(r, 349, ap_uint_512_get_bit(x, (349-shift)));
	if ((350-shift) >= 0) ap_uint_512_or_bit(r, 350, ap_uint_512_get_bit(x, (350-shift)));
	if ((351-shift) >= 0) ap_uint_512_or_bit(r, 351, ap_uint_512_get_bit(x, (351-shift)));
	if ((352-shift) >= 0) ap_uint_512_or_bit(r, 352, ap_uint_512_get_bit(x, (352-shift)));
	if ((353-shift) >= 0) ap_uint_512_or_bit(r, 353, ap_uint_512_get_bit(x, (353-shift)));
	if ((354-shift) >= 0) ap_uint_512_or_bit(r, 354, ap_uint_512_get_bit(x, (354-shift)));
	if ((355-shift) >= 0) ap_uint_512_or_bit(r, 355, ap_uint_512_get_bit(x, (355-shift)));
	if ((356-shift) >= 0) ap_uint_512_or_bit(r, 356, ap_uint_512_get_bit(x, (356-shift)));
	if ((357-shift) >= 0) ap_uint_512_or_bit(r, 357, ap_uint_512_get_bit(x, (357-shift)));
	if ((358-shift) >= 0) ap_uint_512_or_bit(r, 358, ap_uint_512_get_bit(x, (358-shift)));
	if ((359-shift) >= 0) ap_uint_512_or_bit(r, 359, ap_uint_512_get_bit(x, (359-shift)));
	if ((360-shift) >= 0) ap_uint_512_or_bit(r, 360, ap_uint_512_get_bit(x, (360-shift)));
	if ((361-shift) >= 0) ap_uint_512_or_bit(r, 361, ap_uint_512_get_bit(x, (361-shift)));
	if ((362-shift) >= 0) ap_uint_512_or_bit(r, 362, ap_uint_512_get_bit(x, (362-shift)));
	if ((363-shift) >= 0) ap_uint_512_or_bit(r, 363, ap_uint_512_get_bit(x, (363-shift)));
	if ((364-shift) >= 0) ap_uint_512_or_bit(r, 364, ap_uint_512_get_bit(x, (364-shift)));
	if ((365-shift) >= 0) ap_uint_512_or_bit(r, 365, ap_uint_512_get_bit(x, (365-shift)));
	if ((366-shift) >= 0) ap_uint_512_or_bit(r, 366, ap_uint_512_get_bit(x, (366-shift)));
	if ((367-shift) >= 0) ap_uint_512_or_bit(r, 367, ap_uint_512_get_bit(x, (367-shift)));
	if ((368-shift) >= 0) ap_uint_512_or_bit(r, 368, ap_uint_512_get_bit(x, (368-shift)));
	if ((369-shift) >= 0) ap_uint_512_or_bit(r, 369, ap_uint_512_get_bit(x, (369-shift)));
	if ((370-shift) >= 0) ap_uint_512_or_bit(r, 370, ap_uint_512_get_bit(x, (370-shift)));
	if ((371-shift) >= 0) ap_uint_512_or_bit(r, 371, ap_uint_512_get_bit(x, (371-shift)));
	if ((372-shift) >= 0) ap_uint_512_or_bit(r, 372, ap_uint_512_get_bit(x, (372-shift)));
	if ((373-shift) >= 0) ap_uint_512_or_bit(r, 373, ap_uint_512_get_bit(x, (373-shift)));
	if ((374-shift) >= 0) ap_uint_512_or_bit(r, 374, ap_uint_512_get_bit(x, (374-shift)));
	if ((375-shift) >= 0) ap_uint_512_or_bit(r, 375, ap_uint_512_get_bit(x, (375-shift)));
	if ((376-shift) >= 0) ap_uint_512_or_bit(r, 376, ap_uint_512_get_bit(x, (376-shift)));
	if ((377-shift) >= 0) ap_uint_512_or_bit(r, 377, ap_uint_512_get_bit(x, (377-shift)));
	if ((378-shift) >= 0) ap_uint_512_or_bit(r, 378, ap_uint_512_get_bit(x, (378-shift)));
	if ((379-shift) >= 0) ap_uint_512_or_bit(r, 379, ap_uint_512_get_bit(x, (379-shift)));
	if ((380-shift) >= 0) ap_uint_512_or_bit(r, 380, ap_uint_512_get_bit(x, (380-shift)));
	if ((381-shift) >= 0) ap_uint_512_or_bit(r, 381, ap_uint_512_get_bit(x, (381-shift)));
	if ((382-shift) >= 0) ap_uint_512_or_bit(r, 382, ap_uint_512_get_bit(x, (382-shift)));
	if ((383-shift) >= 0) ap_uint_512_or_bit(r, 383, ap_uint_512_get_bit(x, (383-shift)));
	if ((384-shift) >= 0) ap_uint_512_or_bit(r, 384, ap_uint_512_get_bit(x, (384-shift)));
	if ((385-shift) >= 0) ap_uint_512_or_bit(r, 385, ap_uint_512_get_bit(x, (385-shift)));
	if ((386-shift) >= 0) ap_uint_512_or_bit(r, 386, ap_uint_512_get_bit(x, (386-shift)));
	if ((387-shift) >= 0) ap_uint_512_or_bit(r, 387, ap_uint_512_get_bit(x, (387-shift)));
	if ((388-shift) >= 0) ap_uint_512_or_bit(r, 388, ap_uint_512_get_bit(x, (388-shift)));
	if ((389-shift) >= 0) ap_uint_512_or_bit(r, 389, ap_uint_512_get_bit(x, (389-shift)));
	if ((390-shift) >= 0) ap_uint_512_or_bit(r, 390, ap_uint_512_get_bit(x, (390-shift)));
	if ((391-shift) >= 0) ap_uint_512_or_bit(r, 391, ap_uint_512_get_bit(x, (391-shift)));
	if ((392-shift) >= 0) ap_uint_512_or_bit(r, 392, ap_uint_512_get_bit(x, (392-shift)));
	if ((393-shift) >= 0) ap_uint_512_or_bit(r, 393, ap_uint_512_get_bit(x, (393-shift)));
	if ((394-shift) >= 0) ap_uint_512_or_bit(r, 394, ap_uint_512_get_bit(x, (394-shift)));
	if ((395-shift) >= 0) ap_uint_512_or_bit(r, 395, ap_uint_512_get_bit(x, (395-shift)));
	if ((396-shift) >= 0) ap_uint_512_or_bit(r, 396, ap_uint_512_get_bit(x, (396-shift)));
	if ((397-shift) >= 0) ap_uint_512_or_bit(r, 397, ap_uint_512_get_bit(x, (397-shift)));
	if ((398-shift) >= 0) ap_uint_512_or_bit(r, 398, ap_uint_512_get_bit(x, (398-shift)));
	if ((399-shift) >= 0) ap_uint_512_or_bit(r, 399, ap_uint_512_get_bit(x, (399-shift)));
	if ((400-shift) >= 0) ap_uint_512_or_bit(r, 400, ap_uint_512_get_bit(x, (400-shift)));
	if ((401-shift) >= 0) ap_uint_512_or_bit(r, 401, ap_uint_512_get_bit(x, (401-shift)));
	if ((402-shift) >= 0) ap_uint_512_or_bit(r, 402, ap_uint_512_get_bit(x, (402-shift)));
	if ((403-shift) >= 0) ap_uint_512_or_bit(r, 403, ap_uint_512_get_bit(x, (403-shift)));
	if ((404-shift) >= 0) ap_uint_512_or_bit(r, 404, ap_uint_512_get_bit(x, (404-shift)));
	if ((405-shift) >= 0) ap_uint_512_or_bit(r, 405, ap_uint_512_get_bit(x, (405-shift)));
	if ((406-shift) >= 0) ap_uint_512_or_bit(r, 406, ap_uint_512_get_bit(x, (406-shift)));
	if ((407-shift) >= 0) ap_uint_512_or_bit(r, 407, ap_uint_512_get_bit(x, (407-shift)));
	if ((408-shift) >= 0) ap_uint_512_or_bit(r, 408, ap_uint_512_get_bit(x, (408-shift)));
	if ((409-shift) >= 0) ap_uint_512_or_bit(r, 409, ap_uint_512_get_bit(x, (409-shift)));
	if ((410-shift) >= 0) ap_uint_512_or_bit(r, 410, ap_uint_512_get_bit(x, (410-shift)));
	if ((411-shift) >= 0) ap_uint_512_or_bit(r, 411, ap_uint_512_get_bit(x, (411-shift)));
	if ((412-shift) >= 0) ap_uint_512_or_bit(r, 412, ap_uint_512_get_bit(x, (412-shift)));
	if ((413-shift) >= 0) ap_uint_512_or_bit(r, 413, ap_uint_512_get_bit(x, (413-shift)));
	if ((414-shift) >= 0) ap_uint_512_or_bit(r, 414, ap_uint_512_get_bit(x, (414-shift)));
	if ((415-shift) >= 0) ap_uint_512_or_bit(r, 415, ap_uint_512_get_bit(x, (415-shift)));
	if ((416-shift) >= 0) ap_uint_512_or_bit(r, 416, ap_uint_512_get_bit(x, (416-shift)));
	if ((417-shift) >= 0) ap_uint_512_or_bit(r, 417, ap_uint_512_get_bit(x, (417-shift)));
	if ((418-shift) >= 0) ap_uint_512_or_bit(r, 418, ap_uint_512_get_bit(x, (418-shift)));
	if ((419-shift) >= 0) ap_uint_512_or_bit(r, 419, ap_uint_512_get_bit(x, (419-shift)));
	if ((420-shift) >= 0) ap_uint_512_or_bit(r, 420, ap_uint_512_get_bit(x, (420-shift)));
	if ((421-shift) >= 0) ap_uint_512_or_bit(r, 421, ap_uint_512_get_bit(x, (421-shift)));
	if ((422-shift) >= 0) ap_uint_512_or_bit(r, 422, ap_uint_512_get_bit(x, (422-shift)));
	if ((423-shift) >= 0) ap_uint_512_or_bit(r, 423, ap_uint_512_get_bit(x, (423-shift)));
	if ((424-shift) >= 0) ap_uint_512_or_bit(r, 424, ap_uint_512_get_bit(x, (424-shift)));
	if ((425-shift) >= 0) ap_uint_512_or_bit(r, 425, ap_uint_512_get_bit(x, (425-shift)));
	if ((426-shift) >= 0) ap_uint_512_or_bit(r, 426, ap_uint_512_get_bit(x, (426-shift)));
	if ((427-shift) >= 0) ap_uint_512_or_bit(r, 427, ap_uint_512_get_bit(x, (427-shift)));
	if ((428-shift) >= 0) ap_uint_512_or_bit(r, 428, ap_uint_512_get_bit(x, (428-shift)));
	if ((429-shift) >= 0) ap_uint_512_or_bit(r, 429, ap_uint_512_get_bit(x, (429-shift)));
	if ((430-shift) >= 0) ap_uint_512_or_bit(r, 430, ap_uint_512_get_bit(x, (430-shift)));
	if ((431-shift) >= 0) ap_uint_512_or_bit(r, 431, ap_uint_512_get_bit(x, (431-shift)));
	if ((432-shift) >= 0) ap_uint_512_or_bit(r, 432, ap_uint_512_get_bit(x, (432-shift)));
	if ((433-shift) >= 0) ap_uint_512_or_bit(r, 433, ap_uint_512_get_bit(x, (433-shift)));
	if ((434-shift) >= 0) ap_uint_512_or_bit(r, 434, ap_uint_512_get_bit(x, (434-shift)));
	if ((435-shift) >= 0) ap_uint_512_or_bit(r, 435, ap_uint_512_get_bit(x, (435-shift)));
	if ((436-shift) >= 0) ap_uint_512_or_bit(r, 436, ap_uint_512_get_bit(x, (436-shift)));
	if ((437-shift) >= 0) ap_uint_512_or_bit(r, 437, ap_uint_512_get_bit(x, (437-shift)));
	if ((438-shift) >= 0) ap_uint_512_or_bit(r, 438, ap_uint_512_get_bit(x, (438-shift)));
	if ((439-shift) >= 0) ap_uint_512_or_bit(r, 439, ap_uint_512_get_bit(x, (439-shift)));
	if ((440-shift) >= 0) ap_uint_512_or_bit(r, 440, ap_uint_512_get_bit(x, (440-shift)));
	if ((441-shift) >= 0) ap_uint_512_or_bit(r, 441, ap_uint_512_get_bit(x, (441-shift)));
	if ((442-shift) >= 0) ap_uint_512_or_bit(r, 442, ap_uint_512_get_bit(x, (442-shift)));
	if ((443-shift) >= 0) ap_uint_512_or_bit(r, 443, ap_uint_512_get_bit(x, (443-shift)));
	if ((444-shift) >= 0) ap_uint_512_or_bit(r, 444, ap_uint_512_get_bit(x, (444-shift)));
	if ((445-shift) >= 0) ap_uint_512_or_bit(r, 445, ap_uint_512_get_bit(x, (445-shift)));
	if ((446-shift) >= 0) ap_uint_512_or_bit(r, 446, ap_uint_512_get_bit(x, (446-shift)));
	if ((447-shift) >= 0) ap_uint_512_or_bit(r, 447, ap_uint_512_get_bit(x, (447-shift)));
	if ((448-shift) >= 0) ap_uint_512_or_bit(r, 448, ap_uint_512_get_bit(x, (448-shift)));
	if ((449-shift) >= 0) ap_uint_512_or_bit(r, 449, ap_uint_512_get_bit(x, (449-shift)));
	if ((450-shift) >= 0) ap_uint_512_or_bit(r, 450, ap_uint_512_get_bit(x, (450-shift)));
	if ((451-shift) >= 0) ap_uint_512_or_bit(r, 451, ap_uint_512_get_bit(x, (451-shift)));
	if ((452-shift) >= 0) ap_uint_512_or_bit(r, 452, ap_uint_512_get_bit(x, (452-shift)));
	if ((453-shift) >= 0) ap_uint_512_or_bit(r, 453, ap_uint_512_get_bit(x, (453-shift)));
	if ((454-shift) >= 0) ap_uint_512_or_bit(r, 454, ap_uint_512_get_bit(x, (454-shift)));
	if ((455-shift) >= 0) ap_uint_512_or_bit(r, 455, ap_uint_512_get_bit(x, (455-shift)));
	if ((456-shift) >= 0) ap_uint_512_or_bit(r, 456, ap_uint_512_get_bit(x, (456-shift)));
	if ((457-shift) >= 0) ap_uint_512_or_bit(r, 457, ap_uint_512_get_bit(x, (457-shift)));
	if ((458-shift) >= 0) ap_uint_512_or_bit(r, 458, ap_uint_512_get_bit(x, (458-shift)));
	if ((459-shift) >= 0) ap_uint_512_or_bit(r, 459, ap_uint_512_get_bit(x, (459-shift)));
	if ((460-shift) >= 0) ap_uint_512_or_bit(r, 460, ap_uint_512_get_bit(x, (460-shift)));
	if ((461-shift) >= 0) ap_uint_512_or_bit(r, 461, ap_uint_512_get_bit(x, (461-shift)));
	if ((462-shift) >= 0) ap_uint_512_or_bit(r, 462, ap_uint_512_get_bit(x, (462-shift)));
	if ((463-shift) >= 0) ap_uint_512_or_bit(r, 463, ap_uint_512_get_bit(x, (463-shift)));
	if ((464-shift) >= 0) ap_uint_512_or_bit(r, 464, ap_uint_512_get_bit(x, (464-shift)));
	if ((465-shift) >= 0) ap_uint_512_or_bit(r, 465, ap_uint_512_get_bit(x, (465-shift)));
	if ((466-shift) >= 0) ap_uint_512_or_bit(r, 466, ap_uint_512_get_bit(x, (466-shift)));
	if ((467-shift) >= 0) ap_uint_512_or_bit(r, 467, ap_uint_512_get_bit(x, (467-shift)));
	if ((468-shift) >= 0) ap_uint_512_or_bit(r, 468, ap_uint_512_get_bit(x, (468-shift)));
	if ((469-shift) >= 0) ap_uint_512_or_bit(r, 469, ap_uint_512_get_bit(x, (469-shift)));
	if ((470-shift) >= 0) ap_uint_512_or_bit(r, 470, ap_uint_512_get_bit(x, (470-shift)));
	if ((471-shift) >= 0) ap_uint_512_or_bit(r, 471, ap_uint_512_get_bit(x, (471-shift)));
	if ((472-shift) >= 0) ap_uint_512_or_bit(r, 472, ap_uint_512_get_bit(x, (472-shift)));
	if ((473-shift) >= 0) ap_uint_512_or_bit(r, 473, ap_uint_512_get_bit(x, (473-shift)));
	if ((474-shift) >= 0) ap_uint_512_or_bit(r, 474, ap_uint_512_get_bit(x, (474-shift)));
	if ((475-shift) >= 0) ap_uint_512_or_bit(r, 475, ap_uint_512_get_bit(x, (475-shift)));
	if ((476-shift) >= 0) ap_uint_512_or_bit(r, 476, ap_uint_512_get_bit(x, (476-shift)));
	if ((477-shift) >= 0) ap_uint_512_or_bit(r, 477, ap_uint_512_get_bit(x, (477-shift)));
	if ((478-shift) >= 0) ap_uint_512_or_bit(r, 478, ap_uint_512_get_bit(x, (478-shift)));
	if ((479-shift) >= 0) ap_uint_512_or_bit(r, 479, ap_uint_512_get_bit(x, (479-shift)));
	if ((480-shift) >= 0) ap_uint_512_or_bit(r, 480, ap_uint_512_get_bit(x, (480-shift)));
	if ((481-shift) >= 0) ap_uint_512_or_bit(r, 481, ap_uint_512_get_bit(x, (481-shift)));
	if ((482-shift) >= 0) ap_uint_512_or_bit(r, 482, ap_uint_512_get_bit(x, (482-shift)));
	if ((483-shift) >= 0) ap_uint_512_or_bit(r, 483, ap_uint_512_get_bit(x, (483-shift)));
	if ((484-shift) >= 0) ap_uint_512_or_bit(r, 484, ap_uint_512_get_bit(x, (484-shift)));
	if ((485-shift) >= 0) ap_uint_512_or_bit(r, 485, ap_uint_512_get_bit(x, (485-shift)));
	if ((486-shift) >= 0) ap_uint_512_or_bit(r, 486, ap_uint_512_get_bit(x, (486-shift)));
	if ((487-shift) >= 0) ap_uint_512_or_bit(r, 487, ap_uint_512_get_bit(x, (487-shift)));
	if ((488-shift) >= 0) ap_uint_512_or_bit(r, 488, ap_uint_512_get_bit(x, (488-shift)));
	if ((489-shift) >= 0) ap_uint_512_or_bit(r, 489, ap_uint_512_get_bit(x, (489-shift)));
	if ((490-shift) >= 0) ap_uint_512_or_bit(r, 490, ap_uint_512_get_bit(x, (490-shift)));
	if ((491-shift) >= 0) ap_uint_512_or_bit(r, 491, ap_uint_512_get_bit(x, (491-shift)));
	if ((492-shift) >= 0) ap_uint_512_or_bit(r, 492, ap_uint_512_get_bit(x, (492-shift)));
	if ((493-shift) >= 0) ap_uint_512_or_bit(r, 493, ap_uint_512_get_bit(x, (493-shift)));
	if ((494-shift) >= 0) ap_uint_512_or_bit(r, 494, ap_uint_512_get_bit(x, (494-shift)));
	if ((495-shift) >= 0) ap_uint_512_or_bit(r, 495, ap_uint_512_get_bit(x, (495-shift)));
	if ((496-shift) >= 0) ap_uint_512_or_bit(r, 496, ap_uint_512_get_bit(x, (496-shift)));
	if ((497-shift) >= 0) ap_uint_512_or_bit(r, 497, ap_uint_512_get_bit(x, (497-shift)));
	if ((498-shift) >= 0) ap_uint_512_or_bit(r, 498, ap_uint_512_get_bit(x, (498-shift)));
	if ((499-shift) >= 0) ap_uint_512_or_bit(r, 499, ap_uint_512_get_bit(x, (499-shift)));
	if ((500-shift) >= 0) ap_uint_512_or_bit(r, 500, ap_uint_512_get_bit(x, (500-shift)));
	if ((501-shift) >= 0) ap_uint_512_or_bit(r, 501, ap_uint_512_get_bit(x, (501-shift)));
	if ((502-shift) >= 0) ap_uint_512_or_bit(r, 502, ap_uint_512_get_bit(x, (502-shift)));
	if ((503-shift) >= 0) ap_uint_512_or_bit(r, 503, ap_uint_512_get_bit(x, (503-shift)));
	if ((504-shift) >= 0) ap_uint_512_or_bit(r, 504, ap_uint_512_get_bit(x, (504-shift)));
	if ((505-shift) >= 0) ap_uint_512_or_bit(r, 505, ap_uint_512_get_bit(x, (505-shift)));
	if ((506-shift) >= 0) ap_uint_512_or_bit(r, 506, ap_uint_512_get_bit(x, (506-shift)));
	if ((507-shift) >= 0) ap_uint_512_or_bit(r, 507, ap_uint_512_get_bit(x, (507-shift)));
	if ((508-shift) >= 0) ap_uint_512_or_bit(r, 508, ap_uint_512_get_bit(x, (508-shift)));
	if ((509-shift) >= 0) ap_uint_512_or_bit(r, 509, ap_uint_512_get_bit(x, (509-shift)));
	if ((510-shift) >= 0) ap_uint_512_or_bit(r, 510, ap_uint_512_get_bit(x, (510-shift)));
	if ((511-shift) >= 0) ap_uint_512_or_bit(r, 511, ap_uint_512_get_bit(x, (511-shift)));
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


