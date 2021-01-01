

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



void 		ap_uint_512_orLowByteConcurrent(ap_uint_512p v, int index, int value);
int 		ap_uint_512_get_bit(ap_uint_512 x, int bit);
int 		ap_uint_512_get_bit_high(ap_uint_512 x, int bit);
unsigned char 	ap_uint_512_getHighByte(ap_uint_512 v, int index);
unsigned int 	ap_uint_512_getDword(ap_uint_512 v, int index);
unsigned char 	ap_uint_512_getLowByte(ap_uint_512 v, int index);
int 		ap_uint_512_isZero(ap_uint_512 v);
void 		ap_uint_512_or_bit(ap_uint_512p v, int bit, int x);
unsigned int 	ap_uint_512_pop_count(ap_uint_512 x);
unsigned int 	ap_uint_512_range_high_32(ap_uint_512 p, unsigned int offset, unsigned int size);
void 		ap_uint_512_set_bit(ap_uint_512p v, int bit, int x);
void 		ap_uint_512_set_range_high_32(ap_uint_512p p, unsigned int offset, unsigned int size, unsigned int value);
void 		ap_uint_512_setDword(ap_uint_512p v, int wordidx, unsigned int value);
void 		ap_uint_512_setLowByte(ap_uint_512p v, int index, int value);
void 		ap_uint_512_shift_left(ap_uint_512 x, unsigned int shift, ap_uint_512p r);
void 		ap_uint_512_shift_right(ap_uint_512 x, unsigned int shift, ap_uint_512p r);
void 		ap_uint_512_zero(ap_uint_512p v);

int 		ap_uint_1024_get_bit(ap_uint_1024 x, int bit);
unsigned int 	ap_uint_1024_pop_count(ap_uint_1024 x);
unsigned int 	ap_uint_1024_range_high_32(ap_uint_1024 p, unsigned int offset, unsigned int size);
void 		ap_uint_1024_set_range_high_32(ap_uint_1024p p, unsigned int offset, unsigned int size, unsigned int value);
void 		ap_uint_1024_setDword(ap_uint_1024p v, int wordidx, unsigned int value);

#ifdef FPGA_EMULATION

	#define assert(x) assert_function(x, __FILE__, __LINE__)

	void assert_function(int condition, char* file, int line)
	{
	    if (!condition)
		printf("ASSERTION FAILED IN %s %d\n", file, line);
	}

#endif


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

	return 0;
}

int ap_uint_512_get_bit_high(ap_uint_512 x, int bit)
{
	return ap_uint_512_get_bit(x, 512-1-bit);
}


int ap_uint_1024_get_bit(ap_uint_1024 x, int bit)
{

	int wordidx = bit >> 5; // int wordidx = bit / 32;
	int bitidx = bit & 0x1F; // int bitidx = (bit % 32);

	int bit0 = (wordidx >> 0) & 0x1;
	int bit1 = (wordidx >> 1) & 0x1;
	int bit2 = (wordidx >> 2) & 0x1;
	int bit3 = (wordidx >> 3) & 0x1;
	int bit4 = (wordidx >> 4) & 0x1;
	int nbit0 = (~bit0) & 0x1;
	int nbit1 = (~bit1) & 0x1;
	int nbit2 = (~bit2) & 0x1;
	int nbit3 = (~bit3) & 0x1;
	int nbit4 = (~bit4) & 0x1;
	int sel0=nbit0 & nbit1 & nbit2 & nbit3 & nbit4;
	int sel1=bit0 & nbit1 & nbit2 & nbit3 & nbit4;
	int sel2=nbit0 & bit1 & nbit2 & nbit3 & nbit4;
	int sel3=bit0 & bit1 & nbit2 & nbit3 & nbit4;
	int sel4=nbit0 & nbit1 & bit2 & nbit3 & nbit4;
	int sel5=bit0 & nbit1 & bit2 & nbit3 & nbit4;
	int sel6=nbit0 & bit1 & bit2 & nbit3 & nbit4;
	int sel7=bit0 & bit1 & bit2 & nbit3 & nbit4;
	int sel8=nbit0 & nbit1 & nbit2 & bit3 & nbit4;
	int sel9=bit0 & nbit1 & nbit2 & bit3 & nbit4;
	int sel10=nbit0 & bit1 & nbit2 & bit3 & nbit4;
	int sel11=bit0 & bit1 & nbit2 & bit3 & nbit4;
	int sel12=nbit0 & nbit1 & bit2 & bit3 & nbit4;
	int sel13=bit0 & nbit1 & bit2 & bit3 & nbit4;
	int sel14=nbit0 & bit1 & bit2 & bit3 & nbit4;
	int sel15=bit0 & bit1 & bit2 & bit3 & nbit4;
	int sel16=nbit0 & nbit1 & nbit2 & nbit3 & bit4;
	int sel17=bit0 & nbit1 & nbit2 & nbit3 & bit4;
	int sel18=nbit0 & bit1 & nbit2 & nbit3 & bit4;
	int sel19=bit0 & bit1 & nbit2 & nbit3 & bit4;
	int sel20=nbit0 & nbit1 & bit2 & nbit3 & bit4;
	int sel21=bit0 & nbit1 & bit2 & nbit3 & bit4;
	int sel22=nbit0 & bit1 & bit2 & nbit3 & bit4;
	int sel23=bit0 & bit1 & bit2 & nbit3 & bit4;
	int sel24=nbit0 & nbit1 & nbit2 & bit3 & bit4;
	int sel25=bit0 & nbit1 & nbit2 & bit3 & bit4;
	int sel26=nbit0 & bit1 & nbit2 & bit3 & bit4;
	int sel27=bit0 & bit1 & nbit2 & bit3 & bit4;
	int sel28=nbit0 & nbit1 & bit2 & bit3 & bit4;
	int sel29=bit0 & nbit1 & bit2 & bit3 & bit4;
	int sel30=nbit0 & bit1 & bit2 & bit3 & bit4;
	int sel31=bit0 & bit1 & bit2 & bit3 & bit4;


	
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
	if (sel16) { return (x.w16 >> bitidx) & 0x1;}	
	if (sel17) { return (x.w17 >> bitidx) & 0x1;}	
	if (sel18) { return (x.w18 >> bitidx) & 0x1;}	
	if (sel19) { return (x.w19 >> bitidx) & 0x1;}	
	if (sel20) { return (x.w20 >> bitidx) & 0x1;}	
	if (sel21) { return (x.w21 >> bitidx) & 0x1;}	
	if (sel22) { return (x.w22 >> bitidx) & 0x1;}	
	if (sel23) { return (x.w23 >> bitidx) & 0x1;}	
	if (sel24) { return (x.w24 >> bitidx) & 0x1;}	
	if (sel25) { return (x.w25 >> bitidx) & 0x1;}	
	if (sel26) { return (x.w26 >> bitidx) & 0x1;}	
	if (sel27) { return (x.w27 >> bitidx) & 0x1;}	
	if (sel28) { return (x.w28 >> bitidx) & 0x1;}	
	if (sel29) { return (x.w29 >> bitidx) & 0x1;}	
	if (sel30) { return (x.w30 >> bitidx) & 0x1;}	
	if (sel31) { return (x.w31 >> bitidx) & 0x1;}

	return 0;
}


/**
* Sets a byte in a 32bits word of the 512 stream.
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

/**
* Sets a byte in a 32bits word of the 1024 word.
*/
void ap_uint_1024_set_word_byte(ap_uint_1024p v, int wordidx, int byteidx, unsigned int value)
{
	unsigned int mask = (0xFF << (byteidx * 8));
	unsigned int nmask = ~mask;

	int bit0 = (wordidx >> 0) & 0x1;
	int bit1 = (wordidx >> 1) & 0x1;
	int bit2 = (wordidx >> 2) & 0x1;
	int bit3 = (wordidx >> 3) & 0x1;
	int bit4 = (wordidx >> 4) & 0x1;
	int nbit0 = (~bit0) & 0x1;
	int nbit1 = (~bit1) & 0x1;
	int nbit2 = (~bit2) & 0x1;
	int nbit3 = (~bit3) & 0x1;
	int nbit4 = (~bit4) & 0x1;
	int sel0=nbit0 & nbit1 & nbit2 & nbit3 & nbit4;
	int sel1=bit0 & nbit1 & nbit2 & nbit3 & nbit4;
	int sel2=nbit0 & bit1 & nbit2 & nbit3 & nbit4;
	int sel3=bit0 & bit1 & nbit2 & nbit3 & nbit4;
	int sel4=nbit0 & nbit1 & bit2 & nbit3 & nbit4;
	int sel5=bit0 & nbit1 & bit2 & nbit3 & nbit4;
	int sel6=nbit0 & bit1 & bit2 & nbit3 & nbit4;
	int sel7=bit0 & bit1 & bit2 & nbit3 & nbit4;
	int sel8=nbit0 & nbit1 & nbit2 & bit3 & nbit4;
	int sel9=bit0 & nbit1 & nbit2 & bit3 & nbit4;
	int sel10=nbit0 & bit1 & nbit2 & bit3 & nbit4;
	int sel11=bit0 & bit1 & nbit2 & bit3 & nbit4;
	int sel12=nbit0 & nbit1 & bit2 & bit3 & nbit4;
	int sel13=bit0 & nbit1 & bit2 & bit3 & nbit4;
	int sel14=nbit0 & bit1 & bit2 & bit3 & nbit4;
	int sel15=bit0 & bit1 & bit2 & bit3 & nbit4;
	int sel16=nbit0 & nbit1 & nbit2 & nbit3 & bit4;
	int sel17=bit0 & nbit1 & nbit2 & nbit3 & bit4;
	int sel18=nbit0 & bit1 & nbit2 & nbit3 & bit4;
	int sel19=bit0 & bit1 & nbit2 & nbit3 & bit4;
	int sel20=nbit0 & nbit1 & bit2 & nbit3 & bit4;
	int sel21=bit0 & nbit1 & bit2 & nbit3 & bit4;
	int sel22=nbit0 & bit1 & bit2 & nbit3 & bit4;
	int sel23=bit0 & bit1 & bit2 & nbit3 & bit4;
	int sel24=nbit0 & nbit1 & nbit2 & bit3 & bit4;
	int sel25=bit0 & nbit1 & nbit2 & bit3 & bit4;
	int sel26=nbit0 & bit1 & nbit2 & bit3 & bit4;
	int sel27=bit0 & bit1 & nbit2 & bit3 & bit4;
	int sel28=nbit0 & nbit1 & bit2 & bit3 & bit4;
	int sel29=bit0 & nbit1 & bit2 & bit3 & bit4;
	int sel30=nbit0 & bit1 & bit2 & bit3 & bit4;
	int sel31=bit0 & bit1 & bit2 & bit3 & bit4;

	
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
	if (sel16){ v->w16 = (v->w16 & nmask) | (value << (byteidx*8)); }
	if (sel17){ v->w17 = (v->w17 & nmask) | (value << (byteidx*8)); }
	if (sel18){ v->w18 = (v->w18 & nmask) | (value << (byteidx*8)); }
	if (sel19){ v->w19 = (v->w19 & nmask) | (value << (byteidx*8)); }
	if (sel20){ v->w20 = (v->w20 & nmask) | (value << (byteidx*8)); }
	if (sel21){ v->w21 = (v->w21 & nmask) | (value << (byteidx*8)); }
	if (sel22){ v->w22 = (v->w22 & nmask) | (value << (byteidx*8)); }
	if (sel23){ v->w23 = (v->w23 & nmask) | (value << (byteidx*8)); }
	if (sel24){ v->w24 = (v->w24 & nmask) | (value << (byteidx*8)); }
	if (sel25){ v->w25 = (v->w25 & nmask) | (value << (byteidx*8)); }
	if (sel26){ v->w26 = (v->w26 & nmask) | (value << (byteidx*8)); }
	if (sel27){ v->w27 = (v->w27 & nmask) | (value << (byteidx*8)); }
	if (sel28){ v->w28 = (v->w28 & nmask) | (value << (byteidx*8)); }
	if (sel29){ v->w29 = (v->w29 & nmask) | (value << (byteidx*8)); }
	if (sel30){ v->w30 = (v->w30 & nmask) | (value << (byteidx*8)); }
	if (sel31){ v->w31 = (v->w31 & nmask) | (value << (byteidx*8)); }			
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

void ap_uint_1024_or_word_byte(ap_uint_1024p v, int wordidx, int byteidx, unsigned int value)
{
	int bit0 = (wordidx >> 0) & 0x1;
	int bit1 = (wordidx >> 1) & 0x1;
	int bit2 = (wordidx >> 2) & 0x1;
	int bit3 = (wordidx >> 3) & 0x1;
	int bit4 = (wordidx >> 4) & 0x1;
	int nbit0 = (~bit0) & 0x1;
	int nbit1 = (~bit1) & 0x1;
	int nbit2 = (~bit2) & 0x1;
	int nbit3 = (~bit3) & 0x1;
	int nbit4 = (~bit4) & 0x1;
	int sel0=nbit0 & nbit1 & nbit2 & nbit3 & nbit4;
	int sel1=bit0 & nbit1 & nbit2 & nbit3 & nbit4;
	int sel2=nbit0 & bit1 & nbit2 & nbit3 & nbit4;
	int sel3=bit0 & bit1 & nbit2 & nbit3 & nbit4;
	int sel4=nbit0 & nbit1 & bit2 & nbit3 & nbit4;
	int sel5=bit0 & nbit1 & bit2 & nbit3 & nbit4;
	int sel6=nbit0 & bit1 & bit2 & nbit3 & nbit4;
	int sel7=bit0 & bit1 & bit2 & nbit3 & nbit4;
	int sel8=nbit0 & nbit1 & nbit2 & bit3 & nbit4;
	int sel9=bit0 & nbit1 & nbit2 & bit3 & nbit4;
	int sel10=nbit0 & bit1 & nbit2 & bit3 & nbit4;
	int sel11=bit0 & bit1 & nbit2 & bit3 & nbit4;
	int sel12=nbit0 & nbit1 & bit2 & bit3 & nbit4;
	int sel13=bit0 & nbit1 & bit2 & bit3 & nbit4;
	int sel14=nbit0 & bit1 & bit2 & bit3 & nbit4;
	int sel15=bit0 & bit1 & bit2 & bit3 & nbit4;
	int sel16=nbit0 & nbit1 & nbit2 & nbit3 & bit4;
	int sel17=bit0 & nbit1 & nbit2 & nbit3 & bit4;
	int sel18=nbit0 & bit1 & nbit2 & nbit3 & bit4;
	int sel19=bit0 & bit1 & nbit2 & nbit3 & bit4;
	int sel20=nbit0 & nbit1 & bit2 & nbit3 & bit4;
	int sel21=bit0 & nbit1 & bit2 & nbit3 & bit4;
	int sel22=nbit0 & bit1 & bit2 & nbit3 & bit4;
	int sel23=bit0 & bit1 & bit2 & nbit3 & bit4;
	int sel24=nbit0 & nbit1 & nbit2 & bit3 & bit4;
	int sel25=bit0 & nbit1 & nbit2 & bit3 & bit4;
	int sel26=nbit0 & bit1 & nbit2 & bit3 & bit4;
	int sel27=bit0 & bit1 & nbit2 & bit3 & bit4;
	int sel28=nbit0 & nbit1 & bit2 & bit3 & bit4;
	int sel29=bit0 & nbit1 & bit2 & bit3 & bit4;
	int sel30=nbit0 & bit1 & bit2 & bit3 & bit4;
	int sel31=bit0 & bit1 & bit2 & bit3 & bit4;


	
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
	if (sel16){ v->w16 = v->w16  | (value << (byteidx*8)); }
	if (sel17){ v->w17 = v->w17  | (value << (byteidx*8)); }
	if (sel18){ v->w18 = v->w18  | (value << (byteidx*8)); }
	if (sel19){ v->w19 = v->w19  | (value << (byteidx*8)); }
	if (sel20){ v->w20 = v->w20  | (value << (byteidx*8)); }
	if (sel21){ v->w21 = v->w21  | (value << (byteidx*8)); }
	if (sel22){ v->w22 = v->w22  | (value << (byteidx*8)); }
	if (sel23){ v->w23 = v->w23  | (value << (byteidx*8)); }
	if (sel24){ v->w24 = v->w24  | (value << (byteidx*8)); }
	if (sel25){ v->w25 = v->w25  | (value << (byteidx*8)); }
	if (sel26){ v->w26 = v->w26  | (value << (byteidx*8)); }
	if (sel27){ v->w27 = v->w27  | (value << (byteidx*8)); }
	if (sel28){ v->w28 = v->w28  | (value << (byteidx*8)); }
	if (sel29){ v->w29 = v->w29  | (value << (byteidx*8)); }
	if (sel30){ v->w30 = v->w30  | (value << (byteidx*8)); }
	if (sel31){ v->w31 = v->w31  | (value << (byteidx*8)); }	
	
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

void ap_uint_1024_setLowByte(ap_uint_1024p v, int index, int value)
{	
	int wordidx = index >> 2; // int wordidx = (index * 8) / 32;
	int byteidx = index & 0x3; // int byteidx = (index % (32/8));
	
	ap_uint_1024_set_word_byte(v, wordidx, byteidx, value);

}

void ap_uint_512_orLowByteConcurrent(ap_uint_512p v, int index, int value)
{	
	int wordidx = index >> 2; // int wordidx = (index * 8) / 32;
	int byteidx = index & 0x3; // int byteidx = (index % (32/8));
	
	ap_uint_512_or_word_byte(v, wordidx, byteidx, value);
}

void ap_uint_1024_orLowByteConcurrent(ap_uint_1024p v, int index, int value)
{	
	int wordidx = index >> 2; // int wordidx = (index * 8) / 32;
	int byteidx = index & 0x3; // int byteidx = (index % (32/8));
	
	ap_uint_1024_or_word_byte(v, wordidx, byteidx, value);
}

void ap_uint_512_setHighByte(ap_uint_512p v, int index, int value)
{	
	ap_uint_512_setLowByte(v, (512/8) - 1 - index, value);
}

void ap_uint_1024_setHighByte(ap_uint_1024p v, int index, int value)
{	
	ap_uint_1024_setLowByte(v, (1024/8) - 1 - index, value);
}

void ap_uint_512_orHighByteConcurrent(ap_uint_512p v, int index, int value)
{	
	ap_uint_512_orLowByteConcurrent(v, (512/8) - 1 - index, value);
}

void ap_uint_1024_orHighByteConcurrent(ap_uint_1024p v, int index, int value)
{	
	ap_uint_1024_orLowByteConcurrent(v, (1024/8) - 1 - index, value);
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

void ap_uint_512_setDword(ap_uint_512p v, int wordidx, unsigned int value)
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


	
	if (sel0){ v->w0=value;}
	if (sel1){ v->w1=value;}
	if (sel2){ v->w2=value;}
	if (sel3){ v->w3=value;}
	if (sel4){ v->w4=value;}
	if (sel5){ v->w5=value;}
	if (sel6){ v->w6=value;}
	if (sel7){ v->w7=value;}
	if (sel8){ v->w8=value;}
	if (sel9){ v->w9=value;}
	if (sel10){ v->w10=value;}
	if (sel11){ v->w11=value;}
	if (sel12){ v->w12=value;}
	if (sel13){ v->w13=value;}
	if (sel14){ v->w14=value;}
	if (sel15){ v->w15=value;}	
}


void ap_uint_1024_setDword(ap_uint_1024p v, int wordidx, unsigned int value)
{	
	int bit0 = (wordidx >> 0) & 0x1;
	int bit1 = (wordidx >> 1) & 0x1;
	int bit2 = (wordidx >> 2) & 0x1;
	int bit3 = (wordidx >> 3) & 0x1;
	int bit4 = (wordidx >> 4) & 0x1;
	int nbit0 = (~bit0) & 0x1;
	int nbit1 = (~bit1) & 0x1;
	int nbit2 = (~bit2) & 0x1;
	int nbit3 = (~bit3) & 0x1;
	int nbit4 = (~bit4) & 0x1;
	int sel0=nbit0 & nbit1 & nbit2 & nbit3 & nbit4;
	int sel1=bit0 & nbit1 & nbit2 & nbit3 & nbit4;
	int sel2=nbit0 & bit1 & nbit2 & nbit3 & nbit4;
	int sel3=bit0 & bit1 & nbit2 & nbit3 & nbit4;
	int sel4=nbit0 & nbit1 & bit2 & nbit3 & nbit4;
	int sel5=bit0 & nbit1 & bit2 & nbit3 & nbit4;
	int sel6=nbit0 & bit1 & bit2 & nbit3 & nbit4;
	int sel7=bit0 & bit1 & bit2 & nbit3 & nbit4;
	int sel8=nbit0 & nbit1 & nbit2 & bit3 & nbit4;
	int sel9=bit0 & nbit1 & nbit2 & bit3 & nbit4;
	int sel10=nbit0 & bit1 & nbit2 & bit3 & nbit4;
	int sel11=bit0 & bit1 & nbit2 & bit3 & nbit4;
	int sel12=nbit0 & nbit1 & bit2 & bit3 & nbit4;
	int sel13=bit0 & nbit1 & bit2 & bit3 & nbit4;
	int sel14=nbit0 & bit1 & bit2 & bit3 & nbit4;
	int sel15=bit0 & bit1 & bit2 & bit3 & nbit4;
	int sel16=nbit0 & nbit1 & nbit2 & nbit3 & bit4;
	int sel17=bit0 & nbit1 & nbit2 & nbit3 & bit4;
	int sel18=nbit0 & bit1 & nbit2 & nbit3 & bit4;
	int sel19=bit0 & bit1 & nbit2 & nbit3 & bit4;
	int sel20=nbit0 & nbit1 & bit2 & nbit3 & bit4;
	int sel21=bit0 & nbit1 & bit2 & nbit3 & bit4;
	int sel22=nbit0 & bit1 & bit2 & nbit3 & bit4;
	int sel23=bit0 & bit1 & bit2 & nbit3 & bit4;
	int sel24=nbit0 & nbit1 & nbit2 & bit3 & bit4;
	int sel25=bit0 & nbit1 & nbit2 & bit3 & bit4;
	int sel26=nbit0 & bit1 & nbit2 & bit3 & bit4;
	int sel27=bit0 & bit1 & nbit2 & bit3 & bit4;
	int sel28=nbit0 & nbit1 & bit2 & bit3 & bit4;
	int sel29=bit0 & nbit1 & bit2 & bit3 & bit4;
	int sel30=nbit0 & bit1 & bit2 & bit3 & bit4;
	int sel31=bit0 & bit1 & bit2 & bit3 & bit4;


	
	if (sel0){ v->w0=value;}
	if (sel1){ v->w1=value;}
	if (sel2){ v->w2=value;}
	if (sel3){ v->w3=value;}
	if (sel4){ v->w4=value;}
	if (sel5){ v->w5=value;}
	if (sel6){ v->w6=value;}
	if (sel7){ v->w7=value;}
	if (sel8){ v->w8=value;}
	if (sel9){ v->w9=value;}
	if (sel10){ v->w10=value;}
	if (sel11){ v->w11=value;}
	if (sel12){ v->w12=value;}
	if (sel13){ v->w13=value;}
	if (sel14){ v->w14=value;}
	if (sel15){ v->w15=value;}	
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

unsigned int ap_uint_1024_getDword(ap_uint_1024 v, int wordidx)
{	
	int bit0 = (wordidx >> 0) & 0x1;
	int bit1 = (wordidx >> 1) & 0x1;
	int bit2 = (wordidx >> 2) & 0x1;
	int bit3 = (wordidx >> 3) & 0x1;
	int bit4 = (wordidx >> 4) & 0x1;
	int nbit0 = (~bit0) & 0x1;
	int nbit1 = (~bit1) & 0x1;
	int nbit2 = (~bit2) & 0x1;
	int nbit3 = (~bit3) & 0x1;
	int nbit4 = (~bit4) & 0x1;
	int sel0=nbit0 & nbit1 & nbit2 & nbit3 & nbit4;
	int sel1=bit0 & nbit1 & nbit2 & nbit3 & nbit4;
	int sel2=nbit0 & bit1 & nbit2 & nbit3 & nbit4;
	int sel3=bit0 & bit1 & nbit2 & nbit3 & nbit4;
	int sel4=nbit0 & nbit1 & bit2 & nbit3 & nbit4;
	int sel5=bit0 & nbit1 & bit2 & nbit3 & nbit4;
	int sel6=nbit0 & bit1 & bit2 & nbit3 & nbit4;
	int sel7=bit0 & bit1 & bit2 & nbit3 & nbit4;
	int sel8=nbit0 & nbit1 & nbit2 & bit3 & nbit4;
	int sel9=bit0 & nbit1 & nbit2 & bit3 & nbit4;
	int sel10=nbit0 & bit1 & nbit2 & bit3 & nbit4;
	int sel11=bit0 & bit1 & nbit2 & bit3 & nbit4;
	int sel12=nbit0 & nbit1 & bit2 & bit3 & nbit4;
	int sel13=bit0 & nbit1 & bit2 & bit3 & nbit4;
	int sel14=nbit0 & bit1 & bit2 & bit3 & nbit4;
	int sel15=bit0 & bit1 & bit2 & bit3 & nbit4;
	int sel16=nbit0 & nbit1 & nbit2 & nbit3 & bit4;
	int sel17=bit0 & nbit1 & nbit2 & nbit3 & bit4;
	int sel18=nbit0 & bit1 & nbit2 & nbit3 & bit4;
	int sel19=bit0 & bit1 & nbit2 & nbit3 & bit4;
	int sel20=nbit0 & nbit1 & bit2 & nbit3 & bit4;
	int sel21=bit0 & nbit1 & bit2 & nbit3 & bit4;
	int sel22=nbit0 & bit1 & bit2 & nbit3 & bit4;
	int sel23=bit0 & bit1 & bit2 & nbit3 & bit4;
	int sel24=nbit0 & nbit1 & nbit2 & bit3 & bit4;
	int sel25=bit0 & nbit1 & nbit2 & bit3 & bit4;
	int sel26=nbit0 & bit1 & nbit2 & bit3 & bit4;
	int sel27=bit0 & bit1 & nbit2 & bit3 & bit4;
	int sel28=nbit0 & nbit1 & bit2 & bit3 & bit4;
	int sel29=bit0 & nbit1 & bit2 & bit3 & bit4;
	int sel30=nbit0 & bit1 & bit2 & bit3 & bit4;
	int sel31=bit0 & bit1 & bit2 & bit3 & bit4;


	
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
	if (sel16){ return v.w16;}
	if (sel17){ return v.w17;}
	if (sel18){ return v.w18;}
	if (sel19){ return v.w19;}
	if (sel20){ return v.w20;}
	if (sel21){ return v.w21;}
	if (sel22){ return v.w22;}
	if (sel23){ return v.w23;}
	if (sel24){ return v.w24;}
	if (sel25){ return v.w25;}
	if (sel26){ return v.w26;}
	if (sel27){ return v.w27;}
	if (sel28){ return v.w28;}
	if (sel29){ return v.w29;}
	if (sel30){ return v.w30;}
	if (sel31){ return v.w31;}	



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


/**
* Sets a bit in a 1024 bits word
*/
void ap_uint_1024_set_bit(ap_uint_1024p v, int bit, int x)
{
	int wordidx = bit >> 5; // int wordidx = bit / 32;
	int bitidx = bit & 0x1F; // int bitidx = (bit % 32);
	
	int bit0 = (wordidx >> 0) & 0x1;
	int bit1 = (wordidx >> 1) & 0x1;
	int bit2 = (wordidx >> 2) & 0x1;
	int bit3 = (wordidx >> 3) & 0x1;
	int bit4 = (wordidx >> 4) & 0x1;
	int nbit0 = (~bit0) & 0x1;
	int nbit1 = (~bit1) & 0x1;
	int nbit2 = (~bit2) & 0x1;
	int nbit3 = (~bit3) & 0x1;
	int nbit4 = (~bit4) & 0x1;
	int sel0=nbit0 & nbit1 & nbit2 & nbit3 & nbit4;
	int sel1=bit0 & nbit1 & nbit2 & nbit3 & nbit4;
	int sel2=nbit0 & bit1 & nbit2 & nbit3 & nbit4;
	int sel3=bit0 & bit1 & nbit2 & nbit3 & nbit4;
	int sel4=nbit0 & nbit1 & bit2 & nbit3 & nbit4;
	int sel5=bit0 & nbit1 & bit2 & nbit3 & nbit4;
	int sel6=nbit0 & bit1 & bit2 & nbit3 & nbit4;
	int sel7=bit0 & bit1 & bit2 & nbit3 & nbit4;
	int sel8=nbit0 & nbit1 & nbit2 & bit3 & nbit4;
	int sel9=bit0 & nbit1 & nbit2 & bit3 & nbit4;
	int sel10=nbit0 & bit1 & nbit2 & bit3 & nbit4;
	int sel11=bit0 & bit1 & nbit2 & bit3 & nbit4;
	int sel12=nbit0 & nbit1 & bit2 & bit3 & nbit4;
	int sel13=bit0 & nbit1 & bit2 & bit3 & nbit4;
	int sel14=nbit0 & bit1 & bit2 & bit3 & nbit4;
	int sel15=bit0 & bit1 & bit2 & bit3 & nbit4;
	int sel16=nbit0 & nbit1 & nbit2 & nbit3 & bit4;
	int sel17=bit0 & nbit1 & nbit2 & nbit3 & bit4;
	int sel18=nbit0 & bit1 & nbit2 & nbit3 & bit4;
	int sel19=bit0 & bit1 & nbit2 & nbit3 & bit4;
	int sel20=nbit0 & nbit1 & bit2 & nbit3 & bit4;
	int sel21=bit0 & nbit1 & bit2 & nbit3 & bit4;
	int sel22=nbit0 & bit1 & bit2 & nbit3 & bit4;
	int sel23=bit0 & bit1 & bit2 & nbit3 & bit4;
	int sel24=nbit0 & nbit1 & nbit2 & bit3 & bit4;
	int sel25=bit0 & nbit1 & nbit2 & bit3 & bit4;
	int sel26=nbit0 & bit1 & nbit2 & bit3 & bit4;
	int sel27=bit0 & bit1 & nbit2 & bit3 & bit4;
	int sel28=nbit0 & nbit1 & bit2 & bit3 & bit4;
	int sel29=bit0 & nbit1 & bit2 & bit3 & bit4;
	int sel30=nbit0 & bit1 & bit2 & bit3 & bit4;
	int sel31=bit0 & bit1 & bit2 & bit3 & bit4;


	
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
	if (sel16) if (x) v->w16 |= (1 << bitidx); else v->w16 &= (~(1 << bitidx));	
	if (sel17) if (x) v->w17 |= (1 << bitidx); else v->w17 &= (~(1 << bitidx));	
	if (sel18) if (x) v->w18 |= (1 << bitidx); else v->w18 &= (~(1 << bitidx));	
	if (sel19) if (x) v->w19 |= (1 << bitidx); else v->w19 &= (~(1 << bitidx));	
	if (sel20) if (x) v->w20 |= (1 << bitidx); else v->w20 &= (~(1 << bitidx));	
	if (sel21) if (x) v->w21 |= (1 << bitidx); else v->w21 &= (~(1 << bitidx));	
	if (sel22) if (x) v->w22 |= (1 << bitidx); else v->w22 &= (~(1 << bitidx));	
	if (sel23) if (x) v->w23 |= (1 << bitidx); else v->w23 &= (~(1 << bitidx));	
	if (sel24) if (x) v->w24 |= (1 << bitidx); else v->w24 &= (~(1 << bitidx));	
	if (sel25) if (x) v->w25 |= (1 << bitidx); else v->w25 &= (~(1 << bitidx));	
	if (sel26) if (x) v->w26 |= (1 << bitidx); else v->w26 &= (~(1 << bitidx));	
	if (sel27) if (x) v->w27 |= (1 << bitidx); else v->w27 &= (~(1 << bitidx));	
	if (sel28) if (x) v->w28 |= (1 << bitidx); else v->w28 &= (~(1 << bitidx));	
	if (sel29) if (x) v->w29 |= (1 << bitidx); else v->w29 &= (~(1 << bitidx));	
	if (sel30) if (x) v->w30 |= (1 << bitidx); else v->w30 &= (~(1 << bitidx));	
	if (sel31) if (x) v->w31 |= (1 << bitidx); else v->w31 &= (~(1 << bitidx));

}

void ap_uint_512_or_high_bit(ap_uint_512p v, int bit, int x)
{	
	ap_uint_512_or_bit(v, 512 - 1 - bit, x);
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

	int bit0 = (wordidx >> 0) & 0x1;
	int bit1 = (wordidx >> 1) & 0x1;
	int bit2 = (wordidx >> 2) & 0x1;
	int bit3 = (wordidx >> 3) & 0x1;
	int bit4 = (wordidx >> 4) & 0x1;
	int nbit0 = (~bit0) & 0x1;
	int nbit1 = (~bit1) & 0x1;
	int nbit2 = (~bit2) & 0x1;
	int nbit3 = (~bit3) & 0x1;
	int nbit4 = (~bit4) & 0x1;
	int sel0=nbit0 & nbit1 & nbit2 & nbit3 & nbit4;
	int sel1=bit0 & nbit1 & nbit2 & nbit3 & nbit4;
	int sel2=nbit0 & bit1 & nbit2 & nbit3 & nbit4;
	int sel3=bit0 & bit1 & nbit2 & nbit3 & nbit4;
	int sel4=nbit0 & nbit1 & bit2 & nbit3 & nbit4;
	int sel5=bit0 & nbit1 & bit2 & nbit3 & nbit4;
	int sel6=nbit0 & bit1 & bit2 & nbit3 & nbit4;
	int sel7=bit0 & bit1 & bit2 & nbit3 & nbit4;
	int sel8=nbit0 & nbit1 & nbit2 & bit3 & nbit4;
	int sel9=bit0 & nbit1 & nbit2 & bit3 & nbit4;
	int sel10=nbit0 & bit1 & nbit2 & bit3 & nbit4;
	int sel11=bit0 & bit1 & nbit2 & bit3 & nbit4;
	int sel12=nbit0 & nbit1 & bit2 & bit3 & nbit4;
	int sel13=bit0 & nbit1 & bit2 & bit3 & nbit4;
	int sel14=nbit0 & bit1 & bit2 & bit3 & nbit4;
	int sel15=bit0 & bit1 & bit2 & bit3 & nbit4;
	int sel16=nbit0 & nbit1 & nbit2 & nbit3 & bit4;
	int sel17=bit0 & nbit1 & nbit2 & nbit3 & bit4;
	int sel18=nbit0 & bit1 & nbit2 & nbit3 & bit4;
	int sel19=bit0 & bit1 & nbit2 & nbit3 & bit4;
	int sel20=nbit0 & nbit1 & bit2 & nbit3 & bit4;
	int sel21=bit0 & nbit1 & bit2 & nbit3 & bit4;
	int sel22=nbit0 & bit1 & bit2 & nbit3 & bit4;
	int sel23=bit0 & bit1 & bit2 & nbit3 & bit4;
	int sel24=nbit0 & nbit1 & nbit2 & bit3 & bit4;
	int sel25=bit0 & nbit1 & nbit2 & bit3 & bit4;
	int sel26=nbit0 & bit1 & nbit2 & bit3 & bit4;
	int sel27=bit0 & bit1 & nbit2 & bit3 & bit4;
	int sel28=nbit0 & nbit1 & bit2 & bit3 & bit4;
	int sel29=bit0 & nbit1 & bit2 & bit3 & bit4;
	int sel30=nbit0 & bit1 & bit2 & bit3 & bit4;
	int sel31=bit0 & bit1 & bit2 & bit3 & bit4;


	
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
	if (sel16){ v->w16 |= (x) ? (1 << bitidx) : 0; }	
	if (sel17){ v->w17 |= (x) ? (1 << bitidx) : 0; }	
	if (sel18){ v->w18 |= (x) ? (1 << bitidx) : 0; }	
	if (sel19){ v->w19 |= (x) ? (1 << bitidx) : 0; }	
	if (sel20){ v->w20 |= (x) ? (1 << bitidx) : 0; }	
	if (sel21){ v->w21 |= (x) ? (1 << bitidx) : 0; }	
	if (sel22){ v->w22 |= (x) ? (1 << bitidx) : 0; }	
	if (sel23){ v->w23 |= (x) ? (1 << bitidx) : 0; }	
	if (sel24){ v->w24 |= (x) ? (1 << bitidx) : 0; }	
	if (sel25){ v->w25 |= (x) ? (1 << bitidx) : 0; }	
	if (sel26){ v->w26 |= (x) ? (1 << bitidx) : 0; }	
	if (sel27){ v->w27 |= (x) ? (1 << bitidx) : 0; }	
	if (sel28){ v->w28 |= (x) ? (1 << bitidx) : 0; }	
	if (sel29){ v->w29 |= (x) ? (1 << bitidx) : 0; }	
	if (sel30){ v->w30 |= (x) ? (1 << bitidx) : 0; }	
	if (sel31){ v->w31 |= (x) ? (1 << bitidx) : 0; }
	
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

void ap_uint_1024_onesHigh(ap_uint_1024p v, int n)
{
	ap_uint_1024_zero(v);

	
	ap_uint_1024_or_bit(v, 1024-1-0, (0<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-1, (1<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-2, (2<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-3, (3<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-4, (4<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-5, (5<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-6, (6<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-7, (7<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-8, (8<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-9, (9<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-10, (10<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-11, (11<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-12, (12<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-13, (13<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-14, (14<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-15, (15<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-16, (16<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-17, (17<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-18, (18<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-19, (19<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-20, (20<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-21, (21<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-22, (22<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-23, (23<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-24, (24<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-25, (25<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-26, (26<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-27, (27<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-28, (28<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-29, (29<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-30, (30<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-31, (31<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-32, (32<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-33, (33<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-34, (34<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-35, (35<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-36, (36<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-37, (37<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-38, (38<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-39, (39<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-40, (40<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-41, (41<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-42, (42<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-43, (43<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-44, (44<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-45, (45<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-46, (46<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-47, (47<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-48, (48<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-49, (49<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-50, (50<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-51, (51<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-52, (52<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-53, (53<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-54, (54<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-55, (55<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-56, (56<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-57, (57<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-58, (58<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-59, (59<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-60, (60<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-61, (61<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-62, (62<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-63, (63<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-64, (64<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-65, (65<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-66, (66<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-67, (67<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-68, (68<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-69, (69<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-70, (70<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-71, (71<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-72, (72<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-73, (73<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-74, (74<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-75, (75<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-76, (76<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-77, (77<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-78, (78<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-79, (79<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-80, (80<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-81, (81<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-82, (82<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-83, (83<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-84, (84<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-85, (85<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-86, (86<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-87, (87<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-88, (88<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-89, (89<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-90, (90<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-91, (91<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-92, (92<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-93, (93<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-94, (94<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-95, (95<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-96, (96<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-97, (97<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-98, (98<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-99, (99<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-100, (100<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-101, (101<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-102, (102<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-103, (103<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-104, (104<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-105, (105<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-106, (106<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-107, (107<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-108, (108<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-109, (109<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-110, (110<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-111, (111<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-112, (112<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-113, (113<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-114, (114<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-115, (115<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-116, (116<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-117, (117<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-118, (118<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-119, (119<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-120, (120<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-121, (121<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-122, (122<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-123, (123<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-124, (124<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-125, (125<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-126, (126<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-127, (127<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-128, (128<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-129, (129<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-130, (130<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-131, (131<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-132, (132<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-133, (133<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-134, (134<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-135, (135<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-136, (136<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-137, (137<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-138, (138<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-139, (139<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-140, (140<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-141, (141<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-142, (142<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-143, (143<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-144, (144<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-145, (145<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-146, (146<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-147, (147<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-148, (148<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-149, (149<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-150, (150<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-151, (151<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-152, (152<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-153, (153<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-154, (154<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-155, (155<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-156, (156<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-157, (157<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-158, (158<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-159, (159<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-160, (160<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-161, (161<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-162, (162<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-163, (163<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-164, (164<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-165, (165<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-166, (166<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-167, (167<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-168, (168<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-169, (169<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-170, (170<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-171, (171<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-172, (172<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-173, (173<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-174, (174<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-175, (175<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-176, (176<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-177, (177<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-178, (178<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-179, (179<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-180, (180<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-181, (181<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-182, (182<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-183, (183<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-184, (184<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-185, (185<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-186, (186<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-187, (187<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-188, (188<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-189, (189<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-190, (190<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-191, (191<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-192, (192<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-193, (193<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-194, (194<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-195, (195<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-196, (196<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-197, (197<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-198, (198<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-199, (199<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-200, (200<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-201, (201<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-202, (202<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-203, (203<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-204, (204<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-205, (205<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-206, (206<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-207, (207<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-208, (208<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-209, (209<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-210, (210<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-211, (211<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-212, (212<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-213, (213<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-214, (214<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-215, (215<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-216, (216<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-217, (217<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-218, (218<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-219, (219<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-220, (220<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-221, (221<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-222, (222<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-223, (223<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-224, (224<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-225, (225<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-226, (226<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-227, (227<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-228, (228<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-229, (229<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-230, (230<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-231, (231<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-232, (232<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-233, (233<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-234, (234<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-235, (235<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-236, (236<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-237, (237<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-238, (238<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-239, (239<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-240, (240<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-241, (241<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-242, (242<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-243, (243<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-244, (244<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-245, (245<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-246, (246<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-247, (247<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-248, (248<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-249, (249<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-250, (250<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-251, (251<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-252, (252<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-253, (253<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-254, (254<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-255, (255<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-256, (256<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-257, (257<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-258, (258<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-259, (259<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-260, (260<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-261, (261<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-262, (262<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-263, (263<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-264, (264<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-265, (265<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-266, (266<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-267, (267<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-268, (268<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-269, (269<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-270, (270<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-271, (271<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-272, (272<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-273, (273<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-274, (274<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-275, (275<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-276, (276<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-277, (277<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-278, (278<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-279, (279<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-280, (280<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-281, (281<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-282, (282<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-283, (283<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-284, (284<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-285, (285<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-286, (286<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-287, (287<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-288, (288<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-289, (289<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-290, (290<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-291, (291<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-292, (292<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-293, (293<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-294, (294<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-295, (295<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-296, (296<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-297, (297<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-298, (298<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-299, (299<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-300, (300<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-301, (301<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-302, (302<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-303, (303<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-304, (304<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-305, (305<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-306, (306<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-307, (307<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-308, (308<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-309, (309<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-310, (310<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-311, (311<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-312, (312<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-313, (313<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-314, (314<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-315, (315<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-316, (316<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-317, (317<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-318, (318<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-319, (319<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-320, (320<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-321, (321<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-322, (322<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-323, (323<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-324, (324<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-325, (325<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-326, (326<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-327, (327<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-328, (328<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-329, (329<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-330, (330<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-331, (331<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-332, (332<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-333, (333<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-334, (334<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-335, (335<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-336, (336<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-337, (337<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-338, (338<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-339, (339<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-340, (340<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-341, (341<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-342, (342<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-343, (343<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-344, (344<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-345, (345<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-346, (346<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-347, (347<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-348, (348<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-349, (349<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-350, (350<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-351, (351<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-352, (352<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-353, (353<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-354, (354<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-355, (355<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-356, (356<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-357, (357<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-358, (358<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-359, (359<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-360, (360<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-361, (361<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-362, (362<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-363, (363<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-364, (364<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-365, (365<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-366, (366<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-367, (367<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-368, (368<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-369, (369<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-370, (370<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-371, (371<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-372, (372<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-373, (373<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-374, (374<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-375, (375<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-376, (376<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-377, (377<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-378, (378<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-379, (379<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-380, (380<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-381, (381<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-382, (382<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-383, (383<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-384, (384<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-385, (385<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-386, (386<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-387, (387<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-388, (388<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-389, (389<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-390, (390<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-391, (391<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-392, (392<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-393, (393<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-394, (394<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-395, (395<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-396, (396<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-397, (397<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-398, (398<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-399, (399<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-400, (400<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-401, (401<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-402, (402<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-403, (403<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-404, (404<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-405, (405<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-406, (406<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-407, (407<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-408, (408<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-409, (409<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-410, (410<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-411, (411<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-412, (412<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-413, (413<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-414, (414<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-415, (415<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-416, (416<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-417, (417<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-418, (418<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-419, (419<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-420, (420<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-421, (421<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-422, (422<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-423, (423<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-424, (424<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-425, (425<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-426, (426<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-427, (427<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-428, (428<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-429, (429<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-430, (430<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-431, (431<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-432, (432<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-433, (433<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-434, (434<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-435, (435<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-436, (436<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-437, (437<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-438, (438<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-439, (439<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-440, (440<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-441, (441<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-442, (442<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-443, (443<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-444, (444<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-445, (445<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-446, (446<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-447, (447<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-448, (448<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-449, (449<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-450, (450<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-451, (451<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-452, (452<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-453, (453<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-454, (454<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-455, (455<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-456, (456<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-457, (457<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-458, (458<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-459, (459<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-460, (460<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-461, (461<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-462, (462<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-463, (463<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-464, (464<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-465, (465<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-466, (466<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-467, (467<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-468, (468<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-469, (469<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-470, (470<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-471, (471<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-472, (472<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-473, (473<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-474, (474<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-475, (475<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-476, (476<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-477, (477<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-478, (478<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-479, (479<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-480, (480<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-481, (481<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-482, (482<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-483, (483<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-484, (484<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-485, (485<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-486, (486<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-487, (487<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-488, (488<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-489, (489<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-490, (490<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-491, (491<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-492, (492<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-493, (493<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-494, (494<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-495, (495<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-496, (496<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-497, (497<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-498, (498<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-499, (499<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-500, (500<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-501, (501<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-502, (502<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-503, (503<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-504, (504<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-505, (505<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-506, (506<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-507, (507<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-508, (508<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-509, (509<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-510, (510<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-511, (511<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-512, (512<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-513, (513<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-514, (514<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-515, (515<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-516, (516<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-517, (517<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-518, (518<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-519, (519<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-520, (520<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-521, (521<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-522, (522<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-523, (523<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-524, (524<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-525, (525<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-526, (526<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-527, (527<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-528, (528<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-529, (529<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-530, (530<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-531, (531<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-532, (532<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-533, (533<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-534, (534<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-535, (535<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-536, (536<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-537, (537<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-538, (538<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-539, (539<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-540, (540<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-541, (541<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-542, (542<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-543, (543<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-544, (544<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-545, (545<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-546, (546<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-547, (547<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-548, (548<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-549, (549<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-550, (550<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-551, (551<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-552, (552<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-553, (553<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-554, (554<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-555, (555<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-556, (556<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-557, (557<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-558, (558<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-559, (559<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-560, (560<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-561, (561<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-562, (562<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-563, (563<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-564, (564<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-565, (565<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-566, (566<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-567, (567<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-568, (568<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-569, (569<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-570, (570<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-571, (571<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-572, (572<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-573, (573<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-574, (574<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-575, (575<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-576, (576<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-577, (577<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-578, (578<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-579, (579<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-580, (580<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-581, (581<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-582, (582<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-583, (583<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-584, (584<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-585, (585<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-586, (586<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-587, (587<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-588, (588<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-589, (589<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-590, (590<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-591, (591<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-592, (592<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-593, (593<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-594, (594<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-595, (595<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-596, (596<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-597, (597<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-598, (598<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-599, (599<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-600, (600<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-601, (601<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-602, (602<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-603, (603<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-604, (604<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-605, (605<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-606, (606<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-607, (607<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-608, (608<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-609, (609<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-610, (610<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-611, (611<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-612, (612<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-613, (613<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-614, (614<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-615, (615<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-616, (616<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-617, (617<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-618, (618<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-619, (619<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-620, (620<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-621, (621<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-622, (622<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-623, (623<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-624, (624<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-625, (625<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-626, (626<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-627, (627<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-628, (628<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-629, (629<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-630, (630<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-631, (631<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-632, (632<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-633, (633<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-634, (634<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-635, (635<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-636, (636<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-637, (637<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-638, (638<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-639, (639<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-640, (640<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-641, (641<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-642, (642<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-643, (643<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-644, (644<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-645, (645<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-646, (646<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-647, (647<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-648, (648<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-649, (649<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-650, (650<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-651, (651<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-652, (652<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-653, (653<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-654, (654<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-655, (655<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-656, (656<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-657, (657<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-658, (658<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-659, (659<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-660, (660<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-661, (661<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-662, (662<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-663, (663<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-664, (664<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-665, (665<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-666, (666<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-667, (667<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-668, (668<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-669, (669<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-670, (670<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-671, (671<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-672, (672<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-673, (673<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-674, (674<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-675, (675<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-676, (676<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-677, (677<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-678, (678<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-679, (679<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-680, (680<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-681, (681<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-682, (682<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-683, (683<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-684, (684<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-685, (685<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-686, (686<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-687, (687<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-688, (688<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-689, (689<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-690, (690<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-691, (691<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-692, (692<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-693, (693<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-694, (694<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-695, (695<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-696, (696<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-697, (697<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-698, (698<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-699, (699<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-700, (700<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-701, (701<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-702, (702<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-703, (703<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-704, (704<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-705, (705<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-706, (706<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-707, (707<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-708, (708<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-709, (709<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-710, (710<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-711, (711<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-712, (712<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-713, (713<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-714, (714<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-715, (715<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-716, (716<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-717, (717<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-718, (718<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-719, (719<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-720, (720<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-721, (721<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-722, (722<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-723, (723<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-724, (724<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-725, (725<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-726, (726<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-727, (727<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-728, (728<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-729, (729<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-730, (730<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-731, (731<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-732, (732<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-733, (733<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-734, (734<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-735, (735<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-736, (736<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-737, (737<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-738, (738<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-739, (739<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-740, (740<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-741, (741<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-742, (742<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-743, (743<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-744, (744<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-745, (745<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-746, (746<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-747, (747<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-748, (748<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-749, (749<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-750, (750<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-751, (751<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-752, (752<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-753, (753<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-754, (754<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-755, (755<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-756, (756<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-757, (757<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-758, (758<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-759, (759<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-760, (760<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-761, (761<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-762, (762<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-763, (763<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-764, (764<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-765, (765<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-766, (766<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-767, (767<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-768, (768<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-769, (769<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-770, (770<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-771, (771<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-772, (772<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-773, (773<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-774, (774<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-775, (775<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-776, (776<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-777, (777<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-778, (778<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-779, (779<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-780, (780<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-781, (781<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-782, (782<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-783, (783<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-784, (784<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-785, (785<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-786, (786<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-787, (787<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-788, (788<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-789, (789<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-790, (790<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-791, (791<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-792, (792<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-793, (793<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-794, (794<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-795, (795<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-796, (796<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-797, (797<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-798, (798<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-799, (799<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-800, (800<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-801, (801<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-802, (802<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-803, (803<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-804, (804<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-805, (805<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-806, (806<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-807, (807<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-808, (808<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-809, (809<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-810, (810<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-811, (811<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-812, (812<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-813, (813<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-814, (814<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-815, (815<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-816, (816<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-817, (817<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-818, (818<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-819, (819<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-820, (820<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-821, (821<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-822, (822<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-823, (823<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-824, (824<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-825, (825<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-826, (826<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-827, (827<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-828, (828<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-829, (829<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-830, (830<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-831, (831<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-832, (832<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-833, (833<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-834, (834<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-835, (835<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-836, (836<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-837, (837<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-838, (838<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-839, (839<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-840, (840<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-841, (841<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-842, (842<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-843, (843<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-844, (844<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-845, (845<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-846, (846<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-847, (847<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-848, (848<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-849, (849<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-850, (850<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-851, (851<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-852, (852<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-853, (853<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-854, (854<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-855, (855<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-856, (856<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-857, (857<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-858, (858<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-859, (859<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-860, (860<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-861, (861<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-862, (862<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-863, (863<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-864, (864<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-865, (865<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-866, (866<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-867, (867<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-868, (868<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-869, (869<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-870, (870<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-871, (871<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-872, (872<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-873, (873<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-874, (874<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-875, (875<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-876, (876<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-877, (877<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-878, (878<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-879, (879<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-880, (880<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-881, (881<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-882, (882<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-883, (883<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-884, (884<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-885, (885<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-886, (886<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-887, (887<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-888, (888<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-889, (889<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-890, (890<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-891, (891<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-892, (892<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-893, (893<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-894, (894<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-895, (895<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-896, (896<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-897, (897<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-898, (898<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-899, (899<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-900, (900<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-901, (901<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-902, (902<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-903, (903<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-904, (904<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-905, (905<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-906, (906<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-907, (907<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-908, (908<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-909, (909<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-910, (910<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-911, (911<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-912, (912<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-913, (913<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-914, (914<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-915, (915<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-916, (916<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-917, (917<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-918, (918<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-919, (919<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-920, (920<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-921, (921<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-922, (922<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-923, (923<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-924, (924<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-925, (925<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-926, (926<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-927, (927<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-928, (928<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-929, (929<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-930, (930<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-931, (931<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-932, (932<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-933, (933<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-934, (934<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-935, (935<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-936, (936<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-937, (937<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-938, (938<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-939, (939<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-940, (940<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-941, (941<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-942, (942<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-943, (943<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-944, (944<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-945, (945<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-946, (946<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-947, (947<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-948, (948<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-949, (949<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-950, (950<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-951, (951<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-952, (952<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-953, (953<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-954, (954<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-955, (955<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-956, (956<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-957, (957<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-958, (958<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-959, (959<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-960, (960<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-961, (961<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-962, (962<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-963, (963<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-964, (964<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-965, (965<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-966, (966<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-967, (967<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-968, (968<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-969, (969<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-970, (970<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-971, (971<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-972, (972<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-973, (973<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-974, (974<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-975, (975<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-976, (976<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-977, (977<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-978, (978<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-979, (979<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-980, (980<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-981, (981<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-982, (982<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-983, (983<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-984, (984<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-985, (985<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-986, (986<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-987, (987<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-988, (988<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-989, (989<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-990, (990<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-991, (991<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-992, (992<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-993, (993<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-994, (994<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-995, (995<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-996, (996<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-997, (997<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-998, (998<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-999, (999<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-1000, (1000<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-1001, (1001<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-1002, (1002<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-1003, (1003<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-1004, (1004<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-1005, (1005<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-1006, (1006<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-1007, (1007<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-1008, (1008<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-1009, (1009<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-1010, (1010<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-1011, (1011<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-1012, (1012<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-1013, (1013<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-1014, (1014<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-1015, (1015<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-1016, (1016<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-1017, (1017<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-1018, (1018<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-1019, (1019<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-1020, (1020<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-1021, (1021<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-1022, (1022<n)?1:0);
	ap_uint_1024_or_bit(v, 1024-1-1023, (1023<n)?1:0);
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

void ap_uint_1024_and_self(ap_uint_1024p a, ap_uint_1024 b)
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
	a->w16 &= b.w16;
	a->w17 &= b.w17;
	a->w18 &= b.w18;
	a->w19 &= b.w19;
	a->w20 &= b.w20;
	a->w21 &= b.w21;
	a->w22 &= b.w22;
	a->w23 &= b.w23;
	a->w24 &= b.w24;
	a->w25 &= b.w25;
	a->w26 &= b.w26;
	a->w27 &= b.w27;
	a->w28 &= b.w28;
	a->w29 &= b.w29;
	a->w30 &= b.w30;
	a->w31 &= b.w31;
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

unsigned int ap_uint_1024_pop_count(ap_uint_1024 x)
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
	p += uint32_popCount(x.w16);
	p += uint32_popCount(x.w17);
	p += uint32_popCount(x.w18);
	p += uint32_popCount(x.w19);
	p += uint32_popCount(x.w20);
	p += uint32_popCount(x.w21);
	p += uint32_popCount(x.w22);
	p += uint32_popCount(x.w23);
	p += uint32_popCount(x.w24);
	p += uint32_popCount(x.w25);
	p += uint32_popCount(x.w26);
	p += uint32_popCount(x.w27);
	p += uint32_popCount(x.w28);
	p += uint32_popCount(x.w29);
	p += uint32_popCount(x.w30);
	p += uint32_popCount(x.w31);
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


void ap_uint_512_shift_right(ap_uint_512 x, unsigned int shift, ap_uint_512p r)
{
	int word_shift = shift >> 5; 	// shift / 32;
	int bit_shift = shift & 0x1F; 	// shift % 32;

	
	{
		
		int src_word_hi = 15 + word_shift + 1;
		int src_word_lo = 15 + word_shift;

		unsigned int whi = (src_word_hi < (512/32))? ap_uint_512_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo < (512/32))? ap_uint_512_getDword(x, src_word_lo) : 0;

		
		r->w15 = (bit_shift == 0)? whi :  (whi << (32 - bit_shift)) | (wlo >> bit_shift);
		

	}
	{
		
		int src_word_hi = 14 + word_shift + 1;
		int src_word_lo = 14 + word_shift;

		unsigned int whi = (src_word_hi < (512/32))? ap_uint_512_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo < (512/32))? ap_uint_512_getDword(x, src_word_lo) : 0;

		
		r->w14 = (bit_shift == 0)? whi :  (whi << (32 - bit_shift)) | (wlo >> bit_shift);
		

	}
	{
		
		int src_word_hi = 13 + word_shift + 1;
		int src_word_lo = 13 + word_shift;

		unsigned int whi = (src_word_hi < (512/32))? ap_uint_512_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo < (512/32))? ap_uint_512_getDword(x, src_word_lo) : 0;

		
		r->w13 = (bit_shift == 0)? whi :  (whi << (32 - bit_shift)) | (wlo >> bit_shift);
		

	}
	{
		
		int src_word_hi = 12 + word_shift + 1;
		int src_word_lo = 12 + word_shift;

		unsigned int whi = (src_word_hi < (512/32))? ap_uint_512_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo < (512/32))? ap_uint_512_getDword(x, src_word_lo) : 0;

		
		r->w12 = (bit_shift == 0)? whi :  (whi << (32 - bit_shift)) | (wlo >> bit_shift);
		

	}
	{
		
		int src_word_hi = 11 + word_shift + 1;
		int src_word_lo = 11 + word_shift;

		unsigned int whi = (src_word_hi < (512/32))? ap_uint_512_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo < (512/32))? ap_uint_512_getDword(x, src_word_lo) : 0;

		
		r->w11 = (bit_shift == 0)? whi :  (whi << (32 - bit_shift)) | (wlo >> bit_shift);
		

	}
	{
		
		int src_word_hi = 10 + word_shift + 1;
		int src_word_lo = 10 + word_shift;

		unsigned int whi = (src_word_hi < (512/32))? ap_uint_512_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo < (512/32))? ap_uint_512_getDword(x, src_word_lo) : 0;

		
		r->w10 = (bit_shift == 0)? whi :  (whi << (32 - bit_shift)) | (wlo >> bit_shift);
		

	}
	{
		
		int src_word_hi = 9 + word_shift + 1;
		int src_word_lo = 9 + word_shift;

		unsigned int whi = (src_word_hi < (512/32))? ap_uint_512_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo < (512/32))? ap_uint_512_getDword(x, src_word_lo) : 0;

		
		r->w9 = (bit_shift == 0)? whi :  (whi << (32 - bit_shift)) | (wlo >> bit_shift);
		

	}
	{
		
		int src_word_hi = 8 + word_shift + 1;
		int src_word_lo = 8 + word_shift;

		unsigned int whi = (src_word_hi < (512/32))? ap_uint_512_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo < (512/32))? ap_uint_512_getDword(x, src_word_lo) : 0;

		
		r->w8 = (bit_shift == 0)? whi :  (whi << (32 - bit_shift)) | (wlo >> bit_shift);
		

	}
	{
		
		int src_word_hi = 7 + word_shift + 1;
		int src_word_lo = 7 + word_shift;

		unsigned int whi = (src_word_hi < (512/32))? ap_uint_512_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo < (512/32))? ap_uint_512_getDword(x, src_word_lo) : 0;

		
		r->w7 = (bit_shift == 0)? whi :  (whi << (32 - bit_shift)) | (wlo >> bit_shift);
		

	}
	{
		
		int src_word_hi = 6 + word_shift + 1;
		int src_word_lo = 6 + word_shift;

		unsigned int whi = (src_word_hi < (512/32))? ap_uint_512_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo < (512/32))? ap_uint_512_getDword(x, src_word_lo) : 0;

		
		r->w6 = (bit_shift == 0)? whi :  (whi << (32 - bit_shift)) | (wlo >> bit_shift);
		

	}
	{
		
		int src_word_hi = 5 + word_shift + 1;
		int src_word_lo = 5 + word_shift;

		unsigned int whi = (src_word_hi < (512/32))? ap_uint_512_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo < (512/32))? ap_uint_512_getDword(x, src_word_lo) : 0;

		
		r->w5 = (bit_shift == 0)? whi :  (whi << (32 - bit_shift)) | (wlo >> bit_shift);
		

	}
	{
		
		int src_word_hi = 4 + word_shift + 1;
		int src_word_lo = 4 + word_shift;

		unsigned int whi = (src_word_hi < (512/32))? ap_uint_512_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo < (512/32))? ap_uint_512_getDword(x, src_word_lo) : 0;

		
		r->w4 = (bit_shift == 0)? whi :  (whi << (32 - bit_shift)) | (wlo >> bit_shift);
		

	}
	{
		
		int src_word_hi = 3 + word_shift + 1;
		int src_word_lo = 3 + word_shift;

		unsigned int whi = (src_word_hi < (512/32))? ap_uint_512_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo < (512/32))? ap_uint_512_getDword(x, src_word_lo) : 0;

		
		r->w3 = (bit_shift == 0)? whi :  (whi << (32 - bit_shift)) | (wlo >> bit_shift);
		

	}
	{
		
		int src_word_hi = 2 + word_shift + 1;
		int src_word_lo = 2 + word_shift;

		unsigned int whi = (src_word_hi < (512/32))? ap_uint_512_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo < (512/32))? ap_uint_512_getDword(x, src_word_lo) : 0;

		
		r->w2 = (bit_shift == 0)? whi :  (whi << (32 - bit_shift)) | (wlo >> bit_shift);
		

	}
	{
		
		int src_word_hi = 1 + word_shift + 1;
		int src_word_lo = 1 + word_shift;

		unsigned int whi = (src_word_hi < (512/32))? ap_uint_512_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo < (512/32))? ap_uint_512_getDword(x, src_word_lo) : 0;

		
		r->w1 = (bit_shift == 0)? whi :  (whi << (32 - bit_shift)) | (wlo >> bit_shift);
		

	}
	{
		
		int src_word_hi = 0 + word_shift + 1;
		int src_word_lo = 0 + word_shift;

		unsigned int whi = (src_word_hi < (512/32))? ap_uint_512_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo < (512/32))? ap_uint_512_getDword(x, src_word_lo) : 0;

		
		r->w0 = (bit_shift == 0)? whi :  (whi << (32 - bit_shift)) | (wlo >> bit_shift);
		

	}
}


void ap_uint_1024_shift_right(ap_uint_1024 x, unsigned int shift, ap_uint_1024p r)
{
	int word_shift = shift >> 5; 	// shift / 32;
	int bit_shift = shift & 0x1F; 	// shift % 32;

	
	{
		
		int src_word_hi = 31 + word_shift + 1;
		int src_word_lo = 31 + word_shift;

		unsigned int whi = (src_word_hi < (1024/32))? ap_uint_1024_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo < (1024/32))? ap_uint_1024_getDword(x, src_word_lo) : 0;

		
		r->w31 = (bit_shift == 0)? whi :  (whi << (32 - bit_shift)) | (wlo >> bit_shift);
		

	}
	{
		
		int src_word_hi = 30 + word_shift + 1;
		int src_word_lo = 30 + word_shift;

		unsigned int whi = (src_word_hi < (1024/32))? ap_uint_1024_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo < (1024/32))? ap_uint_1024_getDword(x, src_word_lo) : 0;

		
		r->w30 = (bit_shift == 0)? whi :  (whi << (32 - bit_shift)) | (wlo >> bit_shift);
		

	}
	{
		
		int src_word_hi = 29 + word_shift + 1;
		int src_word_lo = 29 + word_shift;

		unsigned int whi = (src_word_hi < (1024/32))? ap_uint_1024_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo < (1024/32))? ap_uint_1024_getDword(x, src_word_lo) : 0;

		
		r->w29 = (bit_shift == 0)? whi :  (whi << (32 - bit_shift)) | (wlo >> bit_shift);
		

	}
	{
		
		int src_word_hi = 28 + word_shift + 1;
		int src_word_lo = 28 + word_shift;

		unsigned int whi = (src_word_hi < (1024/32))? ap_uint_1024_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo < (1024/32))? ap_uint_1024_getDword(x, src_word_lo) : 0;

		
		r->w28 = (bit_shift == 0)? whi :  (whi << (32 - bit_shift)) | (wlo >> bit_shift);
		

	}
	{
		
		int src_word_hi = 27 + word_shift + 1;
		int src_word_lo = 27 + word_shift;

		unsigned int whi = (src_word_hi < (1024/32))? ap_uint_1024_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo < (1024/32))? ap_uint_1024_getDword(x, src_word_lo) : 0;

		
		r->w27 = (bit_shift == 0)? whi :  (whi << (32 - bit_shift)) | (wlo >> bit_shift);
		

	}
	{
		
		int src_word_hi = 26 + word_shift + 1;
		int src_word_lo = 26 + word_shift;

		unsigned int whi = (src_word_hi < (1024/32))? ap_uint_1024_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo < (1024/32))? ap_uint_1024_getDword(x, src_word_lo) : 0;

		
		r->w26 = (bit_shift == 0)? whi :  (whi << (32 - bit_shift)) | (wlo >> bit_shift);
		

	}
	{
		
		int src_word_hi = 25 + word_shift + 1;
		int src_word_lo = 25 + word_shift;

		unsigned int whi = (src_word_hi < (1024/32))? ap_uint_1024_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo < (1024/32))? ap_uint_1024_getDword(x, src_word_lo) : 0;

		
		r->w25 = (bit_shift == 0)? whi :  (whi << (32 - bit_shift)) | (wlo >> bit_shift);
		

	}
	{
		
		int src_word_hi = 24 + word_shift + 1;
		int src_word_lo = 24 + word_shift;

		unsigned int whi = (src_word_hi < (1024/32))? ap_uint_1024_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo < (1024/32))? ap_uint_1024_getDword(x, src_word_lo) : 0;

		
		r->w24 = (bit_shift == 0)? whi :  (whi << (32 - bit_shift)) | (wlo >> bit_shift);
		

	}
	{
		
		int src_word_hi = 23 + word_shift + 1;
		int src_word_lo = 23 + word_shift;

		unsigned int whi = (src_word_hi < (1024/32))? ap_uint_1024_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo < (1024/32))? ap_uint_1024_getDword(x, src_word_lo) : 0;

		
		r->w23 = (bit_shift == 0)? whi :  (whi << (32 - bit_shift)) | (wlo >> bit_shift);
		

	}
	{
		
		int src_word_hi = 22 + word_shift + 1;
		int src_word_lo = 22 + word_shift;

		unsigned int whi = (src_word_hi < (1024/32))? ap_uint_1024_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo < (1024/32))? ap_uint_1024_getDword(x, src_word_lo) : 0;

		
		r->w22 = (bit_shift == 0)? whi :  (whi << (32 - bit_shift)) | (wlo >> bit_shift);
		

	}
	{
		
		int src_word_hi = 21 + word_shift + 1;
		int src_word_lo = 21 + word_shift;

		unsigned int whi = (src_word_hi < (1024/32))? ap_uint_1024_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo < (1024/32))? ap_uint_1024_getDword(x, src_word_lo) : 0;

		
		r->w21 = (bit_shift == 0)? whi :  (whi << (32 - bit_shift)) | (wlo >> bit_shift);
		

	}
	{
		
		int src_word_hi = 20 + word_shift + 1;
		int src_word_lo = 20 + word_shift;

		unsigned int whi = (src_word_hi < (1024/32))? ap_uint_1024_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo < (1024/32))? ap_uint_1024_getDword(x, src_word_lo) : 0;

		
		r->w20 = (bit_shift == 0)? whi :  (whi << (32 - bit_shift)) | (wlo >> bit_shift);
		

	}
	{
		
		int src_word_hi = 19 + word_shift + 1;
		int src_word_lo = 19 + word_shift;

		unsigned int whi = (src_word_hi < (1024/32))? ap_uint_1024_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo < (1024/32))? ap_uint_1024_getDword(x, src_word_lo) : 0;

		
		r->w19 = (bit_shift == 0)? whi :  (whi << (32 - bit_shift)) | (wlo >> bit_shift);
		

	}
	{
		
		int src_word_hi = 18 + word_shift + 1;
		int src_word_lo = 18 + word_shift;

		unsigned int whi = (src_word_hi < (1024/32))? ap_uint_1024_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo < (1024/32))? ap_uint_1024_getDword(x, src_word_lo) : 0;

		
		r->w18 = (bit_shift == 0)? whi :  (whi << (32 - bit_shift)) | (wlo >> bit_shift);
		

	}
	{
		
		int src_word_hi = 17 + word_shift + 1;
		int src_word_lo = 17 + word_shift;

		unsigned int whi = (src_word_hi < (1024/32))? ap_uint_1024_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo < (1024/32))? ap_uint_1024_getDword(x, src_word_lo) : 0;

		
		r->w17 = (bit_shift == 0)? whi :  (whi << (32 - bit_shift)) | (wlo >> bit_shift);
		

	}
	{
		
		int src_word_hi = 16 + word_shift + 1;
		int src_word_lo = 16 + word_shift;

		unsigned int whi = (src_word_hi < (1024/32))? ap_uint_1024_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo < (1024/32))? ap_uint_1024_getDword(x, src_word_lo) : 0;

		
		r->w16 = (bit_shift == 0)? whi :  (whi << (32 - bit_shift)) | (wlo >> bit_shift);
		

	}
	{
		
		int src_word_hi = 15 + word_shift + 1;
		int src_word_lo = 15 + word_shift;

		unsigned int whi = (src_word_hi < (1024/32))? ap_uint_1024_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo < (1024/32))? ap_uint_1024_getDword(x, src_word_lo) : 0;

		
		r->w15 = (bit_shift == 0)? whi :  (whi << (32 - bit_shift)) | (wlo >> bit_shift);
		

	}
	{
		
		int src_word_hi = 14 + word_shift + 1;
		int src_word_lo = 14 + word_shift;

		unsigned int whi = (src_word_hi < (1024/32))? ap_uint_1024_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo < (1024/32))? ap_uint_1024_getDword(x, src_word_lo) : 0;

		
		r->w14 = (bit_shift == 0)? whi :  (whi << (32 - bit_shift)) | (wlo >> bit_shift);
		

	}
	{
		
		int src_word_hi = 13 + word_shift + 1;
		int src_word_lo = 13 + word_shift;

		unsigned int whi = (src_word_hi < (1024/32))? ap_uint_1024_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo < (1024/32))? ap_uint_1024_getDword(x, src_word_lo) : 0;

		
		r->w13 = (bit_shift == 0)? whi :  (whi << (32 - bit_shift)) | (wlo >> bit_shift);
		

	}
	{
		
		int src_word_hi = 12 + word_shift + 1;
		int src_word_lo = 12 + word_shift;

		unsigned int whi = (src_word_hi < (1024/32))? ap_uint_1024_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo < (1024/32))? ap_uint_1024_getDword(x, src_word_lo) : 0;

		
		r->w12 = (bit_shift == 0)? whi :  (whi << (32 - bit_shift)) | (wlo >> bit_shift);
		

	}
	{
		
		int src_word_hi = 11 + word_shift + 1;
		int src_word_lo = 11 + word_shift;

		unsigned int whi = (src_word_hi < (1024/32))? ap_uint_1024_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo < (1024/32))? ap_uint_1024_getDword(x, src_word_lo) : 0;

		
		r->w11 = (bit_shift == 0)? whi :  (whi << (32 - bit_shift)) | (wlo >> bit_shift);
		

	}
	{
		
		int src_word_hi = 10 + word_shift + 1;
		int src_word_lo = 10 + word_shift;

		unsigned int whi = (src_word_hi < (1024/32))? ap_uint_1024_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo < (1024/32))? ap_uint_1024_getDword(x, src_word_lo) : 0;

		
		r->w10 = (bit_shift == 0)? whi :  (whi << (32 - bit_shift)) | (wlo >> bit_shift);
		

	}
	{
		
		int src_word_hi = 9 + word_shift + 1;
		int src_word_lo = 9 + word_shift;

		unsigned int whi = (src_word_hi < (1024/32))? ap_uint_1024_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo < (1024/32))? ap_uint_1024_getDword(x, src_word_lo) : 0;

		
		r->w9 = (bit_shift == 0)? whi :  (whi << (32 - bit_shift)) | (wlo >> bit_shift);
		

	}
	{
		
		int src_word_hi = 8 + word_shift + 1;
		int src_word_lo = 8 + word_shift;

		unsigned int whi = (src_word_hi < (1024/32))? ap_uint_1024_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo < (1024/32))? ap_uint_1024_getDword(x, src_word_lo) : 0;

		
		r->w8 = (bit_shift == 0)? whi :  (whi << (32 - bit_shift)) | (wlo >> bit_shift);
		

	}
	{
		
		int src_word_hi = 7 + word_shift + 1;
		int src_word_lo = 7 + word_shift;

		unsigned int whi = (src_word_hi < (1024/32))? ap_uint_1024_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo < (1024/32))? ap_uint_1024_getDword(x, src_word_lo) : 0;

		
		r->w7 = (bit_shift == 0)? whi :  (whi << (32 - bit_shift)) | (wlo >> bit_shift);
		

	}
	{
		
		int src_word_hi = 6 + word_shift + 1;
		int src_word_lo = 6 + word_shift;

		unsigned int whi = (src_word_hi < (1024/32))? ap_uint_1024_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo < (1024/32))? ap_uint_1024_getDword(x, src_word_lo) : 0;

		
		r->w6 = (bit_shift == 0)? whi :  (whi << (32 - bit_shift)) | (wlo >> bit_shift);
		

	}
	{
		
		int src_word_hi = 5 + word_shift + 1;
		int src_word_lo = 5 + word_shift;

		unsigned int whi = (src_word_hi < (1024/32))? ap_uint_1024_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo < (1024/32))? ap_uint_1024_getDword(x, src_word_lo) : 0;

		
		r->w5 = (bit_shift == 0)? whi :  (whi << (32 - bit_shift)) | (wlo >> bit_shift);
		

	}
	{
		
		int src_word_hi = 4 + word_shift + 1;
		int src_word_lo = 4 + word_shift;

		unsigned int whi = (src_word_hi < (1024/32))? ap_uint_1024_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo < (1024/32))? ap_uint_1024_getDword(x, src_word_lo) : 0;

		
		r->w4 = (bit_shift == 0)? whi :  (whi << (32 - bit_shift)) | (wlo >> bit_shift);
		

	}
	{
		
		int src_word_hi = 3 + word_shift + 1;
		int src_word_lo = 3 + word_shift;

		unsigned int whi = (src_word_hi < (1024/32))? ap_uint_1024_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo < (1024/32))? ap_uint_1024_getDword(x, src_word_lo) : 0;

		
		r->w3 = (bit_shift == 0)? whi :  (whi << (32 - bit_shift)) | (wlo >> bit_shift);
		

	}
	{
		
		int src_word_hi = 2 + word_shift + 1;
		int src_word_lo = 2 + word_shift;

		unsigned int whi = (src_word_hi < (1024/32))? ap_uint_1024_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo < (1024/32))? ap_uint_1024_getDword(x, src_word_lo) : 0;

		
		r->w2 = (bit_shift == 0)? whi :  (whi << (32 - bit_shift)) | (wlo >> bit_shift);
		

	}
	{
		
		int src_word_hi = 1 + word_shift + 1;
		int src_word_lo = 1 + word_shift;

		unsigned int whi = (src_word_hi < (1024/32))? ap_uint_1024_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo < (1024/32))? ap_uint_1024_getDword(x, src_word_lo) : 0;

		
		r->w1 = (bit_shift == 0)? whi :  (whi << (32 - bit_shift)) | (wlo >> bit_shift);
		

	}
	{
		
		int src_word_hi = 0 + word_shift + 1;
		int src_word_lo = 0 + word_shift;

		unsigned int whi = (src_word_hi < (1024/32))? ap_uint_1024_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo < (1024/32))? ap_uint_1024_getDword(x, src_word_lo) : 0;

		
		r->w0 = (bit_shift == 0)? whi :  (whi << (32 - bit_shift)) | (wlo >> bit_shift);
		

	}
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


void ap_uint_1024_shift_left_bytes(ap_uint_1024 x, unsigned char shift, ap_uint_1024p r)
{
	int word_shift = shift >> 2; 	// shift / 4;
	int byte_shift = shift & 0x3; 	// shift % 4;

	
	{
		
		int src_word_hi = 31 - word_shift;
		int src_word_lo = 31 - word_shift -1;

		unsigned int whi = (src_word_hi >= 0)? ap_uint_1024_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo >= 0)? ap_uint_1024_getDword(x, src_word_lo) : 0;

		
		r->w31 = (byte_shift == 0)? whi :  (whi << (8 * byte_shift)) | (wlo >> (8 * (4-byte_shift)));
		

	}
	{
		
		int src_word_hi = 30 - word_shift;
		int src_word_lo = 30 - word_shift -1;

		unsigned int whi = (src_word_hi >= 0)? ap_uint_1024_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo >= 0)? ap_uint_1024_getDword(x, src_word_lo) : 0;

		
		r->w30 = (byte_shift == 0)? whi :  (whi << (8 * byte_shift)) | (wlo >> (8 * (4-byte_shift)));
		

	}
	{
		
		int src_word_hi = 29 - word_shift;
		int src_word_lo = 29 - word_shift -1;

		unsigned int whi = (src_word_hi >= 0)? ap_uint_1024_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo >= 0)? ap_uint_1024_getDword(x, src_word_lo) : 0;

		
		r->w29 = (byte_shift == 0)? whi :  (whi << (8 * byte_shift)) | (wlo >> (8 * (4-byte_shift)));
		

	}
	{
		
		int src_word_hi = 28 - word_shift;
		int src_word_lo = 28 - word_shift -1;

		unsigned int whi = (src_word_hi >= 0)? ap_uint_1024_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo >= 0)? ap_uint_1024_getDword(x, src_word_lo) : 0;

		
		r->w28 = (byte_shift == 0)? whi :  (whi << (8 * byte_shift)) | (wlo >> (8 * (4-byte_shift)));
		

	}
	{
		
		int src_word_hi = 27 - word_shift;
		int src_word_lo = 27 - word_shift -1;

		unsigned int whi = (src_word_hi >= 0)? ap_uint_1024_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo >= 0)? ap_uint_1024_getDword(x, src_word_lo) : 0;

		
		r->w27 = (byte_shift == 0)? whi :  (whi << (8 * byte_shift)) | (wlo >> (8 * (4-byte_shift)));
		

	}
	{
		
		int src_word_hi = 26 - word_shift;
		int src_word_lo = 26 - word_shift -1;

		unsigned int whi = (src_word_hi >= 0)? ap_uint_1024_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo >= 0)? ap_uint_1024_getDword(x, src_word_lo) : 0;

		
		r->w26 = (byte_shift == 0)? whi :  (whi << (8 * byte_shift)) | (wlo >> (8 * (4-byte_shift)));
		

	}
	{
		
		int src_word_hi = 25 - word_shift;
		int src_word_lo = 25 - word_shift -1;

		unsigned int whi = (src_word_hi >= 0)? ap_uint_1024_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo >= 0)? ap_uint_1024_getDword(x, src_word_lo) : 0;

		
		r->w25 = (byte_shift == 0)? whi :  (whi << (8 * byte_shift)) | (wlo >> (8 * (4-byte_shift)));
		

	}
	{
		
		int src_word_hi = 24 - word_shift;
		int src_word_lo = 24 - word_shift -1;

		unsigned int whi = (src_word_hi >= 0)? ap_uint_1024_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo >= 0)? ap_uint_1024_getDword(x, src_word_lo) : 0;

		
		r->w24 = (byte_shift == 0)? whi :  (whi << (8 * byte_shift)) | (wlo >> (8 * (4-byte_shift)));
		

	}
	{
		
		int src_word_hi = 23 - word_shift;
		int src_word_lo = 23 - word_shift -1;

		unsigned int whi = (src_word_hi >= 0)? ap_uint_1024_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo >= 0)? ap_uint_1024_getDword(x, src_word_lo) : 0;

		
		r->w23 = (byte_shift == 0)? whi :  (whi << (8 * byte_shift)) | (wlo >> (8 * (4-byte_shift)));
		

	}
	{
		
		int src_word_hi = 22 - word_shift;
		int src_word_lo = 22 - word_shift -1;

		unsigned int whi = (src_word_hi >= 0)? ap_uint_1024_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo >= 0)? ap_uint_1024_getDword(x, src_word_lo) : 0;

		
		r->w22 = (byte_shift == 0)? whi :  (whi << (8 * byte_shift)) | (wlo >> (8 * (4-byte_shift)));
		

	}
	{
		
		int src_word_hi = 21 - word_shift;
		int src_word_lo = 21 - word_shift -1;

		unsigned int whi = (src_word_hi >= 0)? ap_uint_1024_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo >= 0)? ap_uint_1024_getDword(x, src_word_lo) : 0;

		
		r->w21 = (byte_shift == 0)? whi :  (whi << (8 * byte_shift)) | (wlo >> (8 * (4-byte_shift)));
		

	}
	{
		
		int src_word_hi = 20 - word_shift;
		int src_word_lo = 20 - word_shift -1;

		unsigned int whi = (src_word_hi >= 0)? ap_uint_1024_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo >= 0)? ap_uint_1024_getDword(x, src_word_lo) : 0;

		
		r->w20 = (byte_shift == 0)? whi :  (whi << (8 * byte_shift)) | (wlo >> (8 * (4-byte_shift)));
		

	}
	{
		
		int src_word_hi = 19 - word_shift;
		int src_word_lo = 19 - word_shift -1;

		unsigned int whi = (src_word_hi >= 0)? ap_uint_1024_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo >= 0)? ap_uint_1024_getDword(x, src_word_lo) : 0;

		
		r->w19 = (byte_shift == 0)? whi :  (whi << (8 * byte_shift)) | (wlo >> (8 * (4-byte_shift)));
		

	}
	{
		
		int src_word_hi = 18 - word_shift;
		int src_word_lo = 18 - word_shift -1;

		unsigned int whi = (src_word_hi >= 0)? ap_uint_1024_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo >= 0)? ap_uint_1024_getDword(x, src_word_lo) : 0;

		
		r->w18 = (byte_shift == 0)? whi :  (whi << (8 * byte_shift)) | (wlo >> (8 * (4-byte_shift)));
		

	}
	{
		
		int src_word_hi = 17 - word_shift;
		int src_word_lo = 17 - word_shift -1;

		unsigned int whi = (src_word_hi >= 0)? ap_uint_1024_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo >= 0)? ap_uint_1024_getDword(x, src_word_lo) : 0;

		
		r->w17 = (byte_shift == 0)? whi :  (whi << (8 * byte_shift)) | (wlo >> (8 * (4-byte_shift)));
		

	}
	{
		
		int src_word_hi = 16 - word_shift;
		int src_word_lo = 16 - word_shift -1;

		unsigned int whi = (src_word_hi >= 0)? ap_uint_1024_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo >= 0)? ap_uint_1024_getDword(x, src_word_lo) : 0;

		
		r->w16 = (byte_shift == 0)? whi :  (whi << (8 * byte_shift)) | (wlo >> (8 * (4-byte_shift)));
		

	}
	{
		
		int src_word_hi = 15 - word_shift;
		int src_word_lo = 15 - word_shift -1;

		unsigned int whi = (src_word_hi >= 0)? ap_uint_1024_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo >= 0)? ap_uint_1024_getDword(x, src_word_lo) : 0;

		
		r->w15 = (byte_shift == 0)? whi :  (whi << (8 * byte_shift)) | (wlo >> (8 * (4-byte_shift)));
		

	}
	{
		
		int src_word_hi = 14 - word_shift;
		int src_word_lo = 14 - word_shift -1;

		unsigned int whi = (src_word_hi >= 0)? ap_uint_1024_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo >= 0)? ap_uint_1024_getDword(x, src_word_lo) : 0;

		
		r->w14 = (byte_shift == 0)? whi :  (whi << (8 * byte_shift)) | (wlo >> (8 * (4-byte_shift)));
		

	}
	{
		
		int src_word_hi = 13 - word_shift;
		int src_word_lo = 13 - word_shift -1;

		unsigned int whi = (src_word_hi >= 0)? ap_uint_1024_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo >= 0)? ap_uint_1024_getDword(x, src_word_lo) : 0;

		
		r->w13 = (byte_shift == 0)? whi :  (whi << (8 * byte_shift)) | (wlo >> (8 * (4-byte_shift)));
		

	}
	{
		
		int src_word_hi = 12 - word_shift;
		int src_word_lo = 12 - word_shift -1;

		unsigned int whi = (src_word_hi >= 0)? ap_uint_1024_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo >= 0)? ap_uint_1024_getDword(x, src_word_lo) : 0;

		
		r->w12 = (byte_shift == 0)? whi :  (whi << (8 * byte_shift)) | (wlo >> (8 * (4-byte_shift)));
		

	}
	{
		
		int src_word_hi = 11 - word_shift;
		int src_word_lo = 11 - word_shift -1;

		unsigned int whi = (src_word_hi >= 0)? ap_uint_1024_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo >= 0)? ap_uint_1024_getDword(x, src_word_lo) : 0;

		
		r->w11 = (byte_shift == 0)? whi :  (whi << (8 * byte_shift)) | (wlo >> (8 * (4-byte_shift)));
		

	}
	{
		
		int src_word_hi = 10 - word_shift;
		int src_word_lo = 10 - word_shift -1;

		unsigned int whi = (src_word_hi >= 0)? ap_uint_1024_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo >= 0)? ap_uint_1024_getDword(x, src_word_lo) : 0;

		
		r->w10 = (byte_shift == 0)? whi :  (whi << (8 * byte_shift)) | (wlo >> (8 * (4-byte_shift)));
		

	}
	{
		
		int src_word_hi = 9 - word_shift;
		int src_word_lo = 9 - word_shift -1;

		unsigned int whi = (src_word_hi >= 0)? ap_uint_1024_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo >= 0)? ap_uint_1024_getDword(x, src_word_lo) : 0;

		
		r->w9 = (byte_shift == 0)? whi :  (whi << (8 * byte_shift)) | (wlo >> (8 * (4-byte_shift)));
		

	}
	{
		
		int src_word_hi = 8 - word_shift;
		int src_word_lo = 8 - word_shift -1;

		unsigned int whi = (src_word_hi >= 0)? ap_uint_1024_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo >= 0)? ap_uint_1024_getDword(x, src_word_lo) : 0;

		
		r->w8 = (byte_shift == 0)? whi :  (whi << (8 * byte_shift)) | (wlo >> (8 * (4-byte_shift)));
		

	}
	{
		
		int src_word_hi = 7 - word_shift;
		int src_word_lo = 7 - word_shift -1;

		unsigned int whi = (src_word_hi >= 0)? ap_uint_1024_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo >= 0)? ap_uint_1024_getDword(x, src_word_lo) : 0;

		
		r->w7 = (byte_shift == 0)? whi :  (whi << (8 * byte_shift)) | (wlo >> (8 * (4-byte_shift)));
		

	}
	{
		
		int src_word_hi = 6 - word_shift;
		int src_word_lo = 6 - word_shift -1;

		unsigned int whi = (src_word_hi >= 0)? ap_uint_1024_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo >= 0)? ap_uint_1024_getDword(x, src_word_lo) : 0;

		
		r->w6 = (byte_shift == 0)? whi :  (whi << (8 * byte_shift)) | (wlo >> (8 * (4-byte_shift)));
		

	}
	{
		
		int src_word_hi = 5 - word_shift;
		int src_word_lo = 5 - word_shift -1;

		unsigned int whi = (src_word_hi >= 0)? ap_uint_1024_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo >= 0)? ap_uint_1024_getDword(x, src_word_lo) : 0;

		
		r->w5 = (byte_shift == 0)? whi :  (whi << (8 * byte_shift)) | (wlo >> (8 * (4-byte_shift)));
		

	}
	{
		
		int src_word_hi = 4 - word_shift;
		int src_word_lo = 4 - word_shift -1;

		unsigned int whi = (src_word_hi >= 0)? ap_uint_1024_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo >= 0)? ap_uint_1024_getDword(x, src_word_lo) : 0;

		
		r->w4 = (byte_shift == 0)? whi :  (whi << (8 * byte_shift)) | (wlo >> (8 * (4-byte_shift)));
		

	}
	{
		
		int src_word_hi = 3 - word_shift;
		int src_word_lo = 3 - word_shift -1;

		unsigned int whi = (src_word_hi >= 0)? ap_uint_1024_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo >= 0)? ap_uint_1024_getDword(x, src_word_lo) : 0;

		
		r->w3 = (byte_shift == 0)? whi :  (whi << (8 * byte_shift)) | (wlo >> (8 * (4-byte_shift)));
		

	}
	{
		
		int src_word_hi = 2 - word_shift;
		int src_word_lo = 2 - word_shift -1;

		unsigned int whi = (src_word_hi >= 0)? ap_uint_1024_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo >= 0)? ap_uint_1024_getDword(x, src_word_lo) : 0;

		
		r->w2 = (byte_shift == 0)? whi :  (whi << (8 * byte_shift)) | (wlo >> (8 * (4-byte_shift)));
		

	}
	{
		
		int src_word_hi = 1 - word_shift;
		int src_word_lo = 1 - word_shift -1;

		unsigned int whi = (src_word_hi >= 0)? ap_uint_1024_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo >= 0)? ap_uint_1024_getDword(x, src_word_lo) : 0;

		
		r->w1 = (byte_shift == 0)? whi :  (whi << (8 * byte_shift)) | (wlo >> (8 * (4-byte_shift)));
		

	}
	{
		
		int src_word_hi = 0 - word_shift;
		int src_word_lo = 0 - word_shift -1;

		unsigned int whi = (src_word_hi >= 0)? ap_uint_1024_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo >= 0)? ap_uint_1024_getDword(x, src_word_lo) : 0;

		
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

void ap_uint_1024_shift_left(ap_uint_1024 x, unsigned int shift, ap_uint_1024p r)
{
	int word_shift = shift >> 5; 	// shift / 32;
	int bit_shift = shift & 0x1F; 	// shift % 32;

	
	{
		
		int src_word_hi = 31 - word_shift;
		int src_word_lo = 31 - word_shift -1;

		unsigned int whi = (src_word_hi >= 0)? ap_uint_1024_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo >= 0)? ap_uint_1024_getDword(x, src_word_lo) : 0;

		
		r->w31 = (bit_shift == 0)? whi :  (whi << bit_shift) | (wlo >> (32-bit_shift));
		

	}
	{
		
		int src_word_hi = 30 - word_shift;
		int src_word_lo = 30 - word_shift -1;

		unsigned int whi = (src_word_hi >= 0)? ap_uint_1024_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo >= 0)? ap_uint_1024_getDword(x, src_word_lo) : 0;

		
		r->w30 = (bit_shift == 0)? whi :  (whi << bit_shift) | (wlo >> (32-bit_shift));
		

	}
	{
		
		int src_word_hi = 29 - word_shift;
		int src_word_lo = 29 - word_shift -1;

		unsigned int whi = (src_word_hi >= 0)? ap_uint_1024_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo >= 0)? ap_uint_1024_getDword(x, src_word_lo) : 0;

		
		r->w29 = (bit_shift == 0)? whi :  (whi << bit_shift) | (wlo >> (32-bit_shift));
		

	}
	{
		
		int src_word_hi = 28 - word_shift;
		int src_word_lo = 28 - word_shift -1;

		unsigned int whi = (src_word_hi >= 0)? ap_uint_1024_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo >= 0)? ap_uint_1024_getDword(x, src_word_lo) : 0;

		
		r->w28 = (bit_shift == 0)? whi :  (whi << bit_shift) | (wlo >> (32-bit_shift));
		

	}
	{
		
		int src_word_hi = 27 - word_shift;
		int src_word_lo = 27 - word_shift -1;

		unsigned int whi = (src_word_hi >= 0)? ap_uint_1024_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo >= 0)? ap_uint_1024_getDword(x, src_word_lo) : 0;

		
		r->w27 = (bit_shift == 0)? whi :  (whi << bit_shift) | (wlo >> (32-bit_shift));
		

	}
	{
		
		int src_word_hi = 26 - word_shift;
		int src_word_lo = 26 - word_shift -1;

		unsigned int whi = (src_word_hi >= 0)? ap_uint_1024_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo >= 0)? ap_uint_1024_getDword(x, src_word_lo) : 0;

		
		r->w26 = (bit_shift == 0)? whi :  (whi << bit_shift) | (wlo >> (32-bit_shift));
		

	}
	{
		
		int src_word_hi = 25 - word_shift;
		int src_word_lo = 25 - word_shift -1;

		unsigned int whi = (src_word_hi >= 0)? ap_uint_1024_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo >= 0)? ap_uint_1024_getDword(x, src_word_lo) : 0;

		
		r->w25 = (bit_shift == 0)? whi :  (whi << bit_shift) | (wlo >> (32-bit_shift));
		

	}
	{
		
		int src_word_hi = 24 - word_shift;
		int src_word_lo = 24 - word_shift -1;

		unsigned int whi = (src_word_hi >= 0)? ap_uint_1024_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo >= 0)? ap_uint_1024_getDword(x, src_word_lo) : 0;

		
		r->w24 = (bit_shift == 0)? whi :  (whi << bit_shift) | (wlo >> (32-bit_shift));
		

	}
	{
		
		int src_word_hi = 23 - word_shift;
		int src_word_lo = 23 - word_shift -1;

		unsigned int whi = (src_word_hi >= 0)? ap_uint_1024_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo >= 0)? ap_uint_1024_getDword(x, src_word_lo) : 0;

		
		r->w23 = (bit_shift == 0)? whi :  (whi << bit_shift) | (wlo >> (32-bit_shift));
		

	}
	{
		
		int src_word_hi = 22 - word_shift;
		int src_word_lo = 22 - word_shift -1;

		unsigned int whi = (src_word_hi >= 0)? ap_uint_1024_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo >= 0)? ap_uint_1024_getDword(x, src_word_lo) : 0;

		
		r->w22 = (bit_shift == 0)? whi :  (whi << bit_shift) | (wlo >> (32-bit_shift));
		

	}
	{
		
		int src_word_hi = 21 - word_shift;
		int src_word_lo = 21 - word_shift -1;

		unsigned int whi = (src_word_hi >= 0)? ap_uint_1024_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo >= 0)? ap_uint_1024_getDword(x, src_word_lo) : 0;

		
		r->w21 = (bit_shift == 0)? whi :  (whi << bit_shift) | (wlo >> (32-bit_shift));
		

	}
	{
		
		int src_word_hi = 20 - word_shift;
		int src_word_lo = 20 - word_shift -1;

		unsigned int whi = (src_word_hi >= 0)? ap_uint_1024_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo >= 0)? ap_uint_1024_getDword(x, src_word_lo) : 0;

		
		r->w20 = (bit_shift == 0)? whi :  (whi << bit_shift) | (wlo >> (32-bit_shift));
		

	}
	{
		
		int src_word_hi = 19 - word_shift;
		int src_word_lo = 19 - word_shift -1;

		unsigned int whi = (src_word_hi >= 0)? ap_uint_1024_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo >= 0)? ap_uint_1024_getDword(x, src_word_lo) : 0;

		
		r->w19 = (bit_shift == 0)? whi :  (whi << bit_shift) | (wlo >> (32-bit_shift));
		

	}
	{
		
		int src_word_hi = 18 - word_shift;
		int src_word_lo = 18 - word_shift -1;

		unsigned int whi = (src_word_hi >= 0)? ap_uint_1024_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo >= 0)? ap_uint_1024_getDword(x, src_word_lo) : 0;

		
		r->w18 = (bit_shift == 0)? whi :  (whi << bit_shift) | (wlo >> (32-bit_shift));
		

	}
	{
		
		int src_word_hi = 17 - word_shift;
		int src_word_lo = 17 - word_shift -1;

		unsigned int whi = (src_word_hi >= 0)? ap_uint_1024_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo >= 0)? ap_uint_1024_getDword(x, src_word_lo) : 0;

		
		r->w17 = (bit_shift == 0)? whi :  (whi << bit_shift) | (wlo >> (32-bit_shift));
		

	}
	{
		
		int src_word_hi = 16 - word_shift;
		int src_word_lo = 16 - word_shift -1;

		unsigned int whi = (src_word_hi >= 0)? ap_uint_1024_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo >= 0)? ap_uint_1024_getDword(x, src_word_lo) : 0;

		
		r->w16 = (bit_shift == 0)? whi :  (whi << bit_shift) | (wlo >> (32-bit_shift));
		

	}
	{
		
		int src_word_hi = 15 - word_shift;
		int src_word_lo = 15 - word_shift -1;

		unsigned int whi = (src_word_hi >= 0)? ap_uint_1024_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo >= 0)? ap_uint_1024_getDword(x, src_word_lo) : 0;

		
		r->w15 = (bit_shift == 0)? whi :  (whi << bit_shift) | (wlo >> (32-bit_shift));
		

	}
	{
		
		int src_word_hi = 14 - word_shift;
		int src_word_lo = 14 - word_shift -1;

		unsigned int whi = (src_word_hi >= 0)? ap_uint_1024_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo >= 0)? ap_uint_1024_getDword(x, src_word_lo) : 0;

		
		r->w14 = (bit_shift == 0)? whi :  (whi << bit_shift) | (wlo >> (32-bit_shift));
		

	}
	{
		
		int src_word_hi = 13 - word_shift;
		int src_word_lo = 13 - word_shift -1;

		unsigned int whi = (src_word_hi >= 0)? ap_uint_1024_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo >= 0)? ap_uint_1024_getDword(x, src_word_lo) : 0;

		
		r->w13 = (bit_shift == 0)? whi :  (whi << bit_shift) | (wlo >> (32-bit_shift));
		

	}
	{
		
		int src_word_hi = 12 - word_shift;
		int src_word_lo = 12 - word_shift -1;

		unsigned int whi = (src_word_hi >= 0)? ap_uint_1024_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo >= 0)? ap_uint_1024_getDword(x, src_word_lo) : 0;

		
		r->w12 = (bit_shift == 0)? whi :  (whi << bit_shift) | (wlo >> (32-bit_shift));
		

	}
	{
		
		int src_word_hi = 11 - word_shift;
		int src_word_lo = 11 - word_shift -1;

		unsigned int whi = (src_word_hi >= 0)? ap_uint_1024_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo >= 0)? ap_uint_1024_getDword(x, src_word_lo) : 0;

		
		r->w11 = (bit_shift == 0)? whi :  (whi << bit_shift) | (wlo >> (32-bit_shift));
		

	}
	{
		
		int src_word_hi = 10 - word_shift;
		int src_word_lo = 10 - word_shift -1;

		unsigned int whi = (src_word_hi >= 0)? ap_uint_1024_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo >= 0)? ap_uint_1024_getDword(x, src_word_lo) : 0;

		
		r->w10 = (bit_shift == 0)? whi :  (whi << bit_shift) | (wlo >> (32-bit_shift));
		

	}
	{
		
		int src_word_hi = 9 - word_shift;
		int src_word_lo = 9 - word_shift -1;

		unsigned int whi = (src_word_hi >= 0)? ap_uint_1024_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo >= 0)? ap_uint_1024_getDword(x, src_word_lo) : 0;

		
		r->w9 = (bit_shift == 0)? whi :  (whi << bit_shift) | (wlo >> (32-bit_shift));
		

	}
	{
		
		int src_word_hi = 8 - word_shift;
		int src_word_lo = 8 - word_shift -1;

		unsigned int whi = (src_word_hi >= 0)? ap_uint_1024_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo >= 0)? ap_uint_1024_getDword(x, src_word_lo) : 0;

		
		r->w8 = (bit_shift == 0)? whi :  (whi << bit_shift) | (wlo >> (32-bit_shift));
		

	}
	{
		
		int src_word_hi = 7 - word_shift;
		int src_word_lo = 7 - word_shift -1;

		unsigned int whi = (src_word_hi >= 0)? ap_uint_1024_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo >= 0)? ap_uint_1024_getDword(x, src_word_lo) : 0;

		
		r->w7 = (bit_shift == 0)? whi :  (whi << bit_shift) | (wlo >> (32-bit_shift));
		

	}
	{
		
		int src_word_hi = 6 - word_shift;
		int src_word_lo = 6 - word_shift -1;

		unsigned int whi = (src_word_hi >= 0)? ap_uint_1024_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo >= 0)? ap_uint_1024_getDword(x, src_word_lo) : 0;

		
		r->w6 = (bit_shift == 0)? whi :  (whi << bit_shift) | (wlo >> (32-bit_shift));
		

	}
	{
		
		int src_word_hi = 5 - word_shift;
		int src_word_lo = 5 - word_shift -1;

		unsigned int whi = (src_word_hi >= 0)? ap_uint_1024_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo >= 0)? ap_uint_1024_getDword(x, src_word_lo) : 0;

		
		r->w5 = (bit_shift == 0)? whi :  (whi << bit_shift) | (wlo >> (32-bit_shift));
		

	}
	{
		
		int src_word_hi = 4 - word_shift;
		int src_word_lo = 4 - word_shift -1;

		unsigned int whi = (src_word_hi >= 0)? ap_uint_1024_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo >= 0)? ap_uint_1024_getDword(x, src_word_lo) : 0;

		
		r->w4 = (bit_shift == 0)? whi :  (whi << bit_shift) | (wlo >> (32-bit_shift));
		

	}
	{
		
		int src_word_hi = 3 - word_shift;
		int src_word_lo = 3 - word_shift -1;

		unsigned int whi = (src_word_hi >= 0)? ap_uint_1024_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo >= 0)? ap_uint_1024_getDword(x, src_word_lo) : 0;

		
		r->w3 = (bit_shift == 0)? whi :  (whi << bit_shift) | (wlo >> (32-bit_shift));
		

	}
	{
		
		int src_word_hi = 2 - word_shift;
		int src_word_lo = 2 - word_shift -1;

		unsigned int whi = (src_word_hi >= 0)? ap_uint_1024_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo >= 0)? ap_uint_1024_getDword(x, src_word_lo) : 0;

		
		r->w2 = (bit_shift == 0)? whi :  (whi << bit_shift) | (wlo >> (32-bit_shift));
		

	}
	{
		
		int src_word_hi = 1 - word_shift;
		int src_word_lo = 1 - word_shift -1;

		unsigned int whi = (src_word_hi >= 0)? ap_uint_1024_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo >= 0)? ap_uint_1024_getDword(x, src_word_lo) : 0;

		
		r->w1 = (bit_shift == 0)? whi :  (whi << bit_shift) | (wlo >> (32-bit_shift));
		

	}
	{
		
		int src_word_hi = 0 - word_shift;
		int src_word_lo = 0 - word_shift -1;

		unsigned int whi = (src_word_hi >= 0)? ap_uint_1024_getDword(x, src_word_hi) : 0;
		unsigned int wlo = (src_word_lo >= 0)? ap_uint_1024_getDword(x, src_word_lo) : 0;

		
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



void ap_uint_512_set_range_high_32(ap_uint_512p p, unsigned int offset, unsigned int size, unsigned int value)
{
	unsigned int mask = (1 << size) -1;

	int highest_bit = 512 - 1 -  offset;
	int lowest_bit = highest_bit + 1 - size;

	int wordidx0 = highest_bit / 32;
	int bitidx0 = highest_bit % 32;
  
	int wordidx1 = lowest_bit / 32;
	int bitidx1 = lowest_bit % 32;

	unsigned int high_word = ap_uint_512_getDword(AP_UINT_FROM_PTR(p), wordidx0);
	unsigned int low_word = ap_uint_512_getDword(AP_UINT_FROM_PTR(p), wordidx1);

	if (wordidx0 == wordidx1)
	{
		// the same word, just shift right to put lowest bit in position 0
		// w0 |     [h        l]       |
		// w1 |     [h        l]       |
  		//r = (low_word >> bitidx1) & mask;

		unsigned int low_mask = (mask << bitidx1);
		unsigned int low_nmask = ~low_mask;
		low_word = (low_word & low_nmask) | (value << bitidx1);
		ap_uint_512_setDword(p, wordidx1, low_word);
	}
	else
	{
		// different word, the high bit is in position bitidx0 and should be in size -1 
		// w0 |                    [h  |
		// w1 |     l]                 |
		//r = ((high_word << (size -1 - bitidx0)) | (low_word >> bitidx1)) & mask;

		unsigned int high_mask = (mask >> (size-1-bitidx0));
		unsigned int high_nmask = ~high_mask;
		high_word = (high_word & high_nmask) | (value >> (size-1-bitidx0));
		ap_uint_512_setDword(p, wordidx0, high_word);

		unsigned int low_mask = (mask << bitidx1);
		unsigned int low_nmask = ~low_mask;
		low_word = (low_word & low_nmask) | (value << bitidx1);
		ap_uint_512_setDword(p, wordidx1, low_word);
	}

}

void ap_uint_1024_set_range_high_32(ap_uint_1024p p, unsigned int offset, unsigned int size, unsigned int value)
{
	unsigned int mask = (1 << size) -1;

	int highest_bit = 1024 - 1 -  offset;
	int lowest_bit = highest_bit + 1 - size;

	int wordidx0 = highest_bit / 32;
	int bitidx0 = highest_bit % 32;
  
	int wordidx1 = lowest_bit / 32;
	int bitidx1 = lowest_bit % 32;

	unsigned int high_word = ap_uint_1024_getDword(AP_UINT_FROM_PTR(p), wordidx0);
	unsigned int low_word = ap_uint_1024_getDword(AP_UINT_FROM_PTR(p), wordidx1);

	if (wordidx0 == wordidx1)
	{
		// the same word, just shift right to put lowest bit in position 0
		// w0 |     [h        l]       |
		// w1 |     [h        l]       |
  		//r = (low_word >> bitidx1) & mask;

		unsigned int low_mask = (mask << bitidx1);
		unsigned int low_nmask = ~low_mask;
		low_word = (low_word & low_nmask) | (value << bitidx1);
		ap_uint_1024_setDword(p, wordidx1, low_word);
	}
	else
	{
		// different word, the high bit is in position bitidx0 and should be in size -1 
		// w0 |                    [h  |
		// w1 |     l]                 |
		//r = ((high_word << (size -1 - bitidx0)) | (low_word >> bitidx1)) & mask;

		unsigned int high_mask = (mask >> (size-1-bitidx0));
		unsigned int high_nmask = ~high_mask;
		high_word = (high_word & high_nmask) | (value >> (size-1-bitidx0));
		ap_uint_1024_setDword(p, wordidx0, high_word);

		unsigned int low_mask = (mask << bitidx1);
		unsigned int low_nmask = ~low_mask;
		low_word = (low_word & low_nmask) | (value << bitidx1);
		ap_uint_1024_setDword(p, wordidx1, low_word);
	}

}


/**
* Return the number of bits (size) from the starting high bit start of the word p
*/
unsigned int ap_uint_512_range_high_32(ap_uint_512 p, unsigned int offset, unsigned int size)
{
	unsigned int r = 0;
	unsigned int mask = (1 << size) -1;

	int highest_bit = 512 - 1 -  offset;
	int lowest_bit = highest_bit + 1 - size;

	int wordidx0 = highest_bit / 32;
	int bitidx0 = highest_bit % 32;
  
	int wordidx1 = lowest_bit / 32;
	int bitidx1 = lowest_bit % 32;

	unsigned int high_word = ap_uint_512_getDword(p, wordidx0);
	unsigned int low_word = ap_uint_512_getDword(p, wordidx1);

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
	//printf("range[%d]=", offset);
	//printf(" (%d)", r);
	//printf("\n");
#endif

	return r;
}

unsigned int ap_uint_1024_range_high_32(ap_uint_1024 p, unsigned int offset, unsigned int size)
{
	unsigned int r = 0;
	unsigned int mask = (1 << size) -1;

	int highest_bit = 1024 - 1 -  offset;
	int lowest_bit = highest_bit + 1 - size;

	int wordidx0 = highest_bit / 32;
	int bitidx0 = highest_bit % 32;
  
	int wordidx1 = lowest_bit / 32;
	int bitidx1 = lowest_bit % 32;

	unsigned int high_word = ap_uint_1024_getDword(p, wordidx0);
	unsigned int low_word = ap_uint_1024_getDword(p, wordidx1);

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
	//printf("range[%d]=", offset);
	//printf(" (%d)", r);
	//printf("\n");
#endif

	return r;
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


