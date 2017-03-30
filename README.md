# Android_ImageMagick7
ImageMagick 7 port to Android. 
 - based on 7.0.5.2
 - 3rd party libs actual at 20170313
 - builds for armv7/x86/mips can be found at Android_ImageMagick7/tree/master/libs
 - OpenMP build by default
 - MagickWand build added to original MagickCore
 - Magick++ support with STLPort. if you use another STL implementation - may be you need to rebuild lib

#why? 
 - ImageMagick7 is not fully compatible with early versions
 - build with OpenMP (DistortImage on 4core/armv7a get 3.597 speedup factor)
 - smaller binary size in case of using only MagickCore
 - Magick++ support for C++ code
 
#for C/C++ users
 - number of file formats disabled for now(tiff, exr, svg, jpeg2000, webp)
 - MagickWand and Magick++ added as separate Shared Objects
 
#for Java users
 Please, use https://github.com/paulasiimwe/Android-ImageMagick port of ImageMagick 6 - it's include Java interface

#rebuild
 - change directory to jni
 - for Magick++ check STL version in Application.mk
 - run path-to-your-ndk/ndk-build -j 4 

