 
// the numbers are stored in less significant order 

#ifdef FPGA_EMULATION
	typedef unsigned int ap_uint_512[512/32]; 
	typedef unsigned int ap_uint_512p[512/32];

	typedef unsigned int ap_uint_1024[1024/32];
	typedef unsigned int ap_uint_1024p[1024/32];

	#define AP_UINT_PTR(x)	      x
	#define AP_UINT_FROM_PTR(x)   x

#else
	#include "ihc_apint.h"
	typedef ap_uint<512> ap_uint_512;
	typedef ap_uint<512>* ap_uint_512p;

	typedef struct 
	{
		ap_uint_512 w1;	// high		
		ap_uint_512 w0;	// low
		
	} ap_uint_1024;

	typedef ap_uint_1024* ap_uint_1024p;
 
	#define AP_UINT_PTR(x)	&(x)
	#define AP_UINT_FROM_PTR(x)	*x
#endif

void ap_uint_512_setLowByte(ap_uint_512p v, int index, int value);
void ap_uint_512_zero(ap_uint_512p v);
void ap_uint_512_set_bit(ap_uint_512p v, int bit, int x);
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
* Sets a byte value in the lowest n byte of the number (starting from the right / LSB)
*
* @param v pointer to the number
* @param index base position in bytes
* @param value to set
*/
void ap_uint_512_setLowByte(ap_uint_512p v, int index, int value)
{	
#ifdef FPGA_EMULATION
	int wordidx = (index * 8) / 32;
	int byteidx = (index % (32/8));
	
	unsigned int mask = (0xFF << (byteidx * 8));
	unsigned int nmask = ~mask;
	
	v[wordidx] = (v[wordidx] & nmask) | (value << (byteidx*8));
#else
	ap_uint<512> avalue = value;
	ap_uint<512> bv = avalue << (8 * index);
	ap_uint<512> mask = (0xFF) << (8 * index);
	ap_uint<512> nmask = ~mask;
	
	*v = (*v & nmask) | bv; 
#endif
}

void ap_uint_512_orLowByteConcurrent(ap_uint_512p v, int index, int value)
{	
#ifdef FPGA_EMULATION
	int wordidx = (index * 8) / 32;
	int byteidx = (index % (32/8));
	
	//unsigned int mask = (0xFF << (byteidx * 8));
	//unsigned int nmask = ~mask;
	
	v[wordidx] = v[wordidx]  | (value << (byteidx*8));
#else
	ap_uint<512> bv = value << (8 * index);
	//ap_uint<512> mask = (0xFF) << (8 * index);
	//ap_uint<512> nmask = ~mask;
	
	*v = (*v)  | bv; 
#endif
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
	ap_uint_512 w;
	ap_uint_512_shift_right(v, (index * 8), AP_UINT_PTR(w));
	
#ifdef FPGA_EMULATION
	return w[0] & 0xFF;
#else
	return w & 0xFF;
#endif
}

unsigned int ap_uint_512_getDword(ap_uint_512 v, int index)
{	
#ifdef FPGA_EMULATION
	ap_uint_512 w;
	ap_uint_512_shift_right(v, (index * 32), AP_UINT_PTR(w));
	
	return w[0];
#else

	return (v >> (index*32)) & 0xFFFFFFFF;
#endif
}

/**
* Resets the variable (set to zero)
*/
void ap_uint_512_zero(ap_uint_512p v)
{
#ifdef FPGA_EMULATION
	for (int i=0; i < 512/32; i++)
	{
		v[i] = 0;
	}
#else
	*v = 0;
#endif
}

/**
* Resets the variable (set to zero)
*/
void ap_uint_1024_zero(ap_uint_1024p v)
{
#ifdef FPGA_EMULATION
	for (int i=0; i < 1024/32; i++)
	{
		v[i] = 0;
	}
#else
	v->w0 = 0;
	v->w1 = 0;
#endif
}


int ap_uint_512_isZero(ap_uint_512 v)
{
#ifdef FPGA_EMULATION
	for (int i=0; i < 512/32; i++)
		if (v[i] != 0) 
			return 1;
	
	return 0;
#else
	return v == 0;
#endif
}

void ap_uint_512_set(ap_uint_512p dst, ap_uint_512 src)
{
#ifdef FPGA_EMULATION
	for (int i=0; i < 512/32; i++)
		dst[i] = src[i];
#else
	*dst = src;
#endif
}


/**
* Copies a variable to another 
* @param destination
* @param source
*/
void ap_uint_1024_set(ap_uint_1024p dst, ap_uint_1024 src)
{
#ifdef FPGA_EMULATION
	for (int i=0; i < 1024/32; i++)
		dst[i] = src[i];
#else
	dst->w0 = src.w0;
	dst->w1 = src.w1;
#endif
}

void ap_uint_512_set_bit(ap_uint_512p v, int bit, int x)
{
#ifdef FPGA_EMULATION
	int wordidx = bit / 32;
	int bitidx = (bit % 32);
	
	if (x)
	{
		// set bit 
		v[wordidx] = v[wordidx] | (1 << bitidx);
	}
	else
	{
		// reset bit
		v[wordidx] = v[wordidx] & (~(1 << bitidx));
	}
#else
	ap_uint<512> one = 1;
	ap_uint<512> mask = one << bit;
	ap_uint<512> nmask = ~mask;
	
	if (x)
		*v = *v | mask;
	else
		*v = *v & nmask;
#endif
}

void ap_uint_512_or_bit(ap_uint_512p v, int bit, int x)
{
#ifdef FPGA_EMULATION
	int wordidx = bit / 32;
	int bitidx = (bit % 32);
	
	if (x)
	{
		// set bit 
		v[wordidx] = v[wordidx] | (1 << bitidx);
	}
	
#else
	ap_uint<512> one = 1;
	ap_uint<512> mask = one << bit;
	
	if (x)
		*v = *v | mask;
	
#endif
}


void ap_uint_1024_or_bit(ap_uint_1024p v, int bit, int x)
{
#ifdef FPGA_EMULATION
	int wordidx = bit / 32;
	int bitidx = (bit % 32);
	
	if (x)
	{
		// set bit 
		v[wordidx] = v[wordidx] | (1 << bitidx);
	}
#else
	if (bit < 512)
		ap_uint_512_or_bit(&v->w0, bit, x);
	else
		ap_uint_512_or_bit(&v->w1, bit-512, x);
	
#endif
}

void ap_uint_1024_set_bit(ap_uint_1024p v, int bit, int x)
{
#ifdef FPGA_EMULATION
	int wordidx = bit / 32;
	int bitidx = (bit % 32);
	
	if (x)
	{
		// set bit 
		v[wordidx] = v[wordidx] | (1 << bitidx);
	}
	else
	{
		// reset bit
		v[wordidx] = v[wordidx] & (~(1 << bitidx));
	}
#else
	if (bit < 512)
		ap_uint_512_set_bit(&v->w0, bit, x);
	else
		ap_uint_512_set_bit(&v->w1, bit-512, x);
#endif
}

void ap_uint_512_onesLow(ap_uint_512p v, int n)
{
	#pragma unroll
	for (int i=0; i < 512; i++)
	{
		ap_uint_512_set_bit(v, i, (i<n)?1:0);
	}
}

void ap_uint_512_onesHigh(ap_uint_512p v, int n)
{
	#pragma unroll
	for (int i=0; i < 512; i++)
	{
		ap_uint_512_set_bit(v, 512-1-i, (i<n)?1:0);
	}
}

int ap_uint_512_get_bit(ap_uint_512 x, int bit)
{
#ifdef FPGA_EMULATION
	int wordidx = bit / 32;
	int bitidx = (bit % 32);
	
	return (x[wordidx] >> bitidx) & 0x1;
#else
	return (x >> bit) & 0x1;
#endif
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
#ifdef FPGA_EMULATION
	int wordidx = bit / 32;
	int bitidx = (bit % 32);
	
	return (x[wordidx] >> bitidx) & 0x1;
#else
	if (bit < 512)
		return ap_uint_512_get_bit(x.w0, bit);
	else
		return ap_uint_512_get_bit(x.w1, bit-512);
#endif
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
#ifdef FPGA_EMULATION
	for (int i=0; i < 512/32; i++)
	{
		ret[i] = ~x[i];
	}
#else
	*ret = ~x;
#endif
}

void ap_uint_512_and(ap_uint_512 a, ap_uint_512 b, ap_uint_512p ret)
{
#ifdef FPGA_EMULATION
	for (int i=0; i < 512/32; i++)
	{
		ret[i] = a[i]&b[i];
	}
#else
	*ret = a & b;
#endif
}

void ap_uint_512_and_self(ap_uint_512p a, ap_uint_512 b)
{
	ap_uint_512 aux;
	ap_uint_512_set(AP_UINT_PTR(aux), AP_UINT_FROM_PTR(a));
	ap_uint_512_and(aux, b, a);
}

void ap_uint_512_or(ap_uint_512 a, ap_uint_512 b, ap_uint_512p ret)
{
#ifdef FPGA_EMULATION
	for (int i=0; i < 512/32; i++)
	{
		ret[i] = a[i]|b[i];
	}
#else
	*ret = a | b;
#endif
}

void ap_uint_1024_or(ap_uint_1024 a, ap_uint_1024 b, ap_uint_1024p ret)
{
#ifdef FPGA_EMULATION
	for (int i=0; i < 1024/32; i++)
	{
		ret[i] = a[i]|b[i];
	}
#else
	ret->w0 = a.w0 | b.w0;
	ret->w1 = a.w1 | b.w1;
#endif
}

void ap_uint_1024_or_self(ap_uint_1024p a, ap_uint_1024 b)
{
	ap_uint_1024 aux;
	ap_uint_1024_set(AP_UINT_PTR(aux), AP_UINT_FROM_PTR(a));
	ap_uint_1024_or(aux, b, a);
}



void ap_uint_512_xor(ap_uint_512 a, ap_uint_512 b, ap_uint_512p ret)
{
#ifdef FPGA_EMULATION
	for (int i=0; i < 512/32; i++)
	{
		ret[i] = a[i]^b[i];
	}
#else
	*ret = a ^ b;
#endif
}


void ap_uint_512_shift_right(ap_uint_512 x, int shift, ap_uint_512p r)
{
#ifdef FPGA_EMULATION
	for (int i=0; i < 512; i++)
	{
		int src = i+shift;
		
		if (src >= 512)
			ap_uint_512_set_bit(r, i, 0);
		else
			ap_uint_512_set_bit(r, i, ap_uint_512_get_bit(x, src));
	}
#else
	*r = x >> shift;
#endif
}


void ap_uint_512_shift_right_self(int shift, ap_uint_512p r)
{
	ap_uint_512 aux;
	ap_uint_512_set(AP_UINT_PTR(aux), AP_UINT_FROM_PTR(r));
	ap_uint_512_shift_right(aux, shift, r);
}



void ap_uint_512_shift_left(ap_uint_512 x, int shift, ap_uint_512p r)
{
#ifdef FPGA_EMULATION
	for (int i=0; i < 512; i++)
	{
		int src = i-shift;
		
		if (src < 0)
			ap_uint_512_set_bit(r, i, 0);
		else
			ap_uint_512_set_bit(r, i, ap_uint_512_get_bit(x, src));
	}
#else
	*r = x << shift;
#endif
}


void ap_uint_512_shift_left_self(int shift, ap_uint_512p r)
{
	ap_uint_512 aux;
	ap_uint_512_set(AP_UINT_PTR(aux), AP_UINT_FROM_PTR(r));
	ap_uint_512_shift_left(aux, shift, r);
}


#ifdef FPGA_EMULATION	
void ap_uint_512_print(ap_uint_512 r)
{
	printf("0x");

	for (int i=0; i < 512/32; i++)
		printf("%08X ", ap_uint_512_getDword(r, (512/32)-1-i));
}
#else
void ap_uint_512_print(ap_uint<512> r)
{
	printf("0x");

	for (int i=512-8; i >=0; i -= 8)
	{
		unsigned int v = (r >> i) & 0xFF;
		printf("%02X", v);
	}	
}
#endif

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
	

	unsigned char b = ap_uint_512_getLowByte(v, 1);
	printf("5) GetByte [1] = 0x%02X\n", b);

}

#endif

