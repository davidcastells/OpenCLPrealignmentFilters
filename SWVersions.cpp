#include "SWVersions.h"

#include <stdlib.h>
#include <math.h>

extern bool verbose;
extern int gES;		// substitution errors
extern int gEI; 	// insertion errors
extern int gED; 	// deletion errors
extern int gTh;
extern int gFP;	// false positives (detected errors < theshold && real errors > threshold)  = detected errors | real errors
extern int gFN;	// false negatives (detected errors > threhold && real errors > threshold)



string bitXor(string& pattern, string& text)
{
	string ret;
	
	for (int i=0; i < text.size(); i++)
	{
		if (pattern[i] == text[i])
			ret.push_back('0');
		else
			ret.push_back('1');
	}
	
	return ret;
}

string bitHamming(string& pattern, string& text)
{
	return bitXor(pattern, text);
}


string bitNot(string& a)
{
	string ret;
	
	for (int i=0; i < a.size(); i++)
	{
		if (a[i] == '1') 
			ret.push_back('0');
		else
			ret.push_back('1');
	}
	
	return ret;
}


string bitAnd(string& a, string& b)
{
	string ret;
	
	for (int i=0; i < a.size(); i++)
	{
		if ((a[i] == '1') && (b[i] == '1'))
			ret.push_back('1');
		else
			ret.push_back('0');
	}
	
	return ret;
}

string bitOr(string& a, string& b)
{
	string ret;
	
	for (int i=0; i < a.size(); i++)
	{
		if ((a[i] == '1') || (b[i] == '1'))
			ret.push_back('1');
		else
			ret.push_back('0');
	}
	
	return ret;
}


int popCount(string& a)
{
	int n = 0;
	
	for (int i=0; i < a.size(); i++)
	{
		if (a[i] == '1')
			n++;
	}
	
	return n;
}

int countZeros(string& a)
{
	int n = 0;
	
	for (int i=0; i < a.size(); i++)
	{
		if (a[i] == '0')
			n++;
	}
	
	return n;
}

string spaces(int len)
{
	string ret;
	for (int i=0; i < len; i++)
		ret.push_back(' ');
	return ret;
}

string ones(int len)
{
	string ret;
	for (int i=0; i < len; i++)
		ret.push_back('1');
	return ret;
}


string zeros(int len)
{
	string ret;
	for (int i=0; i < len; i++)
		ret.push_back('0');
	return ret;
}

string shiftLeft(string& str, int v)
{
	string ret = str;
	int len = str.size();
	
	if (v == 0)
		return ret;
	if (v > 0)
	{
		for (int i=0; i < v; i++)
		{
			ret.push_back('-');	// invalid base
		}

		ret = ret.substr(v, len); // ret.erase(0, v);		// erase the [v] first values
	}
	else
	{
		v = -v;
		for (int i=0; i < v; i++)
		{
			ret.insert(0, "-");	// invalid base
			
		}
		
		ret = ret.substr(0, len); // ret.erase(str.size()-1, v);	// erase the [v] last values
	}
	
	return ret;
}

string removeShortZeros(string& hamming)
{
	string ret = hamming;
	bool longZero = false;
	
	for (int i=0; i<hamming.size(); i++)
	{
		if (ret[i] == '0') 
		{
			if (longZero == false)
			{
				if (i < (hamming.size()-2))
					if ((ret[i+1] == '1') || (ret[i+2] == '1'))
						ret[i] = '1';
					else
						longZero = true;
			}
		}
		else
			longZero = false;
	}
	
	return ret;
}

int SHD_SW(string& pattern, string& text, int th)
{
	string acum = ones(text.size());
	for (int i=-th; i <= th; i++)
	{
		string shifted = shiftLeft(pattern, i);
		string hamming = bitHamming(shifted, text);
		
		hamming = removeShortZeros(hamming);
		
		//printf("P[%d] %s\n", abs(i), shifted.c_str());
		if (verbose)
			printf("H[%2d] %s\n", i, hamming.c_str());
		
		acum = bitAnd(acum, hamming);
	}
	
	int detectedErrors = popCount(acum);

	if (verbose)
		printf("TOTAL %s  ERRORS:%d\n", acum.c_str(), detectedErrors);

	return detectedErrors;
}


string range(string& str, int offset, int len)
{
	string ret = zeros(len);

	for (int i=0; i < len; i++)
		ret[i] = str[offset+i];

	return ret;
}


int Shouji_SW(string& pattern, string& text, int threshold)
{
	int WS = 4;
	int pl = pattern.size();
	string ac = ones(pl);

	if (verbose)
	{
		for (int th = -threshold; th <= threshold; th++)
		{
			string shifted = shiftLeft(pattern, th);
			string hamming = bitHamming(shifted, text);
			printf("[%2d] %s\n", th, hamming.c_str());
		}
	}
	
	for (int i=0; i < pattern.size(); i++)
	{
		string acpart = range(ac, i, WS);

		int maxz = countZeros(acpart);
		string maxpart = acpart;
		char b = '1';
		
		for (int th = -threshold; th <= threshold; th++)
		{
			string shifted = shiftLeft(pattern, th);
			string hamming = bitHamming(shifted, text);

			//if (verbose)
			//	printf("h1 %s\n", hamming.c_str());

			// extend the hamming vector to ignore the corner cases at the end of the pattern
			hamming = hamming + ones(WS);

			//if (verbose)
			//	printf("h2 %s\n", hamming.c_str());

			string part = range(hamming, i, WS);
			int cz = countZeros(part);
			
			//if (verbose)
			//	printf("[%d][%d] %s = %d\n", i, th, part.c_str(), cz);

			if ((cz > maxz) || ((cz == maxz) && (part[0]=='0')))
			{
				maxz = cz;
				maxpart = part;
				//b = part[0];
			}
		}
		
		if (verbose)
		{
			printf("%s%s\n", spaces(6+i).c_str(), maxpart.c_str());
			printf("TOTAL %s\n", ac.c_str());
		}

		for (int k=0; k < WS; k++)
			ac[i+k] = maxpart[k];
	}

	int detectedErrors = popCount(ac);

	if (verbose)
		printf("TOTAL %s  ERRORS:%d\n", ac.c_str(), detectedErrors);

	return detectedErrors;	
}

string leftOnes(string& str)
{
	string ret;

	bool oneSeen = false;	

	for (int i=0; i < str.size(); i++)
	{
		oneSeen = oneSeen || (str[i] == '1');  
		if (oneSeen)
			ret.push_back('1');
		else
			ret.push_back('0');
	}

	//if (verbose)
	//	printf("LeftOnes(%s) = %s\n", str.c_str(), ret.c_str());	

	return ret;
}

int countLeadingZeros(string& str)
{
	int ret = 0;
	bool oneSeen = false;	

	for (int i=0; i < str.size(); i++)
	{
		oneSeen = oneSeen || (str[i] == '1');  
		if (!oneSeen)
			ret++;
	}

	//if (verbose)
	//	printf("CLZ(%s) = %d\n", str.c_str(), ret);

	return ret;
}

void extend(string& str, char c, int len)
{
	for (int i=0; i < len; i++)
		str.push_back(c);
}

int Sneaky_SW(string pattern, string text, int threshold)
{
	int detectedErrors = 0;
	int WS = 8;

	// extend to ensure the have multiple
	extend(pattern, '-', WS-1);
	extend(text, '-', WS-1); 

	if (verbose)
	{
		printf("P: %s\n", pattern.c_str());
		printf("T: %s\n", text.c_str());
	}

	int pl = pattern.size();

	for (int w=0; w < pl/WS; w++)
	{
		int kst = WS * w;
		//int ke = (WS*(w+1))
		string xp[threshold*2+1];

		for (int th = -threshold; th <= threshold; th++)
		{
			string shifted = shiftLeft(pattern, th);
			string hamming = bitHamming(shifted, text);
			xp[th+threshold] = range(hamming, kst, WS);

			if (verbose)
				printf("[%d][%2d] %s\n", w, th, xp[th+threshold].c_str());
		}

		int lz[WS];
		for (int i = 0; i < WS; i++)
		{
			string ac = ones(WS-i);
			for (int s=0; s < 2*threshold+1; s++)
			{
				string part = range(xp[s], i, WS-i);
				string cx = leftOnes(part);
				ac = bitAnd(cx, ac);
			}
			lz[WS-i-1] = countLeadingZeros(ac);

			if (verbose)
				printf("[%d][%d] CLZ %d\n", w, WS-i-1, lz[WS-i-1]);
		}

		int edits[WS];

		for (int i=0; i < WS; i++)
		{
			if (lz[i] == i)
				edits[i] = 1;
			else if (lz[i] == i+1)
				edits[i] = 0;
			else 
				edits[i] = edits[i-lz[i]-1] + 1;

			if (verbose)
				printf("[%d][%d] Edits %d\n", w, i, edits[i]);
		}

		if (verbose)
			printf("[%d] Min Edits %d\n", w, edits[WS-1]);

		detectedErrors += edits[WS-1];
	}
	
	if (verbose)
		printf("Detected Errors %d\n", detectedErrors);

	return detectedErrors;
}


int baseToNum(char b)
{
	if (b == 'A') return 0;
	if (b == 'C') return 1;
	if (b == 'G') return 2;
	if (b == 'T') return 3;
}

int kmerIndex(string& kmer)
{
	int idx = 0;

	for (int i=0; i<kmer.size(); i++)
	{
		idx = idx*4 + baseToNum(kmer[i]);
	}

	return idx;
}

string kmerFingerprint(string& pattern, int k)
{
	string fingerprint = zeros(pow(4, k));

	for (int i=0; i < pattern.size() - k +1 ; i++)
	{
		string kmer = range(pattern, i, k);
		int kmeridx = kmerIndex(kmer);
		fingerprint[kmeridx] = '1';
	}

	return fingerprint;
}

extern int gKmersK;

int Kmers_SW(string pattern, string text, int threshold)
{
	int k = gKmersK;

	string fp = kmerFingerprint(pattern, k);
	string ft = kmerFingerprint(text, k);

	// semi-global mode
	string nft = bitNot(ft);
	string anded = bitAnd(fp, nft);
	// global mode
	//string anded = bitXor(fp, ft);

	int detectedErrors = popCount(anded);

	detectedErrors = (detectedErrors + k -1) / k;

	if (verbose)
		printf("Detected Errors %d\n", detectedErrors);

	return detectedErrors;
}

int Shouji_Alser(string& pattern, string& text, int ErrorThreshold) 
//int ret = Shouji_Alser(pattern.size(), text.c_str(), pattern.c_str(), th,  GridSize,  DebugMode);
//int Shouji_Alser(int ReadLength, const char RefSeq[], const char ReadSeq[], int ErrorThreshold, int GridSize, int DebugMode)
{
	int ReadLength = pattern.size();
	const char* RefSeq = text.c_str(); 
	const char* ReadSeq = pattern.c_str(); 
	//int ErrorThreshold, 
	int GridSize = 4;
	int DebugMode = verbose;

	int Accepted=1;
	//int *HammingMask;
	int i0;
	int ii;
	int n;
	int e;
	int i1;
	int ShoujiMask[ReadLength];
	int count;
	int GridIndex;
	int MagnetCount;
	int d0;
	int i;
	int MaxZeros;
	int MaxZerosIndex;
	int GridBound ;
	int dd;

	/* 20-Sept-2016 */
	/*  Building the Hamming masks */
	ii = ((2 * ErrorThreshold) + 1) * ReadLength;
	int HammingMask[ii];
	int HammingMask1[ii];//this to maintain the order of the neighborhood map
	int C,K;
	/*
	HammingMask = (int *)malloc(ii * sizeof(int));
	if(!HammingMask)
	{
		printf("Out of Memory !!\n");
		exit(1);
	}
	*/	
	/*for (n = 0; n < ii; n++) {
		HammingMask[n] = 0;
	}
	
	
	//  Original Hamming Mask
	for (n = 0; n < ReadLength; n++) {
		if (ReadSeq[n]== RefSeq[n])
			HammingMask[n] = 0;
		else if (ReadSeq[n]!= RefSeq[n])
			HammingMask[n] = 1;
	}
	
	//  Incremental-step right shifted Hamming Masks (Deletion)
	for (e = 0; e < ErrorThreshold; e++) {
		// fill the shifted chars with Zeros
		for (i0 = 0; i0 <= e; i0++) {
		  HammingMask[((e +1) * ReadLength) + i0] = 0;
		}
		 ii=e+1;
		//  shift the Read chars and compare
		for (n = 0; n < (ReadLength-ii); n++) {
			if (ReadSeq[n]== RefSeq[n+ii]){
				HammingMask[((e+1) * ReadLength) + n + ii] = 0;}
			else if (ReadSeq[n]!= RefSeq[n+ii])
				HammingMask[((e+1) * ReadLength) + n + ii] = 1;
		}
	}
	
	
	//  Incremental-step left shifted Hamming Masks (Insertion)
	for (e = 0; e < ErrorThreshold; e++) {
		// fill the shifted chars with Zeros
		for (i0 = 0; i0 <= e; i0++) {
			HammingMask[((e + ErrorThreshold+1) * ReadLength) + (ReadLength-i0)-1] = 0;
		}
		ii=e+1;
		//  shift the Read chars and compare
		for (n = 0; n < ReadLength-e-1; n++) {
			//printf("%c",ReadSeq[n+ii]);
			//printf(" %c\n",RefSeq[n]);
			if (ReadSeq[n+ii]== RefSeq[n])
				HammingMask[((e + ErrorThreshold + 1) * ReadLength) + n] = 0;
			else if (ReadSeq[n+ii]!= RefSeq[n])
				HammingMask[((e + ErrorThreshold + 1) * ReadLength) + n] = 1;
		}
	}
	
	// END of Building the Hamming masks */

	count=0;
	// Original Hamming Mask
	for (n = (ReadLength-1); n >=0 ; n--) {
		if (ReadSeq[n]!= RefSeq[n]){
			HammingMask[n] = 1;
			count++;
		}
		else{
			HammingMask[n] = 0;
			
		}
	}
	
	if (count<=(ErrorThreshold))
		return count;

	if (ErrorThreshold==0) 
		return count;
	
	if (ErrorThreshold>0) {
		// Shifted Hamming Masks
		for (e = 1; e <= ErrorThreshold; e++) {
			ii = e * ReadLength;
			dd = ii + (ErrorThreshold * ReadLength);
			// fill the shifted chars with Zeros
			for (i0 = e-1; i0 >=0; i0--) {
				// Deletion
				HammingMask[ii + i0] = 1;
				// Insertion
				HammingMask[dd + (ReadLength-i0)-1] = 1;
			}
			count=0;
			//  shift the Read chars and compare
			for (n = (ReadLength-e-1); n >=0 ; n--) {
				//  Incremental-step right shifted Hamming Masks (Deletion)
				if (ReadSeq[n]!= RefSeq[n+e])
					HammingMask[ii + n + e] = 1;
				else{
					HammingMask[ii + n + e] = 0;
					count++;
				}
			}
			if (count>=(ReadLength-ErrorThreshold))
				return 1;
			count=0;
			for (n = (ReadLength-e-1); n >=0 ; n--) {
				// Incremental-step left shifted Hamming Masks (Insertion)
				if (ReadSeq[n+e]!= RefSeq[n])
					HammingMask[dd + n] = 1;
				else{
					HammingMask[dd + n] = 0;
					count++;
				}
			}
			if (count>=(ReadLength-ErrorThreshold))
				return count;
		}
		// END of Building the Hamming masks

		// This is to reorder the bit-vector to match the same order of the neighborhood map
		/*for(n=0; n<(((2*ErrorThreshold)+1)*ReadLength);n++){
			HammingMask1[n]=HammingMask[n];
		}
		C=ErrorThreshold+1;
		K=0;
		for (n = 0; n < (((ErrorThreshold))*ReadLength); n++) {
			if ( n % 100 == 0){
				C=C-1;
				K=0;
			}
			HammingMask[n]=HammingMask1[K+(C*ReadLength)];
			K=K+1;
		}
		for(n=0; n<ReadLength;n++){
			HammingMask[n+((ErrorThreshold)*ReadLength)]=HammingMask1[n];
		}*/
		// This is to reorder the bit-vector to match the same order of the neighborhood map
		
		if (DebugMode==1) {
			printf("\nHamming \n");
			for (n = 0; n < (((2*ErrorThreshold)+1)*ReadLength); n++) {
				if ( n % ReadLength == 0)
					printf("\n");
				printf("%d", HammingMask[n]  );
			}
			printf("\n\n\n\n");
		}


		/*  Search for Longest Consecutive Zeros in a sliding window fashion*/
		for (i0 = 0; i0 < ReadLength; i0++) {
			//ShoujiMask[i0] = HammingMask[i0+((ErrorThreshold)*ReadLength)];
			ShoujiMask[i0] = HammingMask[i0];
		}
		GridBound = ReadLength - GridSize + 1;
		count=0;
		d0 = (2 * ErrorThreshold) + 1;
		for (GridIndex = 0; GridIndex < ReadLength; GridIndex++) {
			
			if (GridIndex <= (ReadLength - GridSize) ) {
				MaxZeros = 0;
				MaxZerosIndex=0;
				for (i = 0; i < d0; i++) {
					count = 0;
					for (i1 = 0; i1 < GridSize; i1++) {
						if (DebugMode==1) {
							printf("%d", HammingMask[(i * ReadLength) + (GridIndex + i1)] );
						}
						if (HammingMask[(i * ReadLength) + (GridIndex + i1)] == 0) {
							count++ ;
						}
					}
					if (DebugMode==1) {
						printf("\n");
					}
					//printf("count:%d \n", count);
					if (count > MaxZeros) {
						MaxZeros = count;
						MaxZerosIndex = i;
					}
					else if (count == MaxZeros) {
						if ((HammingMask[(i * ReadLength) + (GridIndex)]==0) && (HammingMask[(i * ReadLength) + (GridIndex + 1)]==0)&& (HammingMask[(i * ReadLength) + (GridIndex + 2)]==0))
							MaxZerosIndex = i;
						else if ((HammingMask[(i * ReadLength) + (GridIndex)]==0) && (HammingMask[(i * ReadLength) + (GridIndex + 1)]==0))
							MaxZerosIndex = i;
						else if (HammingMask[(i * ReadLength) + (GridIndex)]==0)
							MaxZerosIndex = i;
					}
				}
				MagnetCount=0;
				for (i0 = 0; i0 < GridSize; i0++) {
					if (ShoujiMask[GridIndex + i0] == 0)
						MagnetCount++;
				}
				//printf("Max%d	\n", MaxZeros);
				if (MaxZeros > MagnetCount) 
				{
					
					 {
						for (i0 = 0; i0 < GridSize; i0++) {
							ShoujiMask[GridIndex + i0] = HammingMask[(MaxZerosIndex * ReadLength) + (GridIndex + i0)];
						}
					}
				}
				
				
				if (DebugMode==1) {
					printf("The selected seed is: ");
					for (i0 = 0; i0 < GridSize; i0++) {
						printf("%d", HammingMask[(MaxZerosIndex * ReadLength) + (GridIndex + i0)]);
					}
					printf("\n");
					for (n = 0; n < ReadLength; n++) {
						printf("%d", ShoujiMask[n]);
					}
					printf("\n");
					for (n = 0; n < GridBound; n++) {
						if (n==GridIndex)
							printf("****");
						else
							printf("_");
					}
					printf("\n");
				}
			}
			else if (GridIndex <= (ReadLength - 3) ) {
				MaxZeros = 0;
				MaxZerosIndex=0;
				for (i = 0; i < d0; i++) {
					count = 0;
					for (i1 = 0; i1 < (ReadLength-GridIndex); i1++) {
						if (DebugMode==1) {
							printf("%d", HammingMask[(i * ReadLength) + (GridIndex + i1)] );
						}
						if (HammingMask[(i * ReadLength) + (GridIndex + i1)] == 0) {
							count++ ;
						}
					}
					if (DebugMode==1) {
						printf("\n");
					}
					//printf("count:%d \n", count);
					if (count > MaxZeros) {
						MaxZeros = count;
						MaxZerosIndex = i;
					}
					else if (count == MaxZeros) {
						if ((HammingMask[(i * ReadLength) + (GridIndex)]==0) && (HammingMask[(i * ReadLength) + (GridIndex + 1)]==0) && (HammingMask[(MaxZerosIndex * ReadLength) + (GridIndex)]==1))
							MaxZerosIndex = i;
						else if (HammingMask[(i * ReadLength) + (GridIndex)]==0 && HammingMask[(MaxZerosIndex * ReadLength) + (GridIndex)]==1)
							MaxZerosIndex = i;
					}
				}
				MagnetCount=0;
				for (i0 = 0; i0 < (ReadLength-GridIndex); i0++) {
					if (ShoujiMask[GridIndex + i0] == 0)
						MagnetCount++;
				}
				//printf("Max%d	\n", MaxZeros);
				if (MaxZeros > MagnetCount) {
					for (i0 = 0; i0 < (ReadLength-GridIndex); i0++) {
						ShoujiMask[GridIndex + i0] = HammingMask[(MaxZerosIndex * ReadLength) + (GridIndex + i0)];
					}
				}
				if (DebugMode==1) {
					printf("The selected seed is: ");
					for (i0 = 0; i0 < (ReadLength-GridIndex); i0++) {
						printf("%d", HammingMask[(MaxZerosIndex * ReadLength) + (GridIndex + i0)]);
					}
					printf("\n");
					for (n = 0; n < ReadLength; n++) {
						printf("%d", ShoujiMask[n]);
					}
					printf("\n");
					for (n = 0; n < GridBound; n++) {
						if (n==GridIndex)
							printf("****");
						else
							printf("_");
					}
					printf("\n");
				}
			}
			count = 0;
			for (n = 0; n < GridIndex; n++) {
				if (ShoujiMask[n] == 1 && ShoujiMask[n+1] == 1){
					count++;
					n++;
				}
				else if (ShoujiMask[n] == 1)
					count++ ;
			}
			if (DebugMode==1) 
				printf("count: %d\n", count);

			if (count> ErrorThreshold)
				return count;
		}

		/*  END of Search for Longest Consecutive Zeros */

	}

	if (ErrorThreshold>0){
	//	free(HammingMask);
		count = 0;
		for (n = 0; n < ReadLength; n++) {
			if (ShoujiMask[n] == 1 && ShoujiMask[n+1] == 1){
				count++;
				n++;
			}
			else if (ShoujiMask[n] == 1)
				count++ ;
			
		}
			for(n=0; n< ReadLength; n++) if(DebugMode) printf("%d",ShoujiMask[n]);
		
		if (DebugMode==1) printf("\ncount: %d\n", count);

		return count;
	}
	
	//printf("%d\n", count);
	return count;
}
