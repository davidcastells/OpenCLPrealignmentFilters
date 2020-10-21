 
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
	ap_uint_512 w1;	// high		
	ap_uint_512 w0;	// low
	
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

	switch (wordidx)
	{
		case 0: v->w0 = (v->w0 & nmask) | (value << (byteidx*8)); break;
		case 1: v->w1 = (v->w1 & nmask) | (value << (byteidx*8)); break;
		case 2: v->w2 = (v->w2 & nmask) | (value << (byteidx*8)); break;
		case 3: v->w3 = (v->w3 & nmask) | (value << (byteidx*8)); break;
		case 4: v->w4 = (v->w4 & nmask) | (value << (byteidx*8)); break;
		case 5: v->w5 = (v->w5 & nmask) | (value << (byteidx*8)); break;
		case 6: v->w6 = (v->w6 & nmask) | (value << (byteidx*8)); break;
		case 7: v->w7 = (v->w7 & nmask) | (value << (byteidx*8)); break;
		case 8: v->w8 = (v->w8 & nmask) | (value << (byteidx*8)); break;
		case 9: v->w9 = (v->w9 & nmask) | (value << (byteidx*8)); break;
		case 10: v->w10 = (v->w10 & nmask) | (value << (byteidx*8)); break;
		case 11: v->w11 = (v->w11 & nmask) | (value << (byteidx*8)); break;
		case 12: v->w12 = (v->w12 & nmask) | (value << (byteidx*8)); break;
		case 13: v->w13 = (v->w13 & nmask) | (value << (byteidx*8)); break;
		case 14: v->w14 = (v->w14 & nmask) | (value << (byteidx*8)); break;
		case 15: v->w15 = (v->w15 & nmask) | (value << (byteidx*8)); break;			
	}
}

void ap_uint_512_or_word_byte(ap_uint_512p v, int wordidx, int byteidx, int value)
{
	switch (wordidx)
	{
		case 0: v->w0 = v->w0  | (value << (byteidx*8)); break;
		case 1: v->w1 = v->w1  | (value << (byteidx*8)); break;
		case 2: v->w2 = v->w2  | (value << (byteidx*8)); break;
		case 3: v->w3 = v->w3  | (value << (byteidx*8)); break;
		case 4: v->w4 = v->w4  | (value << (byteidx*8)); break;
		case 5: v->w5 = v->w5  | (value << (byteidx*8)); break;
		case 6: v->w6 = v->w6  | (value << (byteidx*8)); break;
		case 7: v->w7 = v->w7  | (value << (byteidx*8)); break;
		case 8: v->w8 = v->w8  | (value << (byteidx*8)); break;
		case 9: v->w9 = v->w9  | (value << (byteidx*8)); break;
		case 10: v->w10 = v->w10  | (value << (byteidx*8)); break;
		case 11: v->w11 = v->w11  | (value << (byteidx*8)); break;
		case 12: v->w12 = v->w12  | (value << (byteidx*8)); break;
		case 13: v->w13 = v->w13  | (value << (byteidx*8)); break;
		case 14: v->w14 = v->w14  | (value << (byteidx*8)); break;
		case 15: v->w15 = v->w15  | (value << (byteidx*8)); break;	
	}
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
	switch (wordidx)
	{
		case 0: return v.w0;
		case 1: return v.w1;
		case 2: return v.w2;
		case 3: return v.w3;
		case 4: return v.w4;
		case 5: return v.w5;
		case 6: return v.w6;
		case 7: return v.w7;
		case 8: return v.w8;
		case 9: return v.w9;
		case 10: return v.w10;
		case 11: return v.w11;
		case 12: return v.w12;
		case 13: return v.w13;
		case 14: return v.w14;
		case 15: return v.w15;	
	}


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
	ap_uint_512_zero(AP_UINT_PTR(v->w0));
	ap_uint_512_zero(AP_UINT_PTR(v->w1));
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
		1

	)	 return 1;
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
	ap_uint_512_set(AP_UINT_PTR(dst->w0), src.w0);
	ap_uint_512_set(AP_UINT_PTR(dst->w1), src.w1);

}

void ap_uint_512_set_bit(ap_uint_512p v, int bit, int x)
{
	int wordidx = bit / 32;
	int bitidx = (bit % 32);
	
	switch (wordidx)
	{
	
	case 0:
		if (x) v->w0 |= (1 << bitidx);
		else v->w0 &= (~(1 << bitidx));
		break;	
	case 1:
		if (x) v->w1 |= (1 << bitidx);
		else v->w1 &= (~(1 << bitidx));
		break;	
	case 2:
		if (x) v->w2 |= (1 << bitidx);
		else v->w2 &= (~(1 << bitidx));
		break;	
	case 3:
		if (x) v->w3 |= (1 << bitidx);
		else v->w3 &= (~(1 << bitidx));
		break;	
	case 4:
		if (x) v->w4 |= (1 << bitidx);
		else v->w4 &= (~(1 << bitidx));
		break;	
	case 5:
		if (x) v->w5 |= (1 << bitidx);
		else v->w5 &= (~(1 << bitidx));
		break;	
	case 6:
		if (x) v->w6 |= (1 << bitidx);
		else v->w6 &= (~(1 << bitidx));
		break;	
	case 7:
		if (x) v->w7 |= (1 << bitidx);
		else v->w7 &= (~(1 << bitidx));
		break;	
	case 8:
		if (x) v->w8 |= (1 << bitidx);
		else v->w8 &= (~(1 << bitidx));
		break;	
	case 9:
		if (x) v->w9 |= (1 << bitidx);
		else v->w9 &= (~(1 << bitidx));
		break;	
	case 10:
		if (x) v->w10 |= (1 << bitidx);
		else v->w10 &= (~(1 << bitidx));
		break;	
	case 11:
		if (x) v->w11 |= (1 << bitidx);
		else v->w11 &= (~(1 << bitidx));
		break;	
	case 12:
		if (x) v->w12 |= (1 << bitidx);
		else v->w12 &= (~(1 << bitidx));
		break;	
	case 13:
		if (x) v->w13 |= (1 << bitidx);
		else v->w13 &= (~(1 << bitidx));
		break;	
	case 14:
		if (x) v->w14 |= (1 << bitidx);
		else v->w14 &= (~(1 << bitidx));
		break;	
	case 15:
		if (x) v->w15 |= (1 << bitidx);
		else v->w15 &= (~(1 << bitidx));
		break;
	}
}

void ap_uint_512_or_bit(ap_uint_512p v, int bit, int x)
{
	int wordidx = bit / 32;
	int bitidx = (bit % 32);

	switch (wordidx)
	{
	
	case 0: v->w0 |= (x) ? (1 << bitidx) : 0; break;	
	case 1: v->w1 |= (x) ? (1 << bitidx) : 0; break;	
	case 2: v->w2 |= (x) ? (1 << bitidx) : 0; break;	
	case 3: v->w3 |= (x) ? (1 << bitidx) : 0; break;	
	case 4: v->w4 |= (x) ? (1 << bitidx) : 0; break;	
	case 5: v->w5 |= (x) ? (1 << bitidx) : 0; break;	
	case 6: v->w6 |= (x) ? (1 << bitidx) : 0; break;	
	case 7: v->w7 |= (x) ? (1 << bitidx) : 0; break;	
	case 8: v->w8 |= (x) ? (1 << bitidx) : 0; break;	
	case 9: v->w9 |= (x) ? (1 << bitidx) : 0; break;	
	case 10: v->w10 |= (x) ? (1 << bitidx) : 0; break;	
	case 11: v->w11 |= (x) ? (1 << bitidx) : 0; break;	
	case 12: v->w12 |= (x) ? (1 << bitidx) : 0; break;	
	case 13: v->w13 |= (x) ? (1 << bitidx) : 0; break;	
	case 14: v->w14 |= (x) ? (1 << bitidx) : 0; break;	
	case 15: v->w15 |= (x) ? (1 << bitidx) : 0; break;
	}
}


void ap_uint_1024_or_bit(ap_uint_1024p v, int bit, int x)
{
	if (bit < 512)
		ap_uint_512_or_bit(&v->w0, bit, x);
	else
		ap_uint_512_or_bit(&v->w1, bit-512, x);
	
}

void ap_uint_1024_set_bit(ap_uint_1024p v, int bit, int x)
{
	if (bit < 512)
		ap_uint_512_set_bit(AP_UINT_PTR(v->w0), bit, x);
	else
		ap_uint_512_set_bit(AP_UINT_PTR(v->w1), bit-512, x);

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

	switch (wordidx)
	{
	
	case 0: return (x.w0 >> bitidx) & 0x1;	
	case 1: return (x.w1 >> bitidx) & 0x1;	
	case 2: return (x.w2 >> bitidx) & 0x1;	
	case 3: return (x.w3 >> bitidx) & 0x1;	
	case 4: return (x.w4 >> bitidx) & 0x1;	
	case 5: return (x.w5 >> bitidx) & 0x1;	
	case 6: return (x.w6 >> bitidx) & 0x1;	
	case 7: return (x.w7 >> bitidx) & 0x1;	
	case 8: return (x.w8 >> bitidx) & 0x1;	
	case 9: return (x.w9 >> bitidx) & 0x1;	
	case 10: return (x.w10 >> bitidx) & 0x1;	
	case 11: return (x.w11 >> bitidx) & 0x1;	
	case 12: return (x.w12 >> bitidx) & 0x1;	
	case 13: return (x.w13 >> bitidx) & 0x1;	
	case 14: return (x.w14 >> bitidx) & 0x1;	
	case 15: return (x.w15 >> bitidx) & 0x1;
	}
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
	if (bit < 512)
		return ap_uint_512_get_bit(x.w0, bit);
	else
		return ap_uint_512_get_bit(x.w1, bit-512);
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
	ap_uint_512_or(a.w0 , b.w0, AP_UINT_PTR(ret->w0));
	ap_uint_512_or(a.w1 , b.w1, AP_UINT_PTR(ret->w1));

}

void ap_uint_1024_or_self(ap_uint_1024p a, ap_uint_1024 b)
{
	ap_uint_1024 aux;
	ap_uint_1024_set(AP_UINT_PTR(aux), AP_UINT_FROM_PTR(a));
	ap_uint_1024_or(aux, b, a);
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


