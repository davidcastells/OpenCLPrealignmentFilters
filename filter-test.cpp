#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>       

#include <string>
#include <vector>
#include <algorithm>

#include "PrealignmentFilter.h"
#include "edlib.h"
#include "SWVersions.h"

using namespace std;

bool gDoUsage = false;
int gPatternLen = 100;
int gTextLen = 140;
int gN = 1;
int gTotalCorrect;
bool verbose = false;
int gES = 0;	// substitution errors
int gEI = 0; 	// insertion errors
int gED = 0; 	// deletion errors
int gPatternStart = -1;		// random pattern start offset
int gTh = 0;
int gKmersK = 5;	// by default the kmers-filter k is 5

int gFP = 0;	// false positives (detected errors < theshold && real errors > threshold)  = detected errors | real errors
int gFN = 0;	// false negatives (detected errors > threhold && real errors > threshold)

int gPid = -1; 	// OpenCL platform id
string gText;		// Text string for single test mode
string gPattern;	// Pattern string for single test mode


#define ORIGINAL_CHARACTER	'.'
#define SUBSTITUTION_CHARACTER 	'X'
#define INSERTION_CHARACTER 	'I'


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

EdlibAlignConfig gAlignConfig = edlibNewAlignConfig(-1, EDLIB_MODE_HW, EDLIB_TASK_DISTANCE, NULL, 0);

int recheckErrors(string& pattern, string& text)
{
	EdlibAlignResult ret = edlibAlign(pattern.c_str(), pattern.size(), text.c_str(), text.size(), gAlignConfig);

	return ret.editDistance;
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
		if (strcmp(args[i], "-t") == 0)
		{
			i++;
			gText = args[i];
			gN = -1;
			//printf("Setting text: %s\n", gText.c_str());
		}
		if (strcmp(args[i], "-p") == 0)
		{
			i++;
			gPattern = args[i];
			gN = -1;
		}
		if (strcmp(args[i], "-k") == 0)
		{
			i++;
			gKmersK = atoi(args[i]);
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
	printf("\t-th <errors>\nError threshold\n");
	printf("\t-pl <len>\tPattern Length\n");
	printf("\t-tl <len>\tText Length\n");
	printf("\t-pid <id>\tOpenCL Platform ID\n");
	printf("\t-t <str>\tThe Text Sequence (for an especific pair test)\n");
	printf("\t-p <str>\tThe Pattern Sequence (for an especific pair test)\n");
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

void testSequence(string& pattern, string& text)
{
	
	int detectedErrors;
	
	string aocx_file = AOCX_FILE;

	if (aocx_file.compare("shd") == 0)
		detectedErrors = SHD_SW(pattern, text, gTh);
	else if (aocx_file.compare("shouji") == 0)
		detectedErrors = Shouji_SW(pattern, text, gTh);
	else if (aocx_file.compare("shoujialser") == 0)
		detectedErrors = Shouji_Alser(pattern, text, gTh);
	else if (aocx_file.compare("sneaky") == 0)
		detectedErrors = Sneaky_SW(pattern, text, gTh);
	else if (aocx_file.compare("kmers") == 0)
		detectedErrors = Kmers_SW(pattern, text, gTh);
	else
	{
		printf("Invalid algorithm %s\n", AOCX_FILE);
		exit(0);
	}

		
	int realErrors = gES + gEI + gED;
	
	if ((detectedErrors <= gTh) && (realErrors > gTh)) 	
	{
		int recheckedErrors = recheckErrors(pattern, text);

		if (recheckedErrors != realErrors)
		{
			if (verbose)
			{
				printf("EDLIB:%d PLANNED:%d\n", recheckedErrors, realErrors);
				printf("PATTERN: %s\n", pattern.c_str());
				printf("TEXT:    %s\n", text.c_str());
			}
			gTotalCorrect--;
		}
		else
			gFP++;
		
	}

	if ((detectedErrors > gTh) && (realErrors <= gTh))
	{
		int recheckedErrors = recheckErrors(pattern, text);

		if (recheckedErrors != realErrors)
		{
			if (verbose)
			{
				printf("EDLIB:%d PLANNED:%d\n", recheckedErrors, realErrors);
				printf("PATTERN: %s\n", pattern.c_str());
				printf("TEXT:    %s\n", text.c_str());
			}
			gTotalCorrect--;
		}
		else
			gFN++;
	}

}

void testSoftware()
{
	gTotalCorrect = gN;
	string pattern;
	string text;
		
	if (gN == -1)
	{
		// Single Test
		pattern = gPattern;
		text = gText;

		if (verbose)
			printf("Single Test Mode\n");

		gTotalCorrect = 1;
		testSequence(pattern, text);
	}
	else
		// Multiple Synthetic test
		for (int i=0; i < gN; i++)
		{
			createPair(pattern, text);
			testSequence(pattern, text);
		}

	printf("FP: %d (%0.2f %%)  FN: %d (%0.2f %%) Total: %d\n", gFP, (gFP*100.0/gTotalCorrect), gFN, (gFN*100.0/gTotalCorrect), gTotalCorrect);
}


void testHardware()
{
	string pattern;
	string text;

	string aocx_file = AOCX_FILE;

	PrealignmentFilter filter;
	filter.setVerbose(verbose);
	filter.setReportTime(true);
	filter.initOpenCL(gPid);
	filter.initKernels(0,  aocx_file , gTh);


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
