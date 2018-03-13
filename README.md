# ImageMagick 7 port to Android.
## Binaries
 - latest binaries for arm-v7a/arm64-v8a/x86/x86-64: [v0.4.70710.17b1](https://github.com/ayaromenok/Android_ImageMagick7/releases/tag/v0.4.70710.17b1)
 - latest binaries for mips32/misp64 and armv5: [v0.4.70710](https://github.com/ayaromenok/Android_ImageMagick7/releases/tag/v0.4.70710)

## Last changes
 - Image Magick updated to latest version
 - clang toolchain supported. 
	required Android NDK r15 to build (early versions had issues with OpenMP support)
 - NDK r17beta1 drop support of mips32/64 and arm v5. 
 - all binaries moved to [github release section](https://github.com/ayaromenok/Android_ImageMagick7/releases)

# General
 - MagickCore 7.0.7.10 (actual at 2017.11)
 - 3rd party libs actual at 2017.03
 - OpenMP build by default (with gcc 4.9 and clang 5.0.3)
 - MagickWand
 - Magick++ disable due to crash

# Why? 
 - ImageMagick7 is not fully compatible with early(6) version
 - build with OpenMP (DistortImage on 4core/armv7a get 3.597 speedup factor)
 - smaller binary size in case of using only MagickCore

# Test for ImageMagick 7/Android
 - demonstrtate OpenMP advantage on multi-core CPU in modern smartphones
 - GUI version published to [google play](https://play.google.com/store/apps/details?id=info.yaromenok.IM7Test) for armv7 and x86 

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

# OpenCL
 - can me much faster on certain operation (blur etc)
 - not working correctrly for now