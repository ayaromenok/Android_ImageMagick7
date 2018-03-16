## Perfomance Tests of ImageMagick 7 /Android

### Table of Contest
1. [Introduction](#intro) 
2. [gcc at arm-v7a](#gcc_at_arm-v7a)
3. [clang at arm-v7a](#clang_at_arm-v7a)
4. [32 bit vs 64 bit](#32bit_vs_64bit)
5. [ndk r15 vs r17b1](#ndk_r15_vs_r17b1)
6. [Conclusion](#conclusion)

### Intoduction <a name="intro"> </a>
Due to a huge combination of different hardware, compilers and architecture width (32 and 64 bit) dramatically affect a performance of applications and libraries, like ImageMagick in this particular case.

Tests below show some key difference based in BlureImage function form ImageMagick core. 
Biggest performance difference achieved: 
* 64/32bit: ~ +70% - between ndk15/gcc4.9/arm-v7a/32bit and ndk17b1/clang/arm-v8a/64bit at (Samsung Enynos 8895/Galaxy S8).  
* for 32bit only:   ~ +40% between ndk15/gcc4.9/arm-v7a and ndk17b1/clang/arm-v7a - at NVidia K1/32bit/Shield tablet
* also some architectures required older builds for better performance: ~ -33% drop at ndk15/gcc4.9/arm-v7a and ndk17b1/clang/arm-v7a for Quallcom Snapdragon S4 Pro/Google Nexus 7/2013
* also some hardware/software have a issues(bugs) in OpenMP implementation of clang: Quallcom Snapdragon 652 at LG G5 SE - difference between 1 and 4/8 threads about 2 times only in case of ndk15/clang.

### gcc at arm-v7a <a name="gcc_at_arm-v7a"> </a>

| gcc\arm v7a |	E8895	| S652	 | TegraK1|	S4|
| -- | -- | -- | -- | -- | 
|OMP_Auto | 6260	|8032|	8817|	16919|
|OMP_1|	27914|	30287|	30271|	65554|
|OMP_2|	14012|	15475|	15380|	32293|
|OMP_4|	7209|	9813|	8791|	16916|
|OMP_8|	6294|	8167|	9134|	17014|

![gcc at arm-v7a](https://github.com/ayaromenok/Android_ImageMagick7/blob/master/doc/perfTest/res/armv7a_gcc49_ndk15.png)

### clang at arm-v7a <a name="clang_at_arm-v7a"> </a>
|clang| E8895 | S652 | TegraK1 | S4 |
| -- | -- | -- | -- | -- | 	
|OMP_Auto|	5963|13527|8323|21035|
|OMP_1|24754|23387|27808|80884|
|OMP_2|12449|11820|14071|43264|
|OMP_4|6302|11380|8268|21511|
|OMP_8|6258|11054|8099|21873|

![clang at arm v7a](https://github.com/ayaromenok/Android_ImageMagick7/blob/master/doc/perfTest/res/armv7a_clang503_ndk15.png)

### 32 bit vs 64 bit, clang vs gcc <a name="32bit_vs_64bit"> </a>
|E8895| gcc64|clang64|gcc32|clang32|
| -- | -- | -- | -- | -- | 	
OMP_Auto|3934|3810|6260|5963|
OMP_1|16665|13185|	27914|24754
OMP_2|8377|6618|14012|12449
OMP_4|4278|3770|7209|6302
OMP_8|4029|3881|6294|6258

![Samsung E8895: 32 bit vs 64 bit, gcc vs clang](https://github.com/ayaromenok/Android_ImageMagick7/blob/master/doc/perfTest/res/E8895_gcc_clang_32b_64b.png)

### NDK r15 vs r17b1 <a name ="ndk_r15_vs_r17b1"> </a>

|E8895|clang32\R15|clang64\R15|clang32\R17b1|clang64\R17b1|
| -- | -- | -- | -- | -- | 	
OMP_Auto|5963|3810|5760|3675
OMP_1|24754|13185|23172|12420
OMP_2|12449|6618|11771|6461
OMP_4|6302|3770|6025|3585
OMP_8|6258|3881|5587|3748

![clang: NDK r15 vs r17beta1](https://github.com/ayaromenok/Android_ImageMagick7/blob/master/doc/perfTest/res/clang_ndk15_ndk17b1.png)

### Conclusion <a name="conclusion"> </a>
It is no "universal" solution exist in deeply fragmented Android world, so minimizing number of target hardware\software only a solution. 

Typically, newest clang work better for newest hw\sw, while for oldest hw\sw a gcc 4.9 from ndk 15(or even early) is a good choice.

For 32+64bit APK can be used  combination of both type from above:
	
 - for 32bit: gcc 4.9\ndk 15
 - for 64bit: clang\ndk17b1+
