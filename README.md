# ImageMagick 7 port to Android.
## Last changes
 - clang toolchain supported. 
	required Android NDK r15 to build (early versions had issues with OpenMP support)
 - all binaries moved to [github release section](https://github.com/ayaromenok/Android_ImageMagick7/releases)

# General
 - MagickCore 7.0.5.2
 - 3rd party libs actual at 20170313
 - OpenMP build by default (with gcc 4.9 and clang 5.0.3)
 - MagickWand
 - Magick++ disable due to crash
 - latest binaries: [v0.3.7052](https://github.com/ayaromenok/Android_ImageMagick7/releases/tag/v0.3.7052)

# Why? 
 - ImageMagick7 is not fully compatible with early(6) version
 - build with OpenMP (DistortImage on 4core/armv7a get 3.597 speedup factor)
 - smaller binary size in case of using only MagickCore

# Test for ImageMagick 7/Android
 - demonstrtate OpenMP advantage on multi-core CPU in modern smartphones
 - support armv7/x86 as app in Google Play
 - console 
 
# For C/C++ users
 - number of file formats disabled for now(tiff, exr, svg, jpeg2000, webp)
 - MagickWand and Magick++ added as separate Shared Objects
 
# For Java users
 Please, use https://github.com/paulasiimwe/Android-ImageMagick port of ImageMagick 6 - it's include Java interface

# Rebuild
 - change directory to Android_ImageMagick7/jni
 - run path-to-your-ndk/ndk-build -j 4 
 
# OpenMP 
 - depends from Application.mk details
 - Android NDK(current version 15) support OpenMP with both clang and gcc toolchain (binaries provided for both) 

