## Perfomance Tests of ImageMagick 7 /Android

### Table of Contest
1. [gcc at arm-v7a](#gcc at arm-v7a)
2. [clang at arm-v7a](clang at arm-v7a)
3. [32bit vs 64bit](#32bit_vs_64bit)
4. [ndk r15 vs r17b1](#nrk_r15_vs_r17b1)

### gcc at arm-v7a

| gcc\arm v7a |	E8895	| S652	 | TegraK1|	S4|
| -- | -- | -- | -- | -- | 
|OMP_Auto | 6260	|8032|	8817|	16919|
|OMP_1|	27914|	30287|	30271|	65554|
|OMP_2|	14012|	15475|	15380|	32293|
|OMP_4|	7209|	9813|	8791|	16916|
|OMP_8|	6294|	8167|	9134|	17014|

![gcc at arm-v7a](https://github.com/ayaromenok/Android_ImageMagick7/blob/master/doc/perfTest/res/armv7a_gcc49_ndk15.png)

### clang at arm-v7a
![clang at arm v7a](https://github.com/ayaromenok/Android_ImageMagick7/blob/master/doc/perfTest/res/armv7a_clang503_ndk15.png)
