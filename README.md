# ImageMagick 7 port to Android. 
 - MagickCore 7.0.5.2
 - 3rd party libs actual at 20170313
 - builds for armv7/x86/mips can be found at Android_ImageMagick7/tree/master/libs
 - OpenMP build by default (with gcc 4.9)
 - MagickWand
 - Magick++ support with STLPort. for other STL's see Rebuild section
 - binaries available here: [v0.2.7052](https://github.com/ayaromenok/Android_ImageMagick7/releases/tag/v0.2.7052)

# Why? 
 - ImageMagick7 is not fully compatible with early versions
 - build with OpenMP (DistortImage on 4core/armv7a get 3.597 speedup factor)
 - smaller binary size in case of using only MagickCore
 - Magick++ support for C++ code
 
# For C/C++ users
 - number of file formats disabled for now(tiff, exr, svg, jpeg2000, webp)
 - MagickWand and Magick++ added as separate Shared Objects
 
# For Java users
 Please, use https://github.com/paulasiimwe/Android-ImageMagick port of ImageMagick 6 - it's include Java interface

# Rebuild
 - change directory to jni
 - for Magick++ check STL version in Application.mk
 - run path-to-your-ndk/ndk-build -j 4 
 
# OpenMP 
 - depends from Application.mk details
 - Android NDK(current version 13) support OpenMP only when build with gcc toolchain
 - switching to clang toolchain or use default values (for NDK 13 and above) will disable OpenMP support
 

