#include "adapter_xilinx.cl"

#ifdef ENTRY_TYPE_2
	#define WORD_BITS 1024
	#define ap_uint_onesHigh ap_uint_1024_onesHigh
	#define ap_uint_printBinHigh ap_uint_1024_printBinHigh
	#define ap_uint_pop_count ap_uint_1024_pop_count
#else
	#define WORD_BITS 512
	#define ap_uint_onesHigh ap_uint_512_onesHigh
	#define ap_uint_printBinHigh ap_uint_512_printBinHigh
	#define ap_uint_pop_count ap_uint_512_pop_count
#endif

#define BASE_SIZE 2


int min2(int a, int b)
{
   if (a < b)
return a;
else 
return b;
}

int max2(int a, int b)
{
	if (a > b) 
		return a; 
	else
		return b;
}

int absi(int a)
{
	if (a < 0) return -a;
	else return a;
}

#ifndef PREPROCESSING
#include <math.h>

#else
__hash__ include <math.h>

#endif


int LEV_THRESHOLD_BITS = ceil(log(LEV_THRESHOLD) / log(2));
int LEV_THRESHOLD_HALF = LEV_THRESHOLD/2;


unsigned int satAdd(unsigned int a, unsigned int b)
{
	// final mask
	int final_mask = (1 << (LEV_THRESHOLD_BITS+1) ) -1;


	// bits
	int lev_bits = LEV_THRESHOLD_BITS;
	int mask = 1 << lev_bits;
	int isASaturated = (a >> lev_bits) & 1;
	if (isASaturated)
		return mask & final_mask;
	else
		return ((a& final_mask) + (b& final_mask)) & final_mask;
}


ap_uint<1> equalBases(ap_uint<WORD_BITS> p, int i, ap_uint<WORD_BITS>,  int j)
{

	int srcidx0 = WORD_BITS - 1 -i*2;
	int srcidx1 = WORD_BITS - 2 -i*2;

	int srcjdx0 = WORD_BITS - 1 -j*2;
	int srcjdx1 = WORD_BITS - 2 -j*2;

	ap_uint<1> i0 = p[srcidx0];
	ap_uint<1> i1 = p[srcidx1];
	ap_uint<1> j0 = p[srcjdx0];
	ap_uint<1> j1 = p[srcjdx1];

	return (i0 ^ j0) | (i1 ^ j1);
}


unsigned int lev(ap_uint<WORD_BITS> pattern,  int plen, ap_uint<WORD_BITS> text,  int tlen)
{
	ap_uint<1> 	eq[tlen][plen];
	unsigned int	d[tlen][plen];

	for (int i = 0; i <= max2(PATTERN_LEN, TEXT_LEN); i++)
	{
#pragma HLS UNROLL
		for (int xinc = 0; xinc <= LEV_THRESHOLD_HALF; xinc++)
		{
#pragma HLS UNROLL
			int y = i;
			int x = i + xinc;

			if (x > 0 && y > 0)
				eq[x][y] = equalBases(text, x-1, pattern, y-1);
			else
				eq[x][y] = 0;


			#ifdef FPGA_DEBUG
			if (x > 0 && y > 0)
			{
				//printf("<%printf("neq_%d_%d", x, y);%>=%d ", eq_%d_%d", x, y);%>);
				//inlinePrintBases("pattern", y-1, "text", x-1);
			}
			#endif



			/*if (x <= LEV_THRESHOLD_HALF)
			{
				printf("\t%s %s = %d;\n", s_type.c_str(), d_var.c_str(), x);
				valInit = true;
				
			}*/
			

			d[x][y] = max2(x,y);

			if (x > 0) 
				d[x][y] = min2(d[x][y], satAdd(d[x-1][y], 1));
			if (y > 0 && xinc < LEV_THRESHOLD_HALF)
				d[x][y] = min2(d[x][y], satAdd(d[x][y-1], 1));
			if ((x>0) && (y>0))
				d[x][y] = min2(d[x][y], satAdd(d[x-1][y-1], eq[x][y]));


#ifdef FPGA_DEBUG
	//printf("<%printf(d_var.c_str());%> = %d\n", <%printf(d_var.c_str());%>);
#endif

		}
	
		for (int yinc = 1; yinc <= LEV_THRESHOLD_HALF; yinc++)
		{
#pragma HLS UNROLL
			int y = i + yinc;
			int x = i;


			if (x > 0 && y > 0)
				eq[x][y] = equalBases(text, x-1, pattern, y-1);
			else
				eq[x][y] = 0;


			#ifdef FPGA_DEBUG
			if (x > 0 && y > 0)
			{
				//printf("<%printf("neq_%d_%d", x, y);%>=%d ", <%printf("eq_%d_%d", x, y);%>);
				//inlinePrintBases("pattern", y-1, "text", x-1);
			}
			#endif

			/*if (y <= LEV_THRESHOLD_HALF)
			{
				printf("\t%s %s = %d;\n", s_type.c_str(), d_var.c_str(), y);
				valInit = true;
				
			}*/

			d[x][y] = max2(x,y);

			if (x > 0 && yinc < LEV_THRESHOLD_HALF)
				d[x][y] = min2(d[x][y], satAdd(d[x-1][y], 1));
			if (y > 0)
				d[x][y] = min2(d[x][y], satAdd(d[x][y-1], 1));
			if ((x>0) && (y>0))
				d[x][y] = min2(d[x][y] , satAdd(d[x-1][y-1], eq[x][y]));


#ifdef FPGA_DEBUG
	//printf("<%printf(d_var.c_str());%> = %d\n", <%printf(d_var.c_str());%>);
#endif

		}
	}

	return d[TEXT_LEN][PATTERN_LEN];
	
}



unsigned int computeDistance(ap_uint<WORD_BITS> pattern,  int plen, ap_uint<WORD_BITS> text,  int tlen)
{
	return lev(pattern,  plen, text,  plen);
}




