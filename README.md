# Android_ImageMagick7
ImageMagick 7 port to Android. current version is 7.0.5.2
 - 3rd party libs actual at 20170313
 - builds for armv7/x86/mips can be found at Android_ImageMagick7/tree/master/libs
 - OpenMP build by default since 20170314
 - MagickWand build added to original MagickCore
 - Magick++ support with STLPort. if you use another STL implementation - may be you need to rebuild lib

#why? 
 - include only minimal C code - smaller size (~2.5MB for armv7a);
 - build with OpenMP (DistortImage on 4core/armv7a get 3.597 speedup factor)
 
#for C++ users
 - only MagickCore supported for now
 - number of file formats disabled for now(tiff, exr, svg, jpeg2000, webp)
 - MagcikWand added as separate Shared Object
 
#for Java users
Please, use https://github.com/paulasiimwe/Android-ImageMagick port of ImageMagick 6 - it's include Java interface

#rebuild
- change directory to jni
- run path-to-your-ndk/ndk-build -j 4 
