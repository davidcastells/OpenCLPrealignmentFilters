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


string bitHamming(string& pattern, string& text)
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
	
	if (v == 0)
		return ret;
	if (v > 0)
	{
		for (int i=0; i < v; i++)
		{
			ret.erase(0, 1);
			ret.push_back('-');	// invalid base
		}
	}
	else
	{
		v = -v;
		for (int i=0; i < v; i++)
		{
			ret.insert(0, "-");	// invalid base
			ret.erase(str.size()-1, 1);
		}
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
	string ac = zeros(pl);

	
	for (int i=0; i < pattern.size(); i++)
	{
		int maxz = 0;
		char b = '1';
		
		for (int th = -threshold; th <= threshold; th++)
		{
			string shifted = shiftLeft(pattern, th);
			string hamming = bitHamming(shifted, text);

			if (verbose)
				printf("h1 %s\n", hamming.c_str());

			// extend the hamming vector to ignore the corner cases at the end of the pattern
			hamming = hamming + ones(WS);

			if (verbose)
				printf("h2 %s\n", hamming.c_str());

			string part = range(hamming, i, WS);
			int cz = countZeros(part);
			
			if (verbose)
				printf("[%d][%d] %s = %d\n", i, th, part.c_str(), cz);

			if ((cz > maxz) || ((cz == maxz) && (part[0]=='0')))
			{
				maxz = cz;
				b = part[0];
			}
		}

		ac[i] = b;
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

int Kmers_SW(string pattern, string text, int threshold)
{
	int k = 5;

	string fp = kmerFingerprint(pattern, k);
	string ft = kmerFingerprint(text, k);

	string nft = bitNot(ft);
	string anded = bitAnd(fp, nft);

	int detectedErrors = popCount(anded);

	detectedErrors = (detectedErrors + k -1) / k;

	if (verbose)
		printf("Detected Errors %d\n", detectedErrors);

	return detectedErrors;
}


