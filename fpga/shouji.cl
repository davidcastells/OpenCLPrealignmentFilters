
#include "adapter.cl"

#ifndef SHOUJI_THRESHOLD
#define SHOUJI_THRESHOLD	3
#endif

#ifndef SHOUJI_WINDOW_SIZE
#define SHOUJI_WINDOW_SIZE	4
#endif



void xorBases(ap_uint_512 p, ap_uint_512 t, ap_uint_512p r)
{
	int dst_511 = (((p.w15 >> 31)&1) ^ ((t.w15 >> 31)&1)) | (((p.w15 >> 30)&1) ^ ((t.w15 >> 30)&1)) ;
	int dst_510 = (((p.w15 >> 29)&1) ^ ((t.w15 >> 29)&1)) | (((p.w15 >> 28)&1) ^ ((t.w15 >> 28)&1)) ;
	int dst_509 = (((p.w15 >> 27)&1) ^ ((t.w15 >> 27)&1)) | (((p.w15 >> 26)&1) ^ ((t.w15 >> 26)&1)) ;
	int dst_508 = (((p.w15 >> 25)&1) ^ ((t.w15 >> 25)&1)) | (((p.w15 >> 24)&1) ^ ((t.w15 >> 24)&1)) ;
	int dst_507 = (((p.w15 >> 23)&1) ^ ((t.w15 >> 23)&1)) | (((p.w15 >> 22)&1) ^ ((t.w15 >> 22)&1)) ;
	int dst_506 = (((p.w15 >> 21)&1) ^ ((t.w15 >> 21)&1)) | (((p.w15 >> 20)&1) ^ ((t.w15 >> 20)&1)) ;
	int dst_505 = (((p.w15 >> 19)&1) ^ ((t.w15 >> 19)&1)) | (((p.w15 >> 18)&1) ^ ((t.w15 >> 18)&1)) ;
	int dst_504 = (((p.w15 >> 17)&1) ^ ((t.w15 >> 17)&1)) | (((p.w15 >> 16)&1) ^ ((t.w15 >> 16)&1)) ;
	int dst_503 = (((p.w15 >> 15)&1) ^ ((t.w15 >> 15)&1)) | (((p.w15 >> 14)&1) ^ ((t.w15 >> 14)&1)) ;
	int dst_502 = (((p.w15 >> 13)&1) ^ ((t.w15 >> 13)&1)) | (((p.w15 >> 12)&1) ^ ((t.w15 >> 12)&1)) ;
	int dst_501 = (((p.w15 >> 11)&1) ^ ((t.w15 >> 11)&1)) | (((p.w15 >> 10)&1) ^ ((t.w15 >> 10)&1)) ;
	int dst_500 = (((p.w15 >> 9)&1) ^ ((t.w15 >> 9)&1)) | (((p.w15 >> 8)&1) ^ ((t.w15 >> 8)&1)) ;
	int dst_499 = (((p.w15 >> 7)&1) ^ ((t.w15 >> 7)&1)) | (((p.w15 >> 6)&1) ^ ((t.w15 >> 6)&1)) ;
	int dst_498 = (((p.w15 >> 5)&1) ^ ((t.w15 >> 5)&1)) | (((p.w15 >> 4)&1) ^ ((t.w15 >> 4)&1)) ;
	int dst_497 = (((p.w15 >> 3)&1) ^ ((t.w15 >> 3)&1)) | (((p.w15 >> 2)&1) ^ ((t.w15 >> 2)&1)) ;
	int dst_496 = (((p.w15 >> 1)&1) ^ ((t.w15 >> 1)&1)) | (((p.w15 >> 0)&1) ^ ((t.w15 >> 0)&1)) ;
	int dst_495 = (((p.w14 >> 31)&1) ^ ((t.w14 >> 31)&1)) | (((p.w14 >> 30)&1) ^ ((t.w14 >> 30)&1)) ;
	int dst_494 = (((p.w14 >> 29)&1) ^ ((t.w14 >> 29)&1)) | (((p.w14 >> 28)&1) ^ ((t.w14 >> 28)&1)) ;
	int dst_493 = (((p.w14 >> 27)&1) ^ ((t.w14 >> 27)&1)) | (((p.w14 >> 26)&1) ^ ((t.w14 >> 26)&1)) ;
	int dst_492 = (((p.w14 >> 25)&1) ^ ((t.w14 >> 25)&1)) | (((p.w14 >> 24)&1) ^ ((t.w14 >> 24)&1)) ;
	int dst_491 = (((p.w14 >> 23)&1) ^ ((t.w14 >> 23)&1)) | (((p.w14 >> 22)&1) ^ ((t.w14 >> 22)&1)) ;
	int dst_490 = (((p.w14 >> 21)&1) ^ ((t.w14 >> 21)&1)) | (((p.w14 >> 20)&1) ^ ((t.w14 >> 20)&1)) ;
	int dst_489 = (((p.w14 >> 19)&1) ^ ((t.w14 >> 19)&1)) | (((p.w14 >> 18)&1) ^ ((t.w14 >> 18)&1)) ;
	int dst_488 = (((p.w14 >> 17)&1) ^ ((t.w14 >> 17)&1)) | (((p.w14 >> 16)&1) ^ ((t.w14 >> 16)&1)) ;
	int dst_487 = (((p.w14 >> 15)&1) ^ ((t.w14 >> 15)&1)) | (((p.w14 >> 14)&1) ^ ((t.w14 >> 14)&1)) ;
	int dst_486 = (((p.w14 >> 13)&1) ^ ((t.w14 >> 13)&1)) | (((p.w14 >> 12)&1) ^ ((t.w14 >> 12)&1)) ;
	int dst_485 = (((p.w14 >> 11)&1) ^ ((t.w14 >> 11)&1)) | (((p.w14 >> 10)&1) ^ ((t.w14 >> 10)&1)) ;
	int dst_484 = (((p.w14 >> 9)&1) ^ ((t.w14 >> 9)&1)) | (((p.w14 >> 8)&1) ^ ((t.w14 >> 8)&1)) ;
	int dst_483 = (((p.w14 >> 7)&1) ^ ((t.w14 >> 7)&1)) | (((p.w14 >> 6)&1) ^ ((t.w14 >> 6)&1)) ;
	int dst_482 = (((p.w14 >> 5)&1) ^ ((t.w14 >> 5)&1)) | (((p.w14 >> 4)&1) ^ ((t.w14 >> 4)&1)) ;
	int dst_481 = (((p.w14 >> 3)&1) ^ ((t.w14 >> 3)&1)) | (((p.w14 >> 2)&1) ^ ((t.w14 >> 2)&1)) ;
	int dst_480 = (((p.w14 >> 1)&1) ^ ((t.w14 >> 1)&1)) | (((p.w14 >> 0)&1) ^ ((t.w14 >> 0)&1)) ;
	int dst_479 = (((p.w13 >> 31)&1) ^ ((t.w13 >> 31)&1)) | (((p.w13 >> 30)&1) ^ ((t.w13 >> 30)&1)) ;
	int dst_478 = (((p.w13 >> 29)&1) ^ ((t.w13 >> 29)&1)) | (((p.w13 >> 28)&1) ^ ((t.w13 >> 28)&1)) ;
	int dst_477 = (((p.w13 >> 27)&1) ^ ((t.w13 >> 27)&1)) | (((p.w13 >> 26)&1) ^ ((t.w13 >> 26)&1)) ;
	int dst_476 = (((p.w13 >> 25)&1) ^ ((t.w13 >> 25)&1)) | (((p.w13 >> 24)&1) ^ ((t.w13 >> 24)&1)) ;
	int dst_475 = (((p.w13 >> 23)&1) ^ ((t.w13 >> 23)&1)) | (((p.w13 >> 22)&1) ^ ((t.w13 >> 22)&1)) ;
	int dst_474 = (((p.w13 >> 21)&1) ^ ((t.w13 >> 21)&1)) | (((p.w13 >> 20)&1) ^ ((t.w13 >> 20)&1)) ;
	int dst_473 = (((p.w13 >> 19)&1) ^ ((t.w13 >> 19)&1)) | (((p.w13 >> 18)&1) ^ ((t.w13 >> 18)&1)) ;
	int dst_472 = (((p.w13 >> 17)&1) ^ ((t.w13 >> 17)&1)) | (((p.w13 >> 16)&1) ^ ((t.w13 >> 16)&1)) ;
	int dst_471 = (((p.w13 >> 15)&1) ^ ((t.w13 >> 15)&1)) | (((p.w13 >> 14)&1) ^ ((t.w13 >> 14)&1)) ;
	int dst_470 = (((p.w13 >> 13)&1) ^ ((t.w13 >> 13)&1)) | (((p.w13 >> 12)&1) ^ ((t.w13 >> 12)&1)) ;
	int dst_469 = (((p.w13 >> 11)&1) ^ ((t.w13 >> 11)&1)) | (((p.w13 >> 10)&1) ^ ((t.w13 >> 10)&1)) ;
	int dst_468 = (((p.w13 >> 9)&1) ^ ((t.w13 >> 9)&1)) | (((p.w13 >> 8)&1) ^ ((t.w13 >> 8)&1)) ;
	int dst_467 = (((p.w13 >> 7)&1) ^ ((t.w13 >> 7)&1)) | (((p.w13 >> 6)&1) ^ ((t.w13 >> 6)&1)) ;
	int dst_466 = (((p.w13 >> 5)&1) ^ ((t.w13 >> 5)&1)) | (((p.w13 >> 4)&1) ^ ((t.w13 >> 4)&1)) ;
	int dst_465 = (((p.w13 >> 3)&1) ^ ((t.w13 >> 3)&1)) | (((p.w13 >> 2)&1) ^ ((t.w13 >> 2)&1)) ;
	int dst_464 = (((p.w13 >> 1)&1) ^ ((t.w13 >> 1)&1)) | (((p.w13 >> 0)&1) ^ ((t.w13 >> 0)&1)) ;
	int dst_463 = (((p.w12 >> 31)&1) ^ ((t.w12 >> 31)&1)) | (((p.w12 >> 30)&1) ^ ((t.w12 >> 30)&1)) ;
	int dst_462 = (((p.w12 >> 29)&1) ^ ((t.w12 >> 29)&1)) | (((p.w12 >> 28)&1) ^ ((t.w12 >> 28)&1)) ;
	int dst_461 = (((p.w12 >> 27)&1) ^ ((t.w12 >> 27)&1)) | (((p.w12 >> 26)&1) ^ ((t.w12 >> 26)&1)) ;
	int dst_460 = (((p.w12 >> 25)&1) ^ ((t.w12 >> 25)&1)) | (((p.w12 >> 24)&1) ^ ((t.w12 >> 24)&1)) ;
	int dst_459 = (((p.w12 >> 23)&1) ^ ((t.w12 >> 23)&1)) | (((p.w12 >> 22)&1) ^ ((t.w12 >> 22)&1)) ;
	int dst_458 = (((p.w12 >> 21)&1) ^ ((t.w12 >> 21)&1)) | (((p.w12 >> 20)&1) ^ ((t.w12 >> 20)&1)) ;
	int dst_457 = (((p.w12 >> 19)&1) ^ ((t.w12 >> 19)&1)) | (((p.w12 >> 18)&1) ^ ((t.w12 >> 18)&1)) ;
	int dst_456 = (((p.w12 >> 17)&1) ^ ((t.w12 >> 17)&1)) | (((p.w12 >> 16)&1) ^ ((t.w12 >> 16)&1)) ;
	int dst_455 = (((p.w12 >> 15)&1) ^ ((t.w12 >> 15)&1)) | (((p.w12 >> 14)&1) ^ ((t.w12 >> 14)&1)) ;
	int dst_454 = (((p.w12 >> 13)&1) ^ ((t.w12 >> 13)&1)) | (((p.w12 >> 12)&1) ^ ((t.w12 >> 12)&1)) ;
	int dst_453 = (((p.w12 >> 11)&1) ^ ((t.w12 >> 11)&1)) | (((p.w12 >> 10)&1) ^ ((t.w12 >> 10)&1)) ;
	int dst_452 = (((p.w12 >> 9)&1) ^ ((t.w12 >> 9)&1)) | (((p.w12 >> 8)&1) ^ ((t.w12 >> 8)&1)) ;
	int dst_451 = (((p.w12 >> 7)&1) ^ ((t.w12 >> 7)&1)) | (((p.w12 >> 6)&1) ^ ((t.w12 >> 6)&1)) ;
	int dst_450 = (((p.w12 >> 5)&1) ^ ((t.w12 >> 5)&1)) | (((p.w12 >> 4)&1) ^ ((t.w12 >> 4)&1)) ;
	int dst_449 = (((p.w12 >> 3)&1) ^ ((t.w12 >> 3)&1)) | (((p.w12 >> 2)&1) ^ ((t.w12 >> 2)&1)) ;
	int dst_448 = (((p.w12 >> 1)&1) ^ ((t.w12 >> 1)&1)) | (((p.w12 >> 0)&1) ^ ((t.w12 >> 0)&1)) ;
	int dst_447 = (((p.w11 >> 31)&1) ^ ((t.w11 >> 31)&1)) | (((p.w11 >> 30)&1) ^ ((t.w11 >> 30)&1)) ;
	int dst_446 = (((p.w11 >> 29)&1) ^ ((t.w11 >> 29)&1)) | (((p.w11 >> 28)&1) ^ ((t.w11 >> 28)&1)) ;
	int dst_445 = (((p.w11 >> 27)&1) ^ ((t.w11 >> 27)&1)) | (((p.w11 >> 26)&1) ^ ((t.w11 >> 26)&1)) ;
	int dst_444 = (((p.w11 >> 25)&1) ^ ((t.w11 >> 25)&1)) | (((p.w11 >> 24)&1) ^ ((t.w11 >> 24)&1)) ;
	int dst_443 = (((p.w11 >> 23)&1) ^ ((t.w11 >> 23)&1)) | (((p.w11 >> 22)&1) ^ ((t.w11 >> 22)&1)) ;
	int dst_442 = (((p.w11 >> 21)&1) ^ ((t.w11 >> 21)&1)) | (((p.w11 >> 20)&1) ^ ((t.w11 >> 20)&1)) ;
	int dst_441 = (((p.w11 >> 19)&1) ^ ((t.w11 >> 19)&1)) | (((p.w11 >> 18)&1) ^ ((t.w11 >> 18)&1)) ;
	int dst_440 = (((p.w11 >> 17)&1) ^ ((t.w11 >> 17)&1)) | (((p.w11 >> 16)&1) ^ ((t.w11 >> 16)&1)) ;
	int dst_439 = (((p.w11 >> 15)&1) ^ ((t.w11 >> 15)&1)) | (((p.w11 >> 14)&1) ^ ((t.w11 >> 14)&1)) ;
	int dst_438 = (((p.w11 >> 13)&1) ^ ((t.w11 >> 13)&1)) | (((p.w11 >> 12)&1) ^ ((t.w11 >> 12)&1)) ;
	int dst_437 = (((p.w11 >> 11)&1) ^ ((t.w11 >> 11)&1)) | (((p.w11 >> 10)&1) ^ ((t.w11 >> 10)&1)) ;
	int dst_436 = (((p.w11 >> 9)&1) ^ ((t.w11 >> 9)&1)) | (((p.w11 >> 8)&1) ^ ((t.w11 >> 8)&1)) ;
	int dst_435 = (((p.w11 >> 7)&1) ^ ((t.w11 >> 7)&1)) | (((p.w11 >> 6)&1) ^ ((t.w11 >> 6)&1)) ;
	int dst_434 = (((p.w11 >> 5)&1) ^ ((t.w11 >> 5)&1)) | (((p.w11 >> 4)&1) ^ ((t.w11 >> 4)&1)) ;
	int dst_433 = (((p.w11 >> 3)&1) ^ ((t.w11 >> 3)&1)) | (((p.w11 >> 2)&1) ^ ((t.w11 >> 2)&1)) ;
	int dst_432 = (((p.w11 >> 1)&1) ^ ((t.w11 >> 1)&1)) | (((p.w11 >> 0)&1) ^ ((t.w11 >> 0)&1)) ;
	int dst_431 = (((p.w10 >> 31)&1) ^ ((t.w10 >> 31)&1)) | (((p.w10 >> 30)&1) ^ ((t.w10 >> 30)&1)) ;
	int dst_430 = (((p.w10 >> 29)&1) ^ ((t.w10 >> 29)&1)) | (((p.w10 >> 28)&1) ^ ((t.w10 >> 28)&1)) ;
	int dst_429 = (((p.w10 >> 27)&1) ^ ((t.w10 >> 27)&1)) | (((p.w10 >> 26)&1) ^ ((t.w10 >> 26)&1)) ;
	int dst_428 = (((p.w10 >> 25)&1) ^ ((t.w10 >> 25)&1)) | (((p.w10 >> 24)&1) ^ ((t.w10 >> 24)&1)) ;
	int dst_427 = (((p.w10 >> 23)&1) ^ ((t.w10 >> 23)&1)) | (((p.w10 >> 22)&1) ^ ((t.w10 >> 22)&1)) ;
	int dst_426 = (((p.w10 >> 21)&1) ^ ((t.w10 >> 21)&1)) | (((p.w10 >> 20)&1) ^ ((t.w10 >> 20)&1)) ;
	int dst_425 = (((p.w10 >> 19)&1) ^ ((t.w10 >> 19)&1)) | (((p.w10 >> 18)&1) ^ ((t.w10 >> 18)&1)) ;
	int dst_424 = (((p.w10 >> 17)&1) ^ ((t.w10 >> 17)&1)) | (((p.w10 >> 16)&1) ^ ((t.w10 >> 16)&1)) ;
	int dst_423 = (((p.w10 >> 15)&1) ^ ((t.w10 >> 15)&1)) | (((p.w10 >> 14)&1) ^ ((t.w10 >> 14)&1)) ;
	int dst_422 = (((p.w10 >> 13)&1) ^ ((t.w10 >> 13)&1)) | (((p.w10 >> 12)&1) ^ ((t.w10 >> 12)&1)) ;
	int dst_421 = (((p.w10 >> 11)&1) ^ ((t.w10 >> 11)&1)) | (((p.w10 >> 10)&1) ^ ((t.w10 >> 10)&1)) ;
	int dst_420 = (((p.w10 >> 9)&1) ^ ((t.w10 >> 9)&1)) | (((p.w10 >> 8)&1) ^ ((t.w10 >> 8)&1)) ;
	int dst_419 = (((p.w10 >> 7)&1) ^ ((t.w10 >> 7)&1)) | (((p.w10 >> 6)&1) ^ ((t.w10 >> 6)&1)) ;
	int dst_418 = (((p.w10 >> 5)&1) ^ ((t.w10 >> 5)&1)) | (((p.w10 >> 4)&1) ^ ((t.w10 >> 4)&1)) ;
	int dst_417 = (((p.w10 >> 3)&1) ^ ((t.w10 >> 3)&1)) | (((p.w10 >> 2)&1) ^ ((t.w10 >> 2)&1)) ;
	int dst_416 = (((p.w10 >> 1)&1) ^ ((t.w10 >> 1)&1)) | (((p.w10 >> 0)&1) ^ ((t.w10 >> 0)&1)) ;
	int dst_415 = (((p.w9 >> 31)&1) ^ ((t.w9 >> 31)&1)) | (((p.w9 >> 30)&1) ^ ((t.w9 >> 30)&1)) ;
	int dst_414 = (((p.w9 >> 29)&1) ^ ((t.w9 >> 29)&1)) | (((p.w9 >> 28)&1) ^ ((t.w9 >> 28)&1)) ;
	int dst_413 = (((p.w9 >> 27)&1) ^ ((t.w9 >> 27)&1)) | (((p.w9 >> 26)&1) ^ ((t.w9 >> 26)&1)) ;
	int dst_412 = (((p.w9 >> 25)&1) ^ ((t.w9 >> 25)&1)) | (((p.w9 >> 24)&1) ^ ((t.w9 >> 24)&1)) ;
	int dst_411 = (((p.w9 >> 23)&1) ^ ((t.w9 >> 23)&1)) | (((p.w9 >> 22)&1) ^ ((t.w9 >> 22)&1)) ;
	int dst_410 = (((p.w9 >> 21)&1) ^ ((t.w9 >> 21)&1)) | (((p.w9 >> 20)&1) ^ ((t.w9 >> 20)&1)) ;
	int dst_409 = (((p.w9 >> 19)&1) ^ ((t.w9 >> 19)&1)) | (((p.w9 >> 18)&1) ^ ((t.w9 >> 18)&1)) ;
	int dst_408 = (((p.w9 >> 17)&1) ^ ((t.w9 >> 17)&1)) | (((p.w9 >> 16)&1) ^ ((t.w9 >> 16)&1)) ;
	int dst_407 = (((p.w9 >> 15)&1) ^ ((t.w9 >> 15)&1)) | (((p.w9 >> 14)&1) ^ ((t.w9 >> 14)&1)) ;
	int dst_406 = (((p.w9 >> 13)&1) ^ ((t.w9 >> 13)&1)) | (((p.w9 >> 12)&1) ^ ((t.w9 >> 12)&1)) ;
	int dst_405 = (((p.w9 >> 11)&1) ^ ((t.w9 >> 11)&1)) | (((p.w9 >> 10)&1) ^ ((t.w9 >> 10)&1)) ;
	int dst_404 = (((p.w9 >> 9)&1) ^ ((t.w9 >> 9)&1)) | (((p.w9 >> 8)&1) ^ ((t.w9 >> 8)&1)) ;
	int dst_403 = (((p.w9 >> 7)&1) ^ ((t.w9 >> 7)&1)) | (((p.w9 >> 6)&1) ^ ((t.w9 >> 6)&1)) ;
	int dst_402 = (((p.w9 >> 5)&1) ^ ((t.w9 >> 5)&1)) | (((p.w9 >> 4)&1) ^ ((t.w9 >> 4)&1)) ;
	int dst_401 = (((p.w9 >> 3)&1) ^ ((t.w9 >> 3)&1)) | (((p.w9 >> 2)&1) ^ ((t.w9 >> 2)&1)) ;
	int dst_400 = (((p.w9 >> 1)&1) ^ ((t.w9 >> 1)&1)) | (((p.w9 >> 0)&1) ^ ((t.w9 >> 0)&1)) ;
	int dst_399 = (((p.w8 >> 31)&1) ^ ((t.w8 >> 31)&1)) | (((p.w8 >> 30)&1) ^ ((t.w8 >> 30)&1)) ;
	int dst_398 = (((p.w8 >> 29)&1) ^ ((t.w8 >> 29)&1)) | (((p.w8 >> 28)&1) ^ ((t.w8 >> 28)&1)) ;
	int dst_397 = (((p.w8 >> 27)&1) ^ ((t.w8 >> 27)&1)) | (((p.w8 >> 26)&1) ^ ((t.w8 >> 26)&1)) ;
	int dst_396 = (((p.w8 >> 25)&1) ^ ((t.w8 >> 25)&1)) | (((p.w8 >> 24)&1) ^ ((t.w8 >> 24)&1)) ;
	int dst_395 = (((p.w8 >> 23)&1) ^ ((t.w8 >> 23)&1)) | (((p.w8 >> 22)&1) ^ ((t.w8 >> 22)&1)) ;
	int dst_394 = (((p.w8 >> 21)&1) ^ ((t.w8 >> 21)&1)) | (((p.w8 >> 20)&1) ^ ((t.w8 >> 20)&1)) ;
	int dst_393 = (((p.w8 >> 19)&1) ^ ((t.w8 >> 19)&1)) | (((p.w8 >> 18)&1) ^ ((t.w8 >> 18)&1)) ;
	int dst_392 = (((p.w8 >> 17)&1) ^ ((t.w8 >> 17)&1)) | (((p.w8 >> 16)&1) ^ ((t.w8 >> 16)&1)) ;
	int dst_391 = (((p.w8 >> 15)&1) ^ ((t.w8 >> 15)&1)) | (((p.w8 >> 14)&1) ^ ((t.w8 >> 14)&1)) ;
	int dst_390 = (((p.w8 >> 13)&1) ^ ((t.w8 >> 13)&1)) | (((p.w8 >> 12)&1) ^ ((t.w8 >> 12)&1)) ;
	int dst_389 = (((p.w8 >> 11)&1) ^ ((t.w8 >> 11)&1)) | (((p.w8 >> 10)&1) ^ ((t.w8 >> 10)&1)) ;
	int dst_388 = (((p.w8 >> 9)&1) ^ ((t.w8 >> 9)&1)) | (((p.w8 >> 8)&1) ^ ((t.w8 >> 8)&1)) ;
	int dst_387 = (((p.w8 >> 7)&1) ^ ((t.w8 >> 7)&1)) | (((p.w8 >> 6)&1) ^ ((t.w8 >> 6)&1)) ;
	int dst_386 = (((p.w8 >> 5)&1) ^ ((t.w8 >> 5)&1)) | (((p.w8 >> 4)&1) ^ ((t.w8 >> 4)&1)) ;
	int dst_385 = (((p.w8 >> 3)&1) ^ ((t.w8 >> 3)&1)) | (((p.w8 >> 2)&1) ^ ((t.w8 >> 2)&1)) ;
	int dst_384 = (((p.w8 >> 1)&1) ^ ((t.w8 >> 1)&1)) | (((p.w8 >> 0)&1) ^ ((t.w8 >> 0)&1)) ;
	int dst_383 = (((p.w7 >> 31)&1) ^ ((t.w7 >> 31)&1)) | (((p.w7 >> 30)&1) ^ ((t.w7 >> 30)&1)) ;
	int dst_382 = (((p.w7 >> 29)&1) ^ ((t.w7 >> 29)&1)) | (((p.w7 >> 28)&1) ^ ((t.w7 >> 28)&1)) ;
	int dst_381 = (((p.w7 >> 27)&1) ^ ((t.w7 >> 27)&1)) | (((p.w7 >> 26)&1) ^ ((t.w7 >> 26)&1)) ;
	int dst_380 = (((p.w7 >> 25)&1) ^ ((t.w7 >> 25)&1)) | (((p.w7 >> 24)&1) ^ ((t.w7 >> 24)&1)) ;
	int dst_379 = (((p.w7 >> 23)&1) ^ ((t.w7 >> 23)&1)) | (((p.w7 >> 22)&1) ^ ((t.w7 >> 22)&1)) ;
	int dst_378 = (((p.w7 >> 21)&1) ^ ((t.w7 >> 21)&1)) | (((p.w7 >> 20)&1) ^ ((t.w7 >> 20)&1)) ;
	int dst_377 = (((p.w7 >> 19)&1) ^ ((t.w7 >> 19)&1)) | (((p.w7 >> 18)&1) ^ ((t.w7 >> 18)&1)) ;
	int dst_376 = (((p.w7 >> 17)&1) ^ ((t.w7 >> 17)&1)) | (((p.w7 >> 16)&1) ^ ((t.w7 >> 16)&1)) ;
	int dst_375 = (((p.w7 >> 15)&1) ^ ((t.w7 >> 15)&1)) | (((p.w7 >> 14)&1) ^ ((t.w7 >> 14)&1)) ;
	int dst_374 = (((p.w7 >> 13)&1) ^ ((t.w7 >> 13)&1)) | (((p.w7 >> 12)&1) ^ ((t.w7 >> 12)&1)) ;
	int dst_373 = (((p.w7 >> 11)&1) ^ ((t.w7 >> 11)&1)) | (((p.w7 >> 10)&1) ^ ((t.w7 >> 10)&1)) ;
	int dst_372 = (((p.w7 >> 9)&1) ^ ((t.w7 >> 9)&1)) | (((p.w7 >> 8)&1) ^ ((t.w7 >> 8)&1)) ;
	int dst_371 = (((p.w7 >> 7)&1) ^ ((t.w7 >> 7)&1)) | (((p.w7 >> 6)&1) ^ ((t.w7 >> 6)&1)) ;
	int dst_370 = (((p.w7 >> 5)&1) ^ ((t.w7 >> 5)&1)) | (((p.w7 >> 4)&1) ^ ((t.w7 >> 4)&1)) ;
	int dst_369 = (((p.w7 >> 3)&1) ^ ((t.w7 >> 3)&1)) | (((p.w7 >> 2)&1) ^ ((t.w7 >> 2)&1)) ;
	int dst_368 = (((p.w7 >> 1)&1) ^ ((t.w7 >> 1)&1)) | (((p.w7 >> 0)&1) ^ ((t.w7 >> 0)&1)) ;
	int dst_367 = (((p.w6 >> 31)&1) ^ ((t.w6 >> 31)&1)) | (((p.w6 >> 30)&1) ^ ((t.w6 >> 30)&1)) ;
	int dst_366 = (((p.w6 >> 29)&1) ^ ((t.w6 >> 29)&1)) | (((p.w6 >> 28)&1) ^ ((t.w6 >> 28)&1)) ;
	int dst_365 = (((p.w6 >> 27)&1) ^ ((t.w6 >> 27)&1)) | (((p.w6 >> 26)&1) ^ ((t.w6 >> 26)&1)) ;
	int dst_364 = (((p.w6 >> 25)&1) ^ ((t.w6 >> 25)&1)) | (((p.w6 >> 24)&1) ^ ((t.w6 >> 24)&1)) ;
	int dst_363 = (((p.w6 >> 23)&1) ^ ((t.w6 >> 23)&1)) | (((p.w6 >> 22)&1) ^ ((t.w6 >> 22)&1)) ;
	int dst_362 = (((p.w6 >> 21)&1) ^ ((t.w6 >> 21)&1)) | (((p.w6 >> 20)&1) ^ ((t.w6 >> 20)&1)) ;
	int dst_361 = (((p.w6 >> 19)&1) ^ ((t.w6 >> 19)&1)) | (((p.w6 >> 18)&1) ^ ((t.w6 >> 18)&1)) ;
	int dst_360 = (((p.w6 >> 17)&1) ^ ((t.w6 >> 17)&1)) | (((p.w6 >> 16)&1) ^ ((t.w6 >> 16)&1)) ;
	int dst_359 = (((p.w6 >> 15)&1) ^ ((t.w6 >> 15)&1)) | (((p.w6 >> 14)&1) ^ ((t.w6 >> 14)&1)) ;
	int dst_358 = (((p.w6 >> 13)&1) ^ ((t.w6 >> 13)&1)) | (((p.w6 >> 12)&1) ^ ((t.w6 >> 12)&1)) ;
	int dst_357 = (((p.w6 >> 11)&1) ^ ((t.w6 >> 11)&1)) | (((p.w6 >> 10)&1) ^ ((t.w6 >> 10)&1)) ;
	int dst_356 = (((p.w6 >> 9)&1) ^ ((t.w6 >> 9)&1)) | (((p.w6 >> 8)&1) ^ ((t.w6 >> 8)&1)) ;
	int dst_355 = (((p.w6 >> 7)&1) ^ ((t.w6 >> 7)&1)) | (((p.w6 >> 6)&1) ^ ((t.w6 >> 6)&1)) ;
	int dst_354 = (((p.w6 >> 5)&1) ^ ((t.w6 >> 5)&1)) | (((p.w6 >> 4)&1) ^ ((t.w6 >> 4)&1)) ;
	int dst_353 = (((p.w6 >> 3)&1) ^ ((t.w6 >> 3)&1)) | (((p.w6 >> 2)&1) ^ ((t.w6 >> 2)&1)) ;
	int dst_352 = (((p.w6 >> 1)&1) ^ ((t.w6 >> 1)&1)) | (((p.w6 >> 0)&1) ^ ((t.w6 >> 0)&1)) ;
	int dst_351 = (((p.w5 >> 31)&1) ^ ((t.w5 >> 31)&1)) | (((p.w5 >> 30)&1) ^ ((t.w5 >> 30)&1)) ;
	int dst_350 = (((p.w5 >> 29)&1) ^ ((t.w5 >> 29)&1)) | (((p.w5 >> 28)&1) ^ ((t.w5 >> 28)&1)) ;
	int dst_349 = (((p.w5 >> 27)&1) ^ ((t.w5 >> 27)&1)) | (((p.w5 >> 26)&1) ^ ((t.w5 >> 26)&1)) ;
	int dst_348 = (((p.w5 >> 25)&1) ^ ((t.w5 >> 25)&1)) | (((p.w5 >> 24)&1) ^ ((t.w5 >> 24)&1)) ;
	int dst_347 = (((p.w5 >> 23)&1) ^ ((t.w5 >> 23)&1)) | (((p.w5 >> 22)&1) ^ ((t.w5 >> 22)&1)) ;
	int dst_346 = (((p.w5 >> 21)&1) ^ ((t.w5 >> 21)&1)) | (((p.w5 >> 20)&1) ^ ((t.w5 >> 20)&1)) ;
	int dst_345 = (((p.w5 >> 19)&1) ^ ((t.w5 >> 19)&1)) | (((p.w5 >> 18)&1) ^ ((t.w5 >> 18)&1)) ;
	int dst_344 = (((p.w5 >> 17)&1) ^ ((t.w5 >> 17)&1)) | (((p.w5 >> 16)&1) ^ ((t.w5 >> 16)&1)) ;
	int dst_343 = (((p.w5 >> 15)&1) ^ ((t.w5 >> 15)&1)) | (((p.w5 >> 14)&1) ^ ((t.w5 >> 14)&1)) ;
	int dst_342 = (((p.w5 >> 13)&1) ^ ((t.w5 >> 13)&1)) | (((p.w5 >> 12)&1) ^ ((t.w5 >> 12)&1)) ;
	int dst_341 = (((p.w5 >> 11)&1) ^ ((t.w5 >> 11)&1)) | (((p.w5 >> 10)&1) ^ ((t.w5 >> 10)&1)) ;
	int dst_340 = (((p.w5 >> 9)&1) ^ ((t.w5 >> 9)&1)) | (((p.w5 >> 8)&1) ^ ((t.w5 >> 8)&1)) ;
	int dst_339 = (((p.w5 >> 7)&1) ^ ((t.w5 >> 7)&1)) | (((p.w5 >> 6)&1) ^ ((t.w5 >> 6)&1)) ;
	int dst_338 = (((p.w5 >> 5)&1) ^ ((t.w5 >> 5)&1)) | (((p.w5 >> 4)&1) ^ ((t.w5 >> 4)&1)) ;
	int dst_337 = (((p.w5 >> 3)&1) ^ ((t.w5 >> 3)&1)) | (((p.w5 >> 2)&1) ^ ((t.w5 >> 2)&1)) ;
	int dst_336 = (((p.w5 >> 1)&1) ^ ((t.w5 >> 1)&1)) | (((p.w5 >> 0)&1) ^ ((t.w5 >> 0)&1)) ;
	int dst_335 = (((p.w4 >> 31)&1) ^ ((t.w4 >> 31)&1)) | (((p.w4 >> 30)&1) ^ ((t.w4 >> 30)&1)) ;
	int dst_334 = (((p.w4 >> 29)&1) ^ ((t.w4 >> 29)&1)) | (((p.w4 >> 28)&1) ^ ((t.w4 >> 28)&1)) ;
	int dst_333 = (((p.w4 >> 27)&1) ^ ((t.w4 >> 27)&1)) | (((p.w4 >> 26)&1) ^ ((t.w4 >> 26)&1)) ;
	int dst_332 = (((p.w4 >> 25)&1) ^ ((t.w4 >> 25)&1)) | (((p.w4 >> 24)&1) ^ ((t.w4 >> 24)&1)) ;
	int dst_331 = (((p.w4 >> 23)&1) ^ ((t.w4 >> 23)&1)) | (((p.w4 >> 22)&1) ^ ((t.w4 >> 22)&1)) ;
	int dst_330 = (((p.w4 >> 21)&1) ^ ((t.w4 >> 21)&1)) | (((p.w4 >> 20)&1) ^ ((t.w4 >> 20)&1)) ;
	int dst_329 = (((p.w4 >> 19)&1) ^ ((t.w4 >> 19)&1)) | (((p.w4 >> 18)&1) ^ ((t.w4 >> 18)&1)) ;
	int dst_328 = (((p.w4 >> 17)&1) ^ ((t.w4 >> 17)&1)) | (((p.w4 >> 16)&1) ^ ((t.w4 >> 16)&1)) ;
	int dst_327 = (((p.w4 >> 15)&1) ^ ((t.w4 >> 15)&1)) | (((p.w4 >> 14)&1) ^ ((t.w4 >> 14)&1)) ;
	int dst_326 = (((p.w4 >> 13)&1) ^ ((t.w4 >> 13)&1)) | (((p.w4 >> 12)&1) ^ ((t.w4 >> 12)&1)) ;
	int dst_325 = (((p.w4 >> 11)&1) ^ ((t.w4 >> 11)&1)) | (((p.w4 >> 10)&1) ^ ((t.w4 >> 10)&1)) ;
	int dst_324 = (((p.w4 >> 9)&1) ^ ((t.w4 >> 9)&1)) | (((p.w4 >> 8)&1) ^ ((t.w4 >> 8)&1)) ;
	int dst_323 = (((p.w4 >> 7)&1) ^ ((t.w4 >> 7)&1)) | (((p.w4 >> 6)&1) ^ ((t.w4 >> 6)&1)) ;
	int dst_322 = (((p.w4 >> 5)&1) ^ ((t.w4 >> 5)&1)) | (((p.w4 >> 4)&1) ^ ((t.w4 >> 4)&1)) ;
	int dst_321 = (((p.w4 >> 3)&1) ^ ((t.w4 >> 3)&1)) | (((p.w4 >> 2)&1) ^ ((t.w4 >> 2)&1)) ;
	int dst_320 = (((p.w4 >> 1)&1) ^ ((t.w4 >> 1)&1)) | (((p.w4 >> 0)&1) ^ ((t.w4 >> 0)&1)) ;
	int dst_319 = (((p.w3 >> 31)&1) ^ ((t.w3 >> 31)&1)) | (((p.w3 >> 30)&1) ^ ((t.w3 >> 30)&1)) ;
	int dst_318 = (((p.w3 >> 29)&1) ^ ((t.w3 >> 29)&1)) | (((p.w3 >> 28)&1) ^ ((t.w3 >> 28)&1)) ;
	int dst_317 = (((p.w3 >> 27)&1) ^ ((t.w3 >> 27)&1)) | (((p.w3 >> 26)&1) ^ ((t.w3 >> 26)&1)) ;
	int dst_316 = (((p.w3 >> 25)&1) ^ ((t.w3 >> 25)&1)) | (((p.w3 >> 24)&1) ^ ((t.w3 >> 24)&1)) ;
	int dst_315 = (((p.w3 >> 23)&1) ^ ((t.w3 >> 23)&1)) | (((p.w3 >> 22)&1) ^ ((t.w3 >> 22)&1)) ;
	int dst_314 = (((p.w3 >> 21)&1) ^ ((t.w3 >> 21)&1)) | (((p.w3 >> 20)&1) ^ ((t.w3 >> 20)&1)) ;
	int dst_313 = (((p.w3 >> 19)&1) ^ ((t.w3 >> 19)&1)) | (((p.w3 >> 18)&1) ^ ((t.w3 >> 18)&1)) ;
	int dst_312 = (((p.w3 >> 17)&1) ^ ((t.w3 >> 17)&1)) | (((p.w3 >> 16)&1) ^ ((t.w3 >> 16)&1)) ;
	int dst_311 = (((p.w3 >> 15)&1) ^ ((t.w3 >> 15)&1)) | (((p.w3 >> 14)&1) ^ ((t.w3 >> 14)&1)) ;
	int dst_310 = (((p.w3 >> 13)&1) ^ ((t.w3 >> 13)&1)) | (((p.w3 >> 12)&1) ^ ((t.w3 >> 12)&1)) ;
	int dst_309 = (((p.w3 >> 11)&1) ^ ((t.w3 >> 11)&1)) | (((p.w3 >> 10)&1) ^ ((t.w3 >> 10)&1)) ;
	int dst_308 = (((p.w3 >> 9)&1) ^ ((t.w3 >> 9)&1)) | (((p.w3 >> 8)&1) ^ ((t.w3 >> 8)&1)) ;
	int dst_307 = (((p.w3 >> 7)&1) ^ ((t.w3 >> 7)&1)) | (((p.w3 >> 6)&1) ^ ((t.w3 >> 6)&1)) ;
	int dst_306 = (((p.w3 >> 5)&1) ^ ((t.w3 >> 5)&1)) | (((p.w3 >> 4)&1) ^ ((t.w3 >> 4)&1)) ;
	int dst_305 = (((p.w3 >> 3)&1) ^ ((t.w3 >> 3)&1)) | (((p.w3 >> 2)&1) ^ ((t.w3 >> 2)&1)) ;
	int dst_304 = (((p.w3 >> 1)&1) ^ ((t.w3 >> 1)&1)) | (((p.w3 >> 0)&1) ^ ((t.w3 >> 0)&1)) ;
	int dst_303 = (((p.w2 >> 31)&1) ^ ((t.w2 >> 31)&1)) | (((p.w2 >> 30)&1) ^ ((t.w2 >> 30)&1)) ;
	int dst_302 = (((p.w2 >> 29)&1) ^ ((t.w2 >> 29)&1)) | (((p.w2 >> 28)&1) ^ ((t.w2 >> 28)&1)) ;
	int dst_301 = (((p.w2 >> 27)&1) ^ ((t.w2 >> 27)&1)) | (((p.w2 >> 26)&1) ^ ((t.w2 >> 26)&1)) ;
	int dst_300 = (((p.w2 >> 25)&1) ^ ((t.w2 >> 25)&1)) | (((p.w2 >> 24)&1) ^ ((t.w2 >> 24)&1)) ;
	int dst_299 = (((p.w2 >> 23)&1) ^ ((t.w2 >> 23)&1)) | (((p.w2 >> 22)&1) ^ ((t.w2 >> 22)&1)) ;
	int dst_298 = (((p.w2 >> 21)&1) ^ ((t.w2 >> 21)&1)) | (((p.w2 >> 20)&1) ^ ((t.w2 >> 20)&1)) ;
	int dst_297 = (((p.w2 >> 19)&1) ^ ((t.w2 >> 19)&1)) | (((p.w2 >> 18)&1) ^ ((t.w2 >> 18)&1)) ;
	int dst_296 = (((p.w2 >> 17)&1) ^ ((t.w2 >> 17)&1)) | (((p.w2 >> 16)&1) ^ ((t.w2 >> 16)&1)) ;
	int dst_295 = (((p.w2 >> 15)&1) ^ ((t.w2 >> 15)&1)) | (((p.w2 >> 14)&1) ^ ((t.w2 >> 14)&1)) ;
	int dst_294 = (((p.w2 >> 13)&1) ^ ((t.w2 >> 13)&1)) | (((p.w2 >> 12)&1) ^ ((t.w2 >> 12)&1)) ;
	int dst_293 = (((p.w2 >> 11)&1) ^ ((t.w2 >> 11)&1)) | (((p.w2 >> 10)&1) ^ ((t.w2 >> 10)&1)) ;
	int dst_292 = (((p.w2 >> 9)&1) ^ ((t.w2 >> 9)&1)) | (((p.w2 >> 8)&1) ^ ((t.w2 >> 8)&1)) ;
	int dst_291 = (((p.w2 >> 7)&1) ^ ((t.w2 >> 7)&1)) | (((p.w2 >> 6)&1) ^ ((t.w2 >> 6)&1)) ;
	int dst_290 = (((p.w2 >> 5)&1) ^ ((t.w2 >> 5)&1)) | (((p.w2 >> 4)&1) ^ ((t.w2 >> 4)&1)) ;
	int dst_289 = (((p.w2 >> 3)&1) ^ ((t.w2 >> 3)&1)) | (((p.w2 >> 2)&1) ^ ((t.w2 >> 2)&1)) ;
	int dst_288 = (((p.w2 >> 1)&1) ^ ((t.w2 >> 1)&1)) | (((p.w2 >> 0)&1) ^ ((t.w2 >> 0)&1)) ;
	int dst_287 = (((p.w1 >> 31)&1) ^ ((t.w1 >> 31)&1)) | (((p.w1 >> 30)&1) ^ ((t.w1 >> 30)&1)) ;
	int dst_286 = (((p.w1 >> 29)&1) ^ ((t.w1 >> 29)&1)) | (((p.w1 >> 28)&1) ^ ((t.w1 >> 28)&1)) ;
	int dst_285 = (((p.w1 >> 27)&1) ^ ((t.w1 >> 27)&1)) | (((p.w1 >> 26)&1) ^ ((t.w1 >> 26)&1)) ;
	int dst_284 = (((p.w1 >> 25)&1) ^ ((t.w1 >> 25)&1)) | (((p.w1 >> 24)&1) ^ ((t.w1 >> 24)&1)) ;
	int dst_283 = (((p.w1 >> 23)&1) ^ ((t.w1 >> 23)&1)) | (((p.w1 >> 22)&1) ^ ((t.w1 >> 22)&1)) ;
	int dst_282 = (((p.w1 >> 21)&1) ^ ((t.w1 >> 21)&1)) | (((p.w1 >> 20)&1) ^ ((t.w1 >> 20)&1)) ;
	int dst_281 = (((p.w1 >> 19)&1) ^ ((t.w1 >> 19)&1)) | (((p.w1 >> 18)&1) ^ ((t.w1 >> 18)&1)) ;
	int dst_280 = (((p.w1 >> 17)&1) ^ ((t.w1 >> 17)&1)) | (((p.w1 >> 16)&1) ^ ((t.w1 >> 16)&1)) ;
	int dst_279 = (((p.w1 >> 15)&1) ^ ((t.w1 >> 15)&1)) | (((p.w1 >> 14)&1) ^ ((t.w1 >> 14)&1)) ;
	int dst_278 = (((p.w1 >> 13)&1) ^ ((t.w1 >> 13)&1)) | (((p.w1 >> 12)&1) ^ ((t.w1 >> 12)&1)) ;
	int dst_277 = (((p.w1 >> 11)&1) ^ ((t.w1 >> 11)&1)) | (((p.w1 >> 10)&1) ^ ((t.w1 >> 10)&1)) ;
	int dst_276 = (((p.w1 >> 9)&1) ^ ((t.w1 >> 9)&1)) | (((p.w1 >> 8)&1) ^ ((t.w1 >> 8)&1)) ;
	int dst_275 = (((p.w1 >> 7)&1) ^ ((t.w1 >> 7)&1)) | (((p.w1 >> 6)&1) ^ ((t.w1 >> 6)&1)) ;
	int dst_274 = (((p.w1 >> 5)&1) ^ ((t.w1 >> 5)&1)) | (((p.w1 >> 4)&1) ^ ((t.w1 >> 4)&1)) ;
	int dst_273 = (((p.w1 >> 3)&1) ^ ((t.w1 >> 3)&1)) | (((p.w1 >> 2)&1) ^ ((t.w1 >> 2)&1)) ;
	int dst_272 = (((p.w1 >> 1)&1) ^ ((t.w1 >> 1)&1)) | (((p.w1 >> 0)&1) ^ ((t.w1 >> 0)&1)) ;
	int dst_271 = (((p.w0 >> 31)&1) ^ ((t.w0 >> 31)&1)) | (((p.w0 >> 30)&1) ^ ((t.w0 >> 30)&1)) ;
	int dst_270 = (((p.w0 >> 29)&1) ^ ((t.w0 >> 29)&1)) | (((p.w0 >> 28)&1) ^ ((t.w0 >> 28)&1)) ;
	int dst_269 = (((p.w0 >> 27)&1) ^ ((t.w0 >> 27)&1)) | (((p.w0 >> 26)&1) ^ ((t.w0 >> 26)&1)) ;
	int dst_268 = (((p.w0 >> 25)&1) ^ ((t.w0 >> 25)&1)) | (((p.w0 >> 24)&1) ^ ((t.w0 >> 24)&1)) ;
	int dst_267 = (((p.w0 >> 23)&1) ^ ((t.w0 >> 23)&1)) | (((p.w0 >> 22)&1) ^ ((t.w0 >> 22)&1)) ;
	int dst_266 = (((p.w0 >> 21)&1) ^ ((t.w0 >> 21)&1)) | (((p.w0 >> 20)&1) ^ ((t.w0 >> 20)&1)) ;
	int dst_265 = (((p.w0 >> 19)&1) ^ ((t.w0 >> 19)&1)) | (((p.w0 >> 18)&1) ^ ((t.w0 >> 18)&1)) ;
	int dst_264 = (((p.w0 >> 17)&1) ^ ((t.w0 >> 17)&1)) | (((p.w0 >> 16)&1) ^ ((t.w0 >> 16)&1)) ;
	int dst_263 = (((p.w0 >> 15)&1) ^ ((t.w0 >> 15)&1)) | (((p.w0 >> 14)&1) ^ ((t.w0 >> 14)&1)) ;
	int dst_262 = (((p.w0 >> 13)&1) ^ ((t.w0 >> 13)&1)) | (((p.w0 >> 12)&1) ^ ((t.w0 >> 12)&1)) ;
	int dst_261 = (((p.w0 >> 11)&1) ^ ((t.w0 >> 11)&1)) | (((p.w0 >> 10)&1) ^ ((t.w0 >> 10)&1)) ;
	int dst_260 = (((p.w0 >> 9)&1) ^ ((t.w0 >> 9)&1)) | (((p.w0 >> 8)&1) ^ ((t.w0 >> 8)&1)) ;
	int dst_259 = (((p.w0 >> 7)&1) ^ ((t.w0 >> 7)&1)) | (((p.w0 >> 6)&1) ^ ((t.w0 >> 6)&1)) ;
	int dst_258 = (((p.w0 >> 5)&1) ^ ((t.w0 >> 5)&1)) | (((p.w0 >> 4)&1) ^ ((t.w0 >> 4)&1)) ;
	int dst_257 = (((p.w0 >> 3)&1) ^ ((t.w0 >> 3)&1)) | (((p.w0 >> 2)&1) ^ ((t.w0 >> 2)&1)) ;
	int dst_256 = (((p.w0 >> 1)&1) ^ ((t.w0 >> 1)&1)) | (((p.w0 >> 0)&1) ^ ((t.w0 >> 0)&1)) ;
r->w15 = (dst_480<<0)|(dst_481<<1)|(dst_482<<2)|(dst_483<<3)|(dst_484<<4)|(dst_485<<5)|(dst_486<<6)|(dst_487<<7)|(dst_488<<8)|(dst_489<<9)|(dst_490<<10)|(dst_491<<11)|(dst_492<<12)|(dst_493<<13)|(dst_494<<14)|(dst_495<<15)|(dst_496<<16)|(dst_497<<17)|(dst_498<<18)|(dst_499<<19)|(dst_500<<20)|(dst_501<<21)|(dst_502<<22)|(dst_503<<23)|(dst_504<<24)|(dst_505<<25)|(dst_506<<26)|(dst_507<<27)|(dst_508<<28)|(dst_509<<29)|(dst_510<<30)|(dst_511<<31);

r->w14 = (dst_448<<0)|(dst_449<<1)|(dst_450<<2)|(dst_451<<3)|(dst_452<<4)|(dst_453<<5)|(dst_454<<6)|(dst_455<<7)|(dst_456<<8)|(dst_457<<9)|(dst_458<<10)|(dst_459<<11)|(dst_460<<12)|(dst_461<<13)|(dst_462<<14)|(dst_463<<15)|(dst_464<<16)|(dst_465<<17)|(dst_466<<18)|(dst_467<<19)|(dst_468<<20)|(dst_469<<21)|(dst_470<<22)|(dst_471<<23)|(dst_472<<24)|(dst_473<<25)|(dst_474<<26)|(dst_475<<27)|(dst_476<<28)|(dst_477<<29)|(dst_478<<30)|(dst_479<<31);
r->w13 = (dst_416<<0)|(dst_417<<1)|(dst_418<<2)|(dst_419<<3)|(dst_420<<4)|(dst_421<<5)|(dst_422<<6)|(dst_423<<7)|(dst_424<<8)|(dst_425<<9)|(dst_426<<10)|(dst_427<<11)|(dst_428<<12)|(dst_429<<13)|(dst_430<<14)|(dst_431<<15)|(dst_432<<16)|(dst_433<<17)|(dst_434<<18)|(dst_435<<19)|(dst_436<<20)|(dst_437<<21)|(dst_438<<22)|(dst_439<<23)|(dst_440<<24)|(dst_441<<25)|(dst_442<<26)|(dst_443<<27)|(dst_444<<28)|(dst_445<<29)|(dst_446<<30)|(dst_447<<31);
r->w12 = (dst_384<<0)|(dst_385<<1)|(dst_386<<2)|(dst_387<<3)|(dst_388<<4)|(dst_389<<5)|(dst_390<<6)|(dst_391<<7)|(dst_392<<8)|(dst_393<<9)|(dst_394<<10)|(dst_395<<11)|(dst_396<<12)|(dst_397<<13)|(dst_398<<14)|(dst_399<<15)|(dst_400<<16)|(dst_401<<17)|(dst_402<<18)|(dst_403<<19)|(dst_404<<20)|(dst_405<<21)|(dst_406<<22)|(dst_407<<23)|(dst_408<<24)|(dst_409<<25)|(dst_410<<26)|(dst_411<<27)|(dst_412<<28)|(dst_413<<29)|(dst_414<<30)|(dst_415<<31);
r->w11 = (dst_352<<0)|(dst_353<<1)|(dst_354<<2)|(dst_355<<3)|(dst_356<<4)|(dst_357<<5)|(dst_358<<6)|(dst_359<<7)|(dst_360<<8)|(dst_361<<9)|(dst_362<<10)|(dst_363<<11)|(dst_364<<12)|(dst_365<<13)|(dst_366<<14)|(dst_367<<15)|(dst_368<<16)|(dst_369<<17)|(dst_370<<18)|(dst_371<<19)|(dst_372<<20)|(dst_373<<21)|(dst_374<<22)|(dst_375<<23)|(dst_376<<24)|(dst_377<<25)|(dst_378<<26)|(dst_379<<27)|(dst_380<<28)|(dst_381<<29)|(dst_382<<30)|(dst_383<<31);
r->w10 = (dst_320<<0)|(dst_321<<1)|(dst_322<<2)|(dst_323<<3)|(dst_324<<4)|(dst_325<<5)|(dst_326<<6)|(dst_327<<7)|(dst_328<<8)|(dst_329<<9)|(dst_330<<10)|(dst_331<<11)|(dst_332<<12)|(dst_333<<13)|(dst_334<<14)|(dst_335<<15)|(dst_336<<16)|(dst_337<<17)|(dst_338<<18)|(dst_339<<19)|(dst_340<<20)|(dst_341<<21)|(dst_342<<22)|(dst_343<<23)|(dst_344<<24)|(dst_345<<25)|(dst_346<<26)|(dst_347<<27)|(dst_348<<28)|(dst_349<<29)|(dst_350<<30)|(dst_351<<31);
r->w9 = (dst_288<<0)|(dst_289<<1)|(dst_290<<2)|(dst_291<<3)|(dst_292<<4)|(dst_293<<5)|(dst_294<<6)|(dst_295<<7)|(dst_296<<8)|(dst_297<<9)|(dst_298<<10)|(dst_299<<11)|(dst_300<<12)|(dst_301<<13)|(dst_302<<14)|(dst_303<<15)|(dst_304<<16)|(dst_305<<17)|(dst_306<<18)|(dst_307<<19)|(dst_308<<20)|(dst_309<<21)|(dst_310<<22)|(dst_311<<23)|(dst_312<<24)|(dst_313<<25)|(dst_314<<26)|(dst_315<<27)|(dst_316<<28)|(dst_317<<29)|(dst_318<<30)|(dst_319<<31);
r->w8 = (dst_256<<0)|(dst_257<<1)|(dst_258<<2)|(dst_259<<3)|(dst_260<<4)|(dst_261<<5)|(dst_262<<6)|(dst_263<<7)|(dst_264<<8)|(dst_265<<9)|(dst_266<<10)|(dst_267<<11)|(dst_268<<12)|(dst_269<<13)|(dst_270<<14)|(dst_271<<15)|(dst_272<<16)|(dst_273<<17)|(dst_274<<18)|(dst_275<<19)|(dst_276<<20)|(dst_277<<21)|(dst_278<<22)|(dst_279<<23)|(dst_280<<24)|(dst_281<<25)|(dst_282<<26)|(dst_283<<27)|(dst_284<<28)|(dst_285<<29)|(dst_286<<30)|(dst_287<<31);

}

void ap_uint_512_set_range_high_32(ap_uint_512p p, unsigned int offset, unsigned int size, unsigned int value);
unsigned int ap_uint_512_range_high_32(ap_uint_512 p, unsigned int start, unsigned int size);
unsigned int countZeros(unsigned int xpart, int size);

void printWordBin(unsigned int x, unsigned int size)
{
	for (int i=0; i < size; i++)
	{
		int v = (x >> size-1-i) & 0x1;
		printf("%d", v);
	}
}

unsigned int shouji(ap_uint_512 pattern,  int plen, ap_uint_512 text,  int tlen)
{
	ap_uint_512 acum;
	ap_uint_512_zero(AP_UINT_PTR(acum));

#ifdef FPGA_DEBUG
	for (int i=-SHOUJI_THRESHOLD; i <= SHOUJI_THRESHOLD; i++)
	{
		ap_uint_512 shifted_pattern;
		if (i < 0)
		{
			ap_uint_512_shift_left(pattern, (-i)*BASE_SIZE, AP_UINT_PTR(shifted_pattern));
		}
		else if (i==0)
		{
			ap_uint_512_set(AP_UINT_PTR(shifted_pattern), pattern);
		}
		else
		{
			// > 0
			ap_uint_512_shift_right(pattern, i*BASE_SIZE, AP_UINT_PTR(shifted_pattern));
		}

		printf("shift [%2d] =", i);
		printSequence(shifted_pattern, plen);
		printf("\n");
	}


	for (int i=-SHOUJI_THRESHOLD; i <= SHOUJI_THRESHOLD; i++)
	{
		ap_uint_512 shifted_pattern;
		if (i < 0)
		{
			ap_uint_512_shift_left(pattern, (-i)*BASE_SIZE, AP_UINT_PTR(shifted_pattern));
		}
		else if (i==0)
		{
			ap_uint_512_set(AP_UINT_PTR(shifted_pattern), pattern);
		}
		else
		{
			// > 0
			ap_uint_512_shift_right(pattern, i*BASE_SIZE, AP_UINT_PTR(shifted_pattern));
		}

		printf("shift [%2d] =", i);
		ap_uint_512_printBinHigh(shifted_pattern, plen);
		printf("\n");

	}
#endif



	ap_uint_512 shifted_pattern_m3;
	ap_uint_512 dist_m3;

	ap_uint_512_shift_left(pattern, (3)*BASE_SIZE, AP_UINT_PTR(shifted_pattern_m3));
	xorBases(shifted_pattern_m3, text, AP_UINT_PTR(dist_m3));
			

	ap_uint_512 shifted_pattern_m2;
	ap_uint_512 dist_m2;

	ap_uint_512_shift_left(pattern, (2)*BASE_SIZE, AP_UINT_PTR(shifted_pattern_m2));
	xorBases(shifted_pattern_m2, text, AP_UINT_PTR(dist_m2));
			

	ap_uint_512 shifted_pattern_m1;
	ap_uint_512 dist_m1;

	ap_uint_512_shift_left(pattern, (1)*BASE_SIZE, AP_UINT_PTR(shifted_pattern_m1));
	xorBases(shifted_pattern_m1, text, AP_UINT_PTR(dist_m1));
			

	ap_uint_512 shifted_pattern_0;
	ap_uint_512 dist_0;

	ap_uint_512_set(AP_UINT_PTR(shifted_pattern_0), pattern);
	xorBases(shifted_pattern_0, text, AP_UINT_PTR(dist_0));
				

	ap_uint_512 shifted_pattern_p1;
	ap_uint_512 dist_p1;

	ap_uint_512_shift_right(pattern, 1*BASE_SIZE, AP_UINT_PTR(shifted_pattern_p1));
	xorBases(shifted_pattern_p1, text, AP_UINT_PTR(dist_p1));
				

	ap_uint_512 shifted_pattern_p2;
	ap_uint_512 dist_p2;

	ap_uint_512_shift_right(pattern, 2*BASE_SIZE, AP_UINT_PTR(shifted_pattern_p2));
	xorBases(shifted_pattern_p2, text, AP_UINT_PTR(dist_p2));
				

	ap_uint_512 shifted_pattern_p3;
	ap_uint_512 dist_p3;

	ap_uint_512_shift_right(pattern, 3*BASE_SIZE, AP_UINT_PTR(shifted_pattern_p3));
	xorBases(shifted_pattern_p3, text, AP_UINT_PTR(dist_p3));
				





	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 0, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 0, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 0, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 0, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 0, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 0, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 0, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 0, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 0, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 0, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 0, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 0, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 0, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 0, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (0 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 0, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 1, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 1, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 1, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 1, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 1, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 1, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 1, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 1, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 1, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 1, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 1, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 1, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 1, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 1, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (1 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 1, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 2, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 2, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 2, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 2, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 2, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 2, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 2, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 2, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 2, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 2, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 2, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 2, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 2, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 2, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (2 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 2, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 3, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 3, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 3, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 3, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 3, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 3, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 3, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 3, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 3, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 3, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 3, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 3, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 3, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 3, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (3 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 3, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 4, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 4, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 4, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 4, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 4, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 4, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 4, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 4, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 4, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 4, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 4, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 4, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 4, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 4, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (4 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 4, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 5, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 5, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 5, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 5, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 5, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 5, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 5, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 5, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 5, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 5, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 5, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 5, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 5, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 5, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (5 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 5, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 6, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 6, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 6, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 6, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 6, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 6, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 6, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 6, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 6, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 6, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 6, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 6, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 6, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 6, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (6 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 6, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 7, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 7, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 7, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 7, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 7, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 7, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 7, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 7, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 7, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 7, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 7, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 7, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 7, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 7, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (7 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 7, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 8, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 8, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 8, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 8, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 8, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 8, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 8, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 8, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 8, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 8, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 8, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 8, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 8, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 8, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (8 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 8, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 9, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 9, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 9, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 9, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 9, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 9, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 9, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 9, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 9, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 9, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 9, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 9, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 9, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 9, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (9 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 9, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 10, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 10, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 10, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 10, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 10, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 10, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 10, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 10, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 10, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 10, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 10, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 10, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 10, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 10, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (10 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 10, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 11, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 11, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 11, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 11, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 11, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 11, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 11, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 11, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 11, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 11, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 11, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 11, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 11, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 11, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (11 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 11, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 12, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 12, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 12, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 12, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 12, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 12, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 12, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 12, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 12, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 12, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 12, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 12, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 12, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 12, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (12 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 12, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 13, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 13, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 13, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 13, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 13, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 13, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 13, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 13, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 13, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 13, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 13, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 13, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 13, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 13, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (13 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 13, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 14, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 14, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 14, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 14, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 14, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 14, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 14, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 14, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 14, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 14, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 14, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 14, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 14, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 14, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (14 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 14, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 15, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 15, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 15, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 15, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 15, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 15, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 15, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 15, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 15, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 15, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 15, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 15, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 15, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 15, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (15 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 15, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 16, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 16, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 16, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 16, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 16, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 16, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 16, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 16, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 16, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 16, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 16, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 16, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 16, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 16, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (16 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 16, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 17, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 17, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 17, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 17, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 17, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 17, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 17, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 17, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 17, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 17, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 17, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 17, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 17, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 17, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (17 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 17, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 18, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 18, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 18, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 18, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 18, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 18, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 18, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 18, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 18, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 18, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 18, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 18, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 18, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 18, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (18 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 18, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 19, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 19, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 19, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 19, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 19, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 19, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 19, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 19, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 19, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 19, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 19, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 19, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 19, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 19, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (19 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 19, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 20, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 20, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 20, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 20, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 20, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 20, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 20, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 20, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 20, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 20, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 20, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 20, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 20, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 20, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (20 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 20, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 21, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 21, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 21, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 21, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 21, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 21, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 21, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 21, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 21, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 21, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 21, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 21, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 21, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 21, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (21 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 21, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 22, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 22, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 22, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 22, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 22, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 22, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 22, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 22, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 22, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 22, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 22, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 22, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 22, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 22, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (22 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 22, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 23, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 23, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 23, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 23, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 23, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 23, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 23, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 23, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 23, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 23, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 23, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 23, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 23, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 23, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (23 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 23, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 24, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 24, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 24, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 24, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 24, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 24, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 24, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 24, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 24, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 24, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 24, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 24, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 24, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 24, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (24 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 24, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 25, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 25, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 25, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 25, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 25, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 25, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 25, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 25, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 25, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 25, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 25, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 25, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 25, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 25, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (25 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 25, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 26, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 26, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 26, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 26, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 26, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 26, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 26, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 26, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 26, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 26, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 26, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 26, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 26, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 26, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (26 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 26, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 27, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 27, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 27, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 27, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 27, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 27, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 27, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 27, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 27, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 27, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 27, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 27, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 27, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 27, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (27 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 27, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 28, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 28, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 28, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 28, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 28, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 28, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 28, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 28, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 28, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 28, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 28, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 28, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 28, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 28, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (28 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 28, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 29, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 29, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 29, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 29, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 29, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 29, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 29, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 29, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 29, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 29, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 29, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 29, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 29, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 29, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (29 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 29, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 30, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 30, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 30, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 30, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 30, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 30, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 30, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 30, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 30, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 30, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 30, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 30, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 30, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 30, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (30 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 30, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 31, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 31, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 31, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 31, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 31, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 31, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 31, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 31, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 31, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 31, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 31, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 31, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 31, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 31, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (31 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 31, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 32, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 32, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 32, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 32, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 32, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 32, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 32, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 32, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 32, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 32, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 32, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 32, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 32, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 32, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (32 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 32, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 33, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 33, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 33, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 33, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 33, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 33, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 33, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 33, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 33, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 33, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 33, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 33, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 33, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 33, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (33 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 33, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 34, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 34, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 34, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 34, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 34, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 34, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 34, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 34, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 34, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 34, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 34, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 34, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 34, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 34, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (34 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 34, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 35, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 35, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 35, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 35, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 35, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 35, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 35, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 35, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 35, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 35, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 35, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 35, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 35, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 35, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (35 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 35, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 36, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 36, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 36, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 36, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 36, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 36, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 36, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 36, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 36, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 36, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 36, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 36, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 36, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 36, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (36 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 36, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 37, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 37, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 37, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 37, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 37, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 37, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 37, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 37, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 37, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 37, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 37, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 37, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 37, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 37, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (37 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 37, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 38, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 38, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 38, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 38, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 38, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 38, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 38, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 38, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 38, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 38, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 38, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 38, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 38, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 38, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (38 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 38, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 39, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 39, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 39, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 39, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 39, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 39, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 39, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 39, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 39, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 39, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 39, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 39, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 39, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 39, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (39 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 39, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 40, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 40, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 40, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 40, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 40, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 40, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 40, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 40, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 40, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 40, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 40, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 40, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 40, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 40, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (40 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 40, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 41, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 41, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 41, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 41, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 41, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 41, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 41, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 41, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 41, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 41, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 41, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 41, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 41, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 41, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (41 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 41, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 42, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 42, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 42, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 42, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 42, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 42, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 42, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 42, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 42, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 42, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 42, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 42, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 42, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 42, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (42 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 42, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 43, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 43, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 43, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 43, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 43, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 43, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 43, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 43, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 43, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 43, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 43, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 43, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 43, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 43, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (43 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 43, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 44, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 44, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 44, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 44, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 44, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 44, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 44, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 44, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 44, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 44, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 44, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 44, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 44, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 44, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (44 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 44, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 45, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 45, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 45, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 45, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 45, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 45, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 45, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 45, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 45, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 45, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 45, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 45, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 45, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 45, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (45 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 45, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 46, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 46, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 46, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 46, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 46, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 46, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 46, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 46, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 46, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 46, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 46, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 46, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 46, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 46, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (46 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 46, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 47, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 47, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 47, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 47, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 47, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 47, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 47, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 47, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 47, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 47, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 47, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 47, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 47, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 47, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (47 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 47, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 48, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 48, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 48, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 48, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 48, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 48, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 48, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 48, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 48, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 48, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 48, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 48, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 48, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 48, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (48 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 48, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 49, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 49, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 49, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 49, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 49, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 49, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 49, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 49, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 49, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 49, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 49, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 49, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 49, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 49, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (49 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 49, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 50, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 50, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 50, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 50, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 50, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 50, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 50, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 50, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 50, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 50, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 50, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 50, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 50, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 50, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (50 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 50, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 51, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 51, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 51, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 51, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 51, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 51, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 51, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 51, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 51, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 51, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 51, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 51, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 51, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 51, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (51 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 51, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 52, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 52, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 52, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 52, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 52, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 52, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 52, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 52, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 52, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 52, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 52, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 52, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 52, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 52, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (52 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 52, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 53, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 53, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 53, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 53, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 53, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 53, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 53, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 53, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 53, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 53, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 53, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 53, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 53, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 53, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (53 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 53, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 54, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 54, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 54, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 54, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 54, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 54, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 54, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 54, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 54, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 54, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 54, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 54, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 54, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 54, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (54 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 54, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 55, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 55, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 55, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 55, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 55, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 55, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 55, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 55, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 55, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 55, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 55, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 55, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 55, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 55, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (55 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 55, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 56, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 56, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 56, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 56, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 56, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 56, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 56, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 56, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 56, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 56, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 56, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 56, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 56, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 56, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (56 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 56, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 57, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 57, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 57, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 57, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 57, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 57, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 57, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 57, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 57, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 57, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 57, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 57, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 57, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 57, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (57 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 57, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 58, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 58, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 58, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 58, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 58, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 58, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 58, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 58, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 58, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 58, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 58, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 58, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 58, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 58, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (58 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 58, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 59, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 59, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 59, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 59, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 59, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 59, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 59, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 59, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 59, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 59, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 59, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 59, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 59, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 59, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (59 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 59, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 60, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 60, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 60, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 60, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 60, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 60, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 60, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 60, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 60, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 60, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 60, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 60, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 60, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 60, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (60 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 60, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 61, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 61, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 61, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 61, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 61, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 61, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 61, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 61, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 61, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 61, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 61, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 61, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 61, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 61, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (61 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 61, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 62, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 62, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 62, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 62, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 62, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 62, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 62, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 62, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 62, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 62, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 62, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 62, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 62, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 62, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (62 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 62, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 63, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 63, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 63, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 63, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 63, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 63, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 63, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 63, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 63, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 63, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 63, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 63, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 63, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 63, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (63 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 63, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 64, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 64, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 64, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 64, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 64, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 64, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 64, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 64, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 64, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 64, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 64, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 64, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 64, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 64, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (64 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 64, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 65, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 65, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 65, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 65, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 65, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 65, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 65, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 65, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 65, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 65, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 65, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 65, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 65, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 65, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (65 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 65, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 66, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 66, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 66, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 66, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 66, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 66, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 66, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 66, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 66, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 66, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 66, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 66, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 66, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 66, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (66 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 66, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 67, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 67, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 67, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 67, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 67, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 67, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 67, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 67, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 67, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 67, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 67, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 67, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 67, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 67, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (67 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 67, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 68, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 68, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 68, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 68, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 68, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 68, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 68, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 68, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 68, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 68, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 68, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 68, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 68, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 68, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (68 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 68, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 69, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 69, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 69, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 69, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 69, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 69, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 69, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 69, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 69, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 69, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 69, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 69, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 69, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 69, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (69 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 69, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 70, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 70, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 70, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 70, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 70, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 70, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 70, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 70, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 70, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 70, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 70, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 70, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 70, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 70, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (70 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 70, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 71, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 71, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 71, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 71, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 71, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 71, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 71, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 71, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 71, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 71, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 71, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 71, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 71, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 71, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (71 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 71, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 72, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 72, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 72, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 72, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 72, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 72, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 72, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 72, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 72, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 72, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 72, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 72, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 72, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 72, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (72 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 72, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 73, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 73, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 73, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 73, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 73, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 73, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 73, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 73, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 73, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 73, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 73, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 73, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 73, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 73, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (73 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 73, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 74, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 74, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 74, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 74, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 74, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 74, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 74, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 74, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 74, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 74, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 74, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 74, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 74, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 74, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (74 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 74, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 75, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 75, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 75, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 75, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 75, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 75, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 75, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 75, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 75, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 75, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 75, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 75, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 75, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 75, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (75 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 75, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 76, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 76, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 76, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 76, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 76, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 76, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 76, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 76, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 76, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 76, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 76, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 76, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 76, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 76, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (76 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 76, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 77, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 77, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 77, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 77, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 77, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 77, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 77, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 77, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 77, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 77, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 77, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 77, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 77, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 77, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (77 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 77, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 78, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 78, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 78, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 78, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 78, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 78, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 78, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 78, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 78, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 78, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 78, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 78, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 78, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 78, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (78 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 78, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 79, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 79, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 79, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 79, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 79, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 79, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 79, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 79, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 79, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 79, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 79, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 79, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 79, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 79, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (79 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 79, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 80, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 80, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 80, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 80, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 80, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 80, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 80, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 80, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 80, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 80, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 80, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 80, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 80, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 80, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (80 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 80, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 81, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 81, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 81, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 81, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 81, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 81, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 81, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 81, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 81, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 81, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 81, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 81, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 81, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 81, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (81 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 81, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 82, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 82, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 82, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 82, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 82, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 82, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 82, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 82, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 82, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 82, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 82, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 82, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 82, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 82, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (82 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 82, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 83, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 83, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 83, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 83, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 83, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 83, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 83, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 83, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 83, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 83, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 83, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 83, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 83, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 83, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (83 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 83, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 84, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 84, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 84, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 84, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 84, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 84, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 84, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 84, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 84, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 84, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 84, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 84, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 84, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 84, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (84 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 84, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 85, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 85, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 85, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 85, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 85, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 85, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 85, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 85, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 85, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 85, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 85, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 85, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 85, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 85, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (85 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 85, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 86, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 86, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 86, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 86, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 86, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 86, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 86, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 86, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 86, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 86, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 86, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 86, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 86, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 86, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (86 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 86, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 87, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 87, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 87, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 87, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 87, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 87, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 87, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 87, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 87, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 87, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 87, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 87, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 87, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 87, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (87 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 87, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 88, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 88, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 88, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 88, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 88, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 88, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 88, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 88, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 88, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 88, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 88, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 88, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 88, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 88, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (88 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 88, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 89, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 89, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 89, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 89, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 89, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 89, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 89, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 89, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 89, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 89, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 89, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 89, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 89, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 89, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (89 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 89, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 90, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 90, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 90, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 90, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 90, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 90, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 90, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 90, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 90, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 90, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 90, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 90, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 90, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 90, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (90 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 90, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 91, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 91, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 91, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 91, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 91, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 91, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 91, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 91, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 91, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 91, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 91, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 91, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 91, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 91, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (91 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 91, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 92, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 92, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 92, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 92, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 92, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 92, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 92, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 92, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 92, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 92, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 92, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 92, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 92, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 92, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (92 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 92, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 93, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 93, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 93, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 93, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 93, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 93, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 93, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 93, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 93, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 93, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 93, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 93, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 93, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 93, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (93 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 93, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 94, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 94, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 94, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 94, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 94, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 94, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 94, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 94, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 94, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 94, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 94, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 94, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 94, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 94, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (94 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 94, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 95, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 95, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 95, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 95, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 95, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 95, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 95, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 95, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 95, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 95, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 95, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 95, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 95, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 95, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (95 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 95, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 96, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 96, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 96, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 96, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 96, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 96, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 96, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 96, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 96, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 96, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 96, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 96, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 96, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 96, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (96 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 96, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 97, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 97, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 97, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 97, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 97, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 97, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 97, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 97, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 97, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 97, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 97, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 97, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 97, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 97, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (97 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 97, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 98, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 98, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 98, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 98, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 98, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 98, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 98, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 98, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 98, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 98, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 98, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 98, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 98, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 98, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (98 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 98, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 99, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 99, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 99, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 99, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 99, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 99, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 99, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 99, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 99, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 99, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 99, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 99, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 99, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 99, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (99 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 99, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 100, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 100, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 100, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 100, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 100, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 100, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 100, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 100, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 100, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 100, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 100, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 100, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 100, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 100, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (100 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 100, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 101, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 101, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 101, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 101, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 101, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 101, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 101, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 101, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 101, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 101, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 101, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 101, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 101, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 101, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (101 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 101, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 102, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 102, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 102, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 102, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 102, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 102, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 102, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 102, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 102, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 102, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 102, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 102, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 102, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 102, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (102 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 102, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 103, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 103, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 103, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 103, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 103, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 103, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 103, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 103, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 103, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 103, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 103, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 103, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 103, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 103, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (103 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 103, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 104, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 104, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 104, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 104, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 104, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 104, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 104, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 104, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 104, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 104, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 104, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 104, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 104, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 104, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (104 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 104, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 105, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 105, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 105, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 105, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 105, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 105, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 105, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 105, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 105, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 105, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 105, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 105, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 105, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 105, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (105 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 105, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 106, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 106, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 106, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 106, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 106, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 106, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 106, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 106, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 106, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 106, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 106, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 106, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 106, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 106, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (106 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 106, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 107, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 107, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 107, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 107, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 107, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 107, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 107, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 107, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 107, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 107, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 107, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 107, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 107, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 107, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (107 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 107, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 108, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 108, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 108, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 108, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 108, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 108, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 108, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 108, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 108, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 108, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 108, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 108, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 108, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 108, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (108 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 108, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 109, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 109, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 109, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 109, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 109, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 109, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 109, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 109, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 109, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 109, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 109, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 109, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 109, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 109, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (109 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 109, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 110, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 110, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 110, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 110, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 110, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 110, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 110, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 110, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 110, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 110, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 110, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 110, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 110, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 110, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (110 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 110, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 111, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 111, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 111, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 111, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 111, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 111, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 111, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 111, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 111, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 111, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 111, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 111, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 111, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 111, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (111 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 111, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 112, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 112, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 112, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 112, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 112, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 112, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 112, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 112, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 112, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 112, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 112, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 112, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 112, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 112, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (112 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 112, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 113, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 113, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 113, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 113, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 113, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 113, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 113, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 113, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 113, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 113, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 113, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 113, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 113, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 113, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (113 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 113, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 114, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 114, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 114, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 114, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 114, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 114, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 114, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 114, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 114, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 114, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 114, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 114, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 114, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 114, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (114 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 114, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 115, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 115, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 115, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 115, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 115, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 115, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 115, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 115, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 115, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 115, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 115, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 115, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 115, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 115, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (115 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 115, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 116, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 116, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 116, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 116, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 116, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 116, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 116, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 116, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 116, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 116, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 116, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 116, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 116, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 116, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (116 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 116, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 117, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 117, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 117, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 117, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 117, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 117, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 117, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 117, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 117, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 117, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 117, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 117, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 117, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 117, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (117 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 117, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 118, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 118, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 118, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 118, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 118, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 118, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 118, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 118, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 118, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 118, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 118, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 118, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 118, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 118, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (118 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 118, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 119, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 119, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 119, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 119, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 119, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 119, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 119, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 119, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 119, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 119, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 119, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 119, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 119, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 119, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (119 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 119, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 120, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 120, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 120, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 120, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 120, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 120, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 120, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 120, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 120, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 120, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 120, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 120, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 120, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 120, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (120 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 120, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 121, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 121, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 121, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 121, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 121, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 121, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 121, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 121, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 121, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 121, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 121, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 121, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 121, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 121, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (121 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 121, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 122, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 122, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 122, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 122, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 122, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 122, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 122, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 122, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 122, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 122, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 122, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 122, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 122, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 122, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (122 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 122, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 123, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 123, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 123, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 123, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 123, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 123, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 123, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 123, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 123, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 123, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 123, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 123, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 123, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 123, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (123 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 123, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 124, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 124, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 124, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 124, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 124, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 124, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 124, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 124, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 124, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 124, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 124, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 124, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 124, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 124, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (124 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 124, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 125, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 125, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 125, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 125, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 125, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 125, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 125, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 125, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 125, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 125, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 125, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 125, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 125, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 125, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (125 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 125, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 126, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 126, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 126, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 126, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 126, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 126, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 126, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 126, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 126, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 126, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 126, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 126, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 126, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 126, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (126 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 126, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 127, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 127, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 127, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 127, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 127, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 127, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 127, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 127, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 127, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 127, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 127, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 127, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 127, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 127, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (127 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 127, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 128, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 128, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 128, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 128, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 128, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 128, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 128, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 128, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 128, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 128, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 128, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 128, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 128, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 128, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (128 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 128, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 129, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 129, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 129, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 129, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 129, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 129, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 129, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 129, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 129, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 129, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 129, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 129, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 129, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 129, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (129 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 129, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 130, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 130, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 130, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 130, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 130, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 130, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 130, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 130, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 130, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 130, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 130, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 130, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 130, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 130, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (130 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 130, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 131, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 131, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 131, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 131, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 131, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 131, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 131, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 131, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 131, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 131, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 131, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 131, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 131, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 131, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (131 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 131, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 132, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 132, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 132, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 132, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 132, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 132, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 132, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 132, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 132, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 132, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 132, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 132, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 132, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 132, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (132 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 132, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 133, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 133, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 133, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 133, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 133, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 133, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 133, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 133, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 133, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 133, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 133, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 133, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 133, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 133, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (133 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 133, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 134, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 134, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 134, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 134, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 134, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 134, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 134, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 134, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 134, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 134, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 134, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 134, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 134, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 134, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (134 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 134, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 135, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 135, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 135, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 135, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 135, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 135, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 135, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 135, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 135, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 135, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 135, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 135, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 135, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 135, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (135 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 135, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 136, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 136, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 136, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 136, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 136, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 136, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 136, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 136, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 136, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 136, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 136, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 136, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 136, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 136, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (136 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 136, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 137, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 137, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 137, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 137, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 137, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 137, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 137, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 137, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 137, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 137, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 137, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 137, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 137, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 137, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (137 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 137, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 138, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 138, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 138, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 138, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 138, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 138, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 138, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 138, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 138, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 138, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 138, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 138, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 138, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 138, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (138 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 138, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 139, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 139, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 139, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 139, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 139, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 139, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 139, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 139, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 139, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 139, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 139, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 139, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 139, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 139, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (139 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 139, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 140, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 140, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 140, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 140, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 140, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 140, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 140, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 140, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 140, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 140, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 140, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 140, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 140, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 140, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (140 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 140, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 141, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 141, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 141, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 141, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 141, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 141, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 141, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 141, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 141, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 141, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 141, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 141, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 141, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 141, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (141 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 141, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 142, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 142, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 142, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 142, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 142, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 142, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 142, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 142, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 142, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 142, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 142, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 142, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 142, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 142, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (142 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 142, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 143, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 143, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 143, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 143, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 143, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 143, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 143, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 143, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 143, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 143, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 143, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 143, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 143, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 143, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (143 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 143, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 144, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 144, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 144, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 144, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 144, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 144, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 144, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 144, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 144, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 144, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 144, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 144, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 144, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 144, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (144 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 144, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 145, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 145, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 145, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 145, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 145, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 145, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 145, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 145, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 145, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 145, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 145, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 145, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 145, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 145, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (145 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 145, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 146, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 146, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 146, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 146, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 146, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 146, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 146, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 146, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 146, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 146, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 146, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 146, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 146, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 146, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (146 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 146, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 147, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 147, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 147, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 147, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 147, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 147, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 147, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 147, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 147, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 147, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 147, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 147, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 147, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 147, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (147 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 147, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 148, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 148, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 148, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 148, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 148, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 148, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 148, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 148, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 148, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 148, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 148, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 148, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 148, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 148, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (148 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 148, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 149, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 149, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 149, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 149, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 149, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 149, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 149, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 149, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 149, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 149, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 149, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 149, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 149, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 149, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (149 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 149, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 150, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 150, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 150, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 150, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 150, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 150, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 150, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 150, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 150, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 150, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 150, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 150, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 150, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 150, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (150 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 150, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 151, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 151, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 151, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 151, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 151, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 151, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 151, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 151, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 151, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 151, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 151, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 151, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 151, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 151, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (151 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 151, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 152, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 152, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 152, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 152, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 152, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 152, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 152, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 152, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 152, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 152, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 152, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 152, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 152, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 152, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (152 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 152, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 153, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 153, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 153, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 153, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 153, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 153, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 153, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 153, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 153, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 153, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 153, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 153, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 153, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 153, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (153 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 153, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 154, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 154, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 154, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 154, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 154, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 154, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 154, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 154, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 154, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 154, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 154, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 154, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 154, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 154, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (154 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 154, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 155, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 155, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 155, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 155, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 155, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 155, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 155, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 155, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 155, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 155, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 155, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 155, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 155, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 155, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (155 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 155, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 156, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 156, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 156, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 156, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 156, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 156, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 156, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 156, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 156, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 156, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 156, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 156, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 156, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 156, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (156 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 156, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 157, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 157, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 157, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 157, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 157, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 157, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 157, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 157, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 157, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 157, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 157, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 157, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 157, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 157, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (157 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 157, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 158, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 158, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 158, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 158, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 158, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 158, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 158, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 158, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 158, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 158, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 158, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 158, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 158, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 158, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (158 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 158, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 159, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 159, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 159, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 159, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 159, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 159, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 159, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 159, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 159, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 159, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 159, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 159, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 159, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 159, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (159 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 159, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 160, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 160, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 160, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 160, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 160, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 160, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 160, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 160, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 160, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 160, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 160, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 160, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 160, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 160, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (160 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 160, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 161, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 161, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 161, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 161, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 161, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 161, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 161, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 161, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 161, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 161, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 161, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 161, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 161, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 161, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (161 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 161, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 162, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 162, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 162, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 162, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 162, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 162, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 162, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 162, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 162, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 162, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 162, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 162, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 162, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 162, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (162 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 162, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 163, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 163, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 163, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 163, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 163, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 163, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 163, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 163, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 163, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 163, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 163, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 163, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 163, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 163, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (163 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 163, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 164, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 164, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 164, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 164, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 164, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 164, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 164, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 164, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 164, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 164, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 164, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 164, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 164, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 164, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (164 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 164, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 165, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 165, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 165, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 165, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 165, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 165, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 165, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 165, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 165, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 165, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 165, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 165, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 165, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 165, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (165 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 165, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 166, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 166, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 166, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 166, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 166, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 166, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 166, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 166, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 166, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 166, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 166, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 166, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 166, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 166, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (166 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 166, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 167, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 167, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 167, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 167, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 167, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 167, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 167, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 167, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 167, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 167, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 167, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 167, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 167, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 167, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (167 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 167, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 168, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 168, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 168, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 168, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 168, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 168, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 168, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 168, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 168, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 168, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 168, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 168, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 168, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 168, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (168 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 168, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 169, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 169, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 169, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 169, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 169, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 169, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 169, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 169, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 169, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 169, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 169, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 169, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 169, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 169, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (169 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 169, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 170, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 170, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 170, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 170, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 170, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 170, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 170, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 170, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 170, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 170, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 170, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 170, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 170, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 170, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (170 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 170, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 171, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 171, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 171, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 171, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 171, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 171, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 171, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 171, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 171, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 171, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 171, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 171, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 171, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 171, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (171 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 171, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 172, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 172, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 172, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 172, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 172, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 172, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 172, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 172, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 172, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 172, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 172, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 172, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 172, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 172, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (172 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 172, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 173, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 173, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 173, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 173, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 173, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 173, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 173, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 173, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 173, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 173, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 173, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 173, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 173, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 173, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (173 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 173, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 174, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 174, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 174, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 174, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 174, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 174, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 174, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 174, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 174, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 174, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 174, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 174, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 174, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 174, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (174 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 174, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 175, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 175, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 175, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 175, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 175, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 175, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 175, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 175, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 175, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 175, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 175, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 175, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 175, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 175, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (175 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 175, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 176, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 176, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 176, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 176, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 176, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 176, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 176, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 176, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 176, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 176, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 176, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 176, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 176, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 176, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (176 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 176, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 177, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 177, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 177, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 177, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 177, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 177, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 177, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 177, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 177, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 177, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 177, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 177, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 177, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 177, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (177 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 177, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 178, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 178, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 178, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 178, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 178, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 178, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 178, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 178, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 178, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 178, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 178, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 178, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 178, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 178, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (178 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 178, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 179, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 179, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 179, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 179, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 179, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 179, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 179, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 179, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 179, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 179, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 179, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 179, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 179, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 179, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (179 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 179, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 180, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 180, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 180, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 180, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 180, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 180, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 180, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 180, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 180, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 180, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 180, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 180, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 180, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 180, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (180 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 180, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 181, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 181, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 181, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 181, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 181, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 181, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 181, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 181, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 181, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 181, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 181, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 181, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 181, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 181, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (181 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 181, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 182, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 182, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 182, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 182, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 182, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 182, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 182, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 182, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 182, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 182, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 182, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 182, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 182, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 182, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (182 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 182, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 183, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 183, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 183, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 183, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 183, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 183, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 183, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 183, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 183, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 183, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 183, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 183, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 183, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 183, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (183 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 183, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 184, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 184, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 184, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 184, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 184, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 184, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 184, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 184, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 184, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 184, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 184, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 184, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 184, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 184, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (184 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 184, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 185, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 185, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 185, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 185, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 185, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 185, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 185, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 185, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 185, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 185, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 185, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 185, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 185, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 185, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (185 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 185, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 186, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 186, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 186, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 186, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 186, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 186, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 186, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 186, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 186, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 186, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 186, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 186, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 186, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 186, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (186 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 186, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 187, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 187, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 187, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 187, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 187, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 187, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 187, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 187, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 187, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 187, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 187, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 187, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 187, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 187, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (187 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 187, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 188, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 188, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 188, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 188, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 188, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 188, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 188, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 188, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 188, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 188, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 188, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 188, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 188, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 188, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (188 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 188, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 189, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 189, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 189, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 189, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 189, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 189, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 189, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 189, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 189, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 189, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 189, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 189, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 189, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 189, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (189 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 189, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 190, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 190, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 190, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 190, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 190, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 190, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 190, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 190, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 190, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 190, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 190, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 190, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 190, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 190, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (190 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 190, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 191, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 191, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 191, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 191, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 191, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 191, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 191, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 191, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 191, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 191, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 191, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 191, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 191, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 191, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (191 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 191, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 192, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 192, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 192, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 192, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 192, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 192, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 192, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 192, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 192, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 192, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 192, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 192, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 192, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 192, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (192 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 192, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 193, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 193, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 193, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 193, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 193, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 193, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 193, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 193, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 193, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 193, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 193, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 193, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 193, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 193, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (193 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 193, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 194, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 194, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 194, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 194, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 194, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 194, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 194, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 194, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 194, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 194, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 194, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 194, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 194, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 194, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (194 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 194, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 195, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 195, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 195, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 195, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 195, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 195, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 195, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 195, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 195, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 195, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 195, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 195, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 195, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 195, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (195 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 195, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 196, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 196, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 196, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 196, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 196, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 196, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 196, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 196, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 196, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 196, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 196, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 196, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 196, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 196, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (196 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 196, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 197, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 197, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 197, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 197, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 197, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 197, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 197, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 197, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 197, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 197, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 197, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 197, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 197, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 197, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (197 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 197, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 198, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 198, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 198, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 198, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 198, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 198, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 198, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 198, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 198, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 198, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 198, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 198, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 198, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 198, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (198 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 198, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 199, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 199, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 199, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 199, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 199, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 199, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 199, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 199, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 199, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 199, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 199, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 199, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 199, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 199, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (199 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 199, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 200, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 200, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 200, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 200, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 200, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 200, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 200, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 200, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 200, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 200, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 200, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 200, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 200, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 200, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (200 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 200, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 201, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 201, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 201, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 201, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 201, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 201, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 201, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 201, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 201, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 201, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 201, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 201, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 201, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 201, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (201 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 201, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 202, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 202, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 202, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 202, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 202, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 202, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 202, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 202, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 202, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 202, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 202, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 202, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 202, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 202, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (202 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 202, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 203, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 203, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 203, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 203, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 203, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 203, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 203, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 203, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 203, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 203, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 203, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 203, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 203, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 203, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (203 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 203, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 204, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 204, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 204, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 204, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 204, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 204, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 204, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 204, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 204, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 204, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 204, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 204, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 204, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 204, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (204 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 204, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 205, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 205, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 205, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 205, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 205, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 205, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 205, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 205, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 205, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 205, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 205, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 205, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 205, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 205, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (205 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 205, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 206, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 206, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 206, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 206, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 206, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 206, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 206, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 206, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 206, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 206, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 206, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 206, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 206, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 206, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (206 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 206, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 207, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 207, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 207, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 207, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 207, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 207, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 207, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 207, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 207, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 207, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 207, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 207, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 207, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 207, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (207 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 207, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 208, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 208, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 208, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 208, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 208, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 208, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 208, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 208, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 208, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 208, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 208, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 208, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 208, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 208, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (208 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 208, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 209, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 209, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 209, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 209, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 209, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 209, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 209, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 209, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 209, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 209, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 209, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 209, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 209, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 209, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (209 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 209, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 210, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 210, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 210, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 210, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 210, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 210, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 210, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 210, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 210, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 210, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 210, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 210, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 210, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 210, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (210 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 210, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 211, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 211, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 211, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 211, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 211, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 211, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 211, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 211, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 211, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 211, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 211, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 211, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 211, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 211, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (211 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 211, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 212, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 212, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 212, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 212, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 212, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 212, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 212, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 212, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 212, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 212, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 212, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 212, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 212, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 212, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (212 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 212, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 213, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 213, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 213, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 213, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 213, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 213, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 213, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 213, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 213, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 213, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 213, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 213, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 213, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 213, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (213 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 213, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 214, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 214, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 214, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 214, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 214, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 214, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 214, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 214, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 214, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 214, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 214, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 214, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 214, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 214, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (214 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 214, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 215, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 215, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 215, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 215, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 215, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 215, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 215, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 215, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 215, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 215, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 215, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 215, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 215, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 215, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (215 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 215, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 216, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 216, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 216, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 216, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 216, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 216, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 216, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 216, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 216, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 216, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 216, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 216, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 216, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 216, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (216 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 216, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 217, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 217, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 217, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 217, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 217, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 217, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 217, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 217, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 217, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 217, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 217, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 217, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 217, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 217, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (217 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 217, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 218, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 218, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 218, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 218, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 218, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 218, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 218, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 218, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 218, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 218, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 218, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 218, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 218, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 218, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (218 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 218, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 219, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 219, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 219, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 219, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 219, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 219, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 219, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 219, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 219, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 219, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 219, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 219, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 219, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 219, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (219 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 219, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 220, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 220, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 220, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 220, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 220, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 220, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 220, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 220, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 220, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 220, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 220, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 220, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 220, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 220, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (220 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 220, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 221, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 221, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 221, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 221, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 221, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 221, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 221, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 221, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 221, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 221, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 221, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 221, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 221, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 221, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (221 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 221, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 222, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 222, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 222, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 222, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 222, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 222, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 222, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 222, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 222, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 222, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 222, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 222, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 222, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 222, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (222 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 222, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 223, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 223, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 223, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 223, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 223, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 223, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 223, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 223, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 223, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 223, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 223, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 223, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 223, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 223, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (223 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 223, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 224, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 224, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 224, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 224, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 224, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 224, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 224, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 224, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 224, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 224, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 224, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 224, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 224, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 224, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (224 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 224, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 225, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 225, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 225, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 225, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 225, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 225, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 225, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 225, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 225, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 225, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 225, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 225, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 225, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 225, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (225 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 225, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 226, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 226, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 226, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 226, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 226, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 226, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 226, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 226, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 226, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 226, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 226, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 226, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 226, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 226, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (226 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 226, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 227, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 227, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 227, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 227, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 227, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 227, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 227, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 227, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 227, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 227, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 227, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 227, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 227, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 227, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (227 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 227, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 228, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 228, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 228, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 228, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 228, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 228, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 228, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 228, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 228, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 228, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 228, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 228, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 228, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 228, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (228 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 228, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 229, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 229, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 229, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 229, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 229, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 229, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 229, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 229, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 229, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 229, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 229, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 229, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 229, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 229, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (229 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 229, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 230, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 230, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 230, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 230, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 230, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 230, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 230, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 230, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 230, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 230, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 230, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 230, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 230, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 230, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (230 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 230, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 231, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 231, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 231, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 231, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 231, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 231, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 231, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 231, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 231, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 231, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 231, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 231, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 231, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 231, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (231 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 231, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 232, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 232, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 232, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 232, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 232, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 232, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 232, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 232, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 232, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 232, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 232, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 232, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 232, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 232, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (232 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 232, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 233, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 233, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 233, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 233, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 233, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 233, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 233, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 233, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 233, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 233, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 233, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 233, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 233, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 233, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (233 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 233, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 234, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 234, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 234, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 234, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 234, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 234, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 234, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 234, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 234, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 234, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 234, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 234, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 234, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 234, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (234 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 234, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 235, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 235, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 235, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 235, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 235, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 235, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 235, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 235, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 235, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 235, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 235, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 235, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 235, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 235, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (235 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 235, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 236, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 236, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 236, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 236, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 236, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 236, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 236, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 236, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 236, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 236, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 236, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 236, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 236, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 236, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (236 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 236, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 237, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 237, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 237, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 237, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 237, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 237, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 237, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 237, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 237, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 237, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 237, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 237, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 237, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 237, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (237 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 237, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 238, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 238, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 238, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 238, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 238, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 238, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 238, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 238, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 238, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 238, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 238, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 238, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 238, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 238, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (238 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 238, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 239, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 239, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 239, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 239, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 239, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 239, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 239, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 239, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 239, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 239, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 239, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 239, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 239, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 239, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (239 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 239, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 240, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 240, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 240, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 240, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 240, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 240, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 240, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 240, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 240, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 240, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 240, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 240, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 240, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 240, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (240 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 240, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 241, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 241, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 241, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 241, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 241, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 241, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 241, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 241, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 241, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 241, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 241, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 241, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 241, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 241, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (241 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 241, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 242, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 242, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 242, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 242, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 242, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 242, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 242, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 242, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 242, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 242, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 242, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 242, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 242, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 242, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (242 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 242, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 243, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 243, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 243, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 243, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 243, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 243, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 243, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 243, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 243, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 243, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 243, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 243, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 243, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 243, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (243 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 243, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 244, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 244, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 244, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 244, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 244, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 244, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 244, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 244, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 244, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 244, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 244, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 244, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 244, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 244, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (244 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 244, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 245, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 245, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 245, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 245, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 245, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 245, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 245, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 245, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 245, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 245, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 245, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 245, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 245, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 245, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (245 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 245, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 246, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 246, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 246, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 246, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 246, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 246, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 246, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 246, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 246, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 246, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 246, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 246, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 246, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 246, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (246 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 246, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 247, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 247, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 247, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 247, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 247, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 247, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 247, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 247, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 247, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 247, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 247, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 247, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 247, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 247, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (247 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 247, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 248, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 248, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 248, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 248, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 248, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 248, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 248, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 248, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 248, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 248, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 248, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 248, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 248, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 248, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (248 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 248, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 249, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 249, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 249, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 249, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 249, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 249, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 249, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 249, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 249, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 249, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 249, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 249, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 249, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 249, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (249 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 249, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 250, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 250, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 250, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 250, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 250, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 250, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 250, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 250, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 250, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 250, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 250, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 250, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 250, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 250, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (250 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 250, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 251, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 251, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 251, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 251, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 251, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 251, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 251, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 251, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 251, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 251, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 251, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 251, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 251, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 251, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (251 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 251, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 252, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 252, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 252, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 252, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 252, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 252, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 252, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 252, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 252, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 252, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 252, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 252, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 252, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 252, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (252 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 252, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 253, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 253, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 253, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 253, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 253, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 253, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 253, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 253, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 253, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 253, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 253, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 253, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 253, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 253, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (253 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 253, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 254, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 254, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 254, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 254, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 254, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 254, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 254, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 254, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 254, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 254, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 254, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 254, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 254, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 254, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (254 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 254, cb);
	}
	
	{
		unsigned int maxz = 0;
		int cb = 1;

		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m3, 255, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 255, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m2, 255, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 255, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_m1, 255, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 255, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_0, 255, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 255, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p1, 255, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 255, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p2, 255, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 255, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		
		{
			
			unsigned int xpart = ap_uint_512_range_high_32(dist_p3, 255, SHOUJI_WINDOW_SIZE);
			
			
			
		
			unsigned int cz = countZeros(xpart, SHOUJI_WINDOW_SIZE); 
			int xpart_hb = (xpart >> (SHOUJI_WINDOW_SIZE-1)) & 0x1;

			if ((cz > maxz) || (cz == maxz && (xpart_hb==0)))
			{
				maxz = cz;
				//ap_uint_512_set_range_high_32(AP_UINT_PTR(acum), 255, SHOUJI_WINDOW_SIZE, xpart);
				cb = xpart_hb;
			}
		}
		

		if (255 < plen)
			ap_uint_512_or_high_bit(AP_UINT_PTR(acum), 255, cb);
	}
	

#ifdef FPGA_DEBUG
	printf("acum       =");
	ap_uint_512_printBinHigh(acum, plen);
	printf("\n");
#endif

	return ap_uint_512_pop_count(acum);
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


unsigned int countZeros(unsigned int xpart, int size)
{
#if (SHOUJI_WINDOW_SIZE == 4)
	int b0 = (xpart >> 0) & 0x1;
	int b1 = (xpart >> 1) & 0x1;
	int b2 = (xpart >> 2) & 0x1;
	int b3 = (xpart >> 3) & 0x1;
	int nb0 = b0 ^ 0x1;
	int nb1 = b1 ^ 0x1;
	int nb2 = b2 ^ 0x1;
	int nb3 = b3 ^ 0x1;

	return nb0 + nb1 + nb2 + nb3;
#else
	#error We only support Shouji Window Size = 4 by now
#endif
}

unsigned int computeDistance(ap_uint_512 pattern,  int plen, ap_uint_512 text,  int tlen)
{
/*	printf("P =");
	printSequence(pattern, plen);
	printf("\n");

	printf("T =");
	printSequence(text, plen);
	printf("\n");

	ap_uint_512 dist;
	xorBases(pattern, text, AP_UINT_PTR(dist));

	printf("X =");
	ap_uint_512_printBinHigh(dist, plen);
	printf("\n");

	return 0;*/
	return shouji(pattern,  plen, text,  plen);
}



