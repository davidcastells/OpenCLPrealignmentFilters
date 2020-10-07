#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>       

#include <string>
#include <vector>
#include <algorithm>

#include "FPGAKmerFilter.h"

bool gDoUsage = false;
int gPatternLen = 100;
int gTextLen = 140;
int gN = 1;
bool verbose = false;
int gES = 0;	// substitution errors
int gEI = 0; 	// insertion errors
int gED = 0; 	// deletion errors
int gPatternStart = -1;		// random pattern start offset
int gTh = 0;

int gFP = 0;	// false positives (detected errors < theshold && real errors > threshold)  = detected errors | real errors
int gFN = 0;	// false negatives (detected errors > threhold && real errors > threshold)

int gPid = -1; 	// OpenCL platform id

#define ORIGINAL_CHARACTER	'.'
#define SUBSTITUTION_CHARACTER 	'X'
#define INSERTION_CHARACTER 	'I'

using namespace std;

template<typename T>
bool contains(vector<T> v, T x)
{
      if (v.empty())
           return false;
      if (find(v.begin(), v.end(), x) != v.end())
           return true;
      else
           return false;
}

void parseOptions(int argc, char* args[])
{
	if (argc == 1)
		gDoUsage=true;
		
	for (int i=0; i < argc; i++)
	{
		if (strcmp(args[i], "-v") == 0)
			verbose = true;
		
		if (strcmp(args[i], "-n") == 0)
		{
			i++;
			gN = atoi(args[i]);
		}
		if (strcmp(args[i], "-ps") == 0)
		{
			i++;
			gPatternStart = atoi(args[i]);
		}
		if (strcmp(args[i], "-ES") == 0)
		{
			i++;
			gES = atoi(args[i]);
		}
		if (strcmp(args[i], "-EI") == 0)
		{
			i++;
			gEI = atoi(args[i]);
		}
		if (strcmp(args[i], "-ED") == 0)
		{
			i++;
			gED = atoi(args[i]);
		}
		
		if (strcmp(args[i], "-pl") == 0)
		{
			i++;
			gPatternLen = atoi(args[i]);
		}
		
		if (strcmp(args[i], "-tl") == 0)
		{
			i++;
			gTextLen = atoi(args[i]);
		}
		
		if (strcmp(args[i], "-th") == 0)
		{
			i++;
			gTh = atoi(args[i]);
		}

		if (strcmp(args[i], "-pid") == 0)
		{
			i++;
			gPid = atoi(args[i]);
		}
	}
}


void usage()
{
	printf("Uaage:\n");
	printf("filter-test [options]\n\n");
	printf("where options can be\n");
	printf("\t-v\tverbose output\n");
	printf("\t-N\tnumber of pairs\n");
	printf("\t-ps <offset>\tPattern start offset with respect to Text, random if not specified\n");
	printf("\t-ES <errors>\tNumber of substitution errors\n");
	printf("\t-EI <errors>\tNumber of insertion errors\n");
	printf("\t-ED <errors>\tNumber of deletion errors\n");
	printf("\t-pl <len>\tPattern Length\n");
	printf("\t-tl <len>\tText Length\n");
	exit(0);
}

char randomBase()
{
	char b[]={'A','C','G','T'};
	return b[rand()%4];
}

string randomSequence(int nlen)
{
	string s;
	for (int i=0; i < nlen; i++)
	{
		char rc = randomBase();
		s.push_back(rc);
	}
	
	return s;
}

string randomSubtext(string& text, int nlen)
{
	int tlen = text.size();
	if (nlen > tlen)
	{
		printf("#ERROR: pattern cannot be biger than text\n");
		exit(-1);
	}
	if (nlen == tlen)
		return text;
	
	int startmax = tlen - nlen;
	
	return text.substr(rand() % startmax, nlen);
}

string createChangesString(string& pattern)
{
	string ret;
	
	for (int i = 0; i < pattern.size(); i++)
	{
		ret.push_back(ORIGINAL_CHARACTER);	// original character 
	}
	
	return ret;
}

void createSubtitutions(string& pattern, string& changes, int n)
{
	int candidatePos;
	char candidate;
	int plen = pattern.size();
	
	for (int i=0; i<n; i++)
	{
		do
		{
			candidatePos = rand() % plen;
		} while (changes[candidatePos] != ORIGINAL_CHARACTER);
		
		changes[candidatePos] = SUBSTITUTION_CHARACTER;	// substitution
		
		do
		{
			candidate = randomBase();
		} while (candidate == pattern[candidatePos]);
		
		pattern[candidatePos] = candidate;		
	}
}


void createInsertions(string& pattern, string& changes, int n)
{
	int candidatePos;
	char candidate;
	int plen = pattern.size();
	
	for (int i=0; i<n; i++)
	{
		plen = pattern.size();
		
		// all insertion places are valid
		candidatePos = rand() % plen;
		
		char sins[]={randomBase(), 0};
		
		changes.insert(candidatePos, "I");	// insertion
		pattern.insert(candidatePos, sins);	
	}
}


void createDeletions(string& pattern, string& changes, int n)
{
	int candidatePos;
	char candidate;
	int plen = pattern.size();
	
	for (int i=0; i<n; i++)
	{
		do
		{
			candidatePos = rand() % plen;
		} while (changes[candidatePos] != ORIGINAL_CHARACTER);
		
		changes.erase(candidatePos, 1);	// deletion
		pattern.erase(candidatePos, 1);			
	}
}

string ones(int len)
{
	string ret;
	for (int i=0; i < len; i++)
		ret.push_back('1');
	return ret;
}

string shiftLeft(string str, int v)
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

string bitHamming(string pattern, string text)
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

string bitAnd(string a, string b)
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


int popCount(string a)
{
	int n = 0;
	
	for (int i=0; i < a.size(); i++)
	{
		if (a[i] == '1')
			n++;
	}
	
	return n;
}

string removeShortZeros(string hamming)
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

void SHD_global(string pattern, string text, int th)
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
	
	int realErrors = gES + gEI + gED;
	
	if ((detectedErrors <= gTh) && (realErrors > gTh)) 	
		gFP++;
	
	if ((detectedErrors > gTh) && (realErrors <= gTh))
		gFN++;
}

void createPair(string& pattern, string& text)
{
	text = randomSequence(gTextLen);
		
	if (gPatternStart < 0)
	{
		if (verbose)
			printf("[INFO] random position subtext\n");
		pattern = randomSubtext(text, gPatternLen);
	}
	else
		pattern = text.substr(0, gPatternLen);
	
	string changes = createChangesString(pattern);
	
	createSubtitutions(pattern, changes, gES);
	createInsertions(pattern, changes, gEI);
	createDeletions(pattern, changes, gED);
	
	if (verbose)
	{
		printf("T:   %s\n", text.c_str());
		printf("P:   %s\n", pattern.c_str());
		printf("C:   %s\n", changes.c_str());
	}
}

void testSequence()
{
	string pattern;
	string text;
	createPair(pattern, text);
	
	SHD_global(pattern, text, gTh);
}

void testSoftware()
{
	for (int i=0; i < gN; i++)
		testSequence();

		                              
	printf("FP: %d (%0.2f %%)  FN: %d (%0.2f %%)\n", gFP, (gFP*100.0/gN), gFN, (gFN*100.0/gN));
}

void testHardware()
{
	string pattern;
	string text;


	FPGAKmerFilter filter;
	filter.initOpenCL(gPid);
	filter.initKernels(0, "shd", 5);


	for (int i=0; i < gN; i++)
	{
		createPair(pattern, text);
		filter.addInput(pattern, text);
	}

	int realErrors = gES + gEI + gED;
	filter.computeAll(realErrors);

	filter.finalizeKernels();
	filter.finalizeOpenCL();
}

int main(int argc, char* args[])
{
	parseOptions(argc, args);
	
	srand (time(NULL));
	
	if (gDoUsage)
		usage();
	
	if (gPid < 0)
		testSoftware();
	else
		testHardware();


	
}
