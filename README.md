# OpenCL pre-alignment filters Test

This is a test application to test the effectiveness of sequence-alignment pre-alignment filters.

This kind of filters are used to discard sequence pairs that have a higher number of errors than a given threshold.

The test builds synthetic sequences with a number of errors.
We can control the number and type of the errors introduced, so we can analyze the response of the filter in various situations.

The source code embedds the edlib (https://github.com/Martinsos/edlib/) to check the number of errors when necessary.


## Options

| Parameter | Description |
|-----|----------------|
| -v | verbose output |
| -pid <number> | Identifier of the OpenCL Platform to use |
| -tl <number> | Length of the Text |
| -pl <number> | Length of the pattern |
| -ES <number> | Number of Substitution Errors |
| -EI <number> | Number of Insertion Errors |
| -ED <number> | Number of Deletion Errors |

## Examples

filter-test -pid 0 -ES 2 -tl 100 -pl 100 -n 10

It creates 10 sequence pairs. The text length and pattern length are all equal to 100. The pattern has two substitution errors compared with the text. The OpenCL platform 0 is used.
