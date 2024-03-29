# OpenCL pre-alignment filters Test

This is a test application to test the effectiveness of sequence-alignment pre-alignment filters.

This kind of filters are used to discard sequence pairs that have a higher number of errors than a given threshold.

The test main goal is to build synthetic sequences with a number of controlled errors to analyze the response of the filter in various situations.

The source code embedds the edlib (https://github.com/Martinsos/edlib/) to check the number of errors when necessary.

## Modes of operation

The application can work in two modes of operation.

-- Single Test
   In this mode the user provides the sequences to be compared

-- Multiple Synthetic Test
   In this mode the user provides the characteristics of the features that are randomly created. 

## Options

filter-test [options]

where options can be


| Parameter | Description |
|-----|----------------|
| -v | verbose output |
| -filter <filter> | Filter type, any of [shd|kmer|shouji|sneaky|lev|myers|bpc] |
| -board <filter> | FPGA board, any of [OSK|DE5|PAC10|PACS10|HARP|U50] |
| -pid <number> | Identifier of the OpenCL Platform to use |
| -tl <number> | Length of the Text |
| -pl <number> | Length of the pattern |
| -ES <number> | Number of Substitution Errors |
| -EI <number> | Number of Insertion Errors |
| -ED <number> | Number of Deletion Errors |
| -th <number> | The error threshold |
| -N <number> | The number of pairs to test |
| -t <string> | The text sequence for a single test |
| -p <string> | The pattern sequence for a single test |
| -perfedlib | Test the performance of edlib |
| -f <filename> | Test the pairs from the file |
| -ps <offset> | Pattern start offset with respect to Text, random if not specified |
| -mem <num> | (EXPERIMENTAL) Number of memory banks used in the kernel (1 by default) |

## Examples

filter-test -filter shd -board U50 -pid 0 -ES 4 -th 3 -tl 100 -pl 100 -n 10

It creates 10 sequence pairs. The text length and pattern length are all equal to 100. The pattern has 4 substitution errors compared with the text and the detection threshold is set to 3. The OpenCL platform 0 is used (and it should refer to a Xilinx U50 board) and the SHD algorithm is tested.
   
## Citation
   
>@ARTICLE{9718100,  author={Castells-Rufas, David and Marco-Sola, Santiago and Moure, Juan Carlos and Aguado, Quim and Espinosa, Antonio},  journal={IEEE Access},   title={FPGA Acceleration of Pre-Alignment Filters for Short Read Mapping With HLS},   year={2022},  volume={10},  number={},  pages={22079-22100},  doi={10.1109/ACCESS.2022.3153032}}
