# ImageMagick 7 port to Android.
## Binaries 
 - latest binaries for `arm-v7a/arm64-v8a/x86/x86-64`: [v0.4.7083.17](https://github.com/ayaromenok/Android_ImageMagick7/releases/tag/v0.4.7083.17)
 - latest binaries for `mips32/misp64` and `armv5`: [v0.4.70710](https://github.com/ayaromenok/Android_ImageMagick7/releases/tag/v0.4.70710)
 - release number pattern is follow: vX.X.YYYYY.ZZ, where X.X - major\minor number for build, YYYYY - ImageMagick version(i.e. 70735 is 7.0.7.35), ZZ - NDK version (i.e. 17b1 - NDK17beta1) 

## Last changes
 - return build of magick utility by default
 - Image Magick updated to latest version (7.0.8.3)
 - clang toolchain supported. 
	required Android NDK r15 to build (early versions had issues with OpenMP support)
 - NDK r17 and later drop support for mips32/64 and arm v5. 
 - all binaries moved to [github release section](https://github.com/ayaromenok/Android_ImageMagick7/releases)

# General
 - MagickCore 7.0.8.3 (actual at 2018.06.28)
 - MagickWand
 - 3rd party libs actual at 2017.03
 - OpenMP build by default (with gcc 4.9 and clang 5.0.3)
 - Magick++ disable due to crash, sources removed (looks like nobody used it anyway)

# Why? 
 - ImageMagick7 is not fully compatible with early(ImageMagick6) version
 - build with OpenMP (DistortImage on 4core/armv7a get 3.597 speedup factor)
 - smaller binary size in case of using only MagickCore

# Test for ImageMagick 7/Android
 - test app code exist in ./prj/IM7Test. It can be used as example for C\C++\qmake project.
 - demonstrtate OpenMP advantage on multi-core CPU in modern smartphones
 - GUI version published to [google play](https://play.google.com/store/apps/details?id=info.yaromenok.IM7Test) for armv7 and x86 

# For C/C++ users
 - number of file formats disabled for now(exr, svg, jpeg2000, webp) and not planed to enable back (looks like nobody use it)
 - MagickWand added as separate Shared Object - need to be linked separately
 
# For Java users
 Please, use (cherryleafroad port)[https://github.com/cherryleafroad/Android-ImageMagick7] of ImageMagick7 with optional JMagick support (currently only for amr64)
 Please, use (paulasiimwe port)[https://github.com/paulasiimwe/Android-ImageMagick] of ImageMagick 6 - it's include Java interface (JMagick)

# Rebuild 
 - change directory to Android_ImageMagick7/jni
 - run path-to-your-ndk/ndk-build -j 4 
 - or set up envinronment variable ANDROID_SDK_PATH and run gccBuild/clangBuild.sh
 
# OpenMP 
 - depends from Application.mk details
 - Android NDK(current version 17b1) support OpenMP with both clang and gcc toolchain (binaries provided for both) 

# OpenCL
 - can me much faster on certain operation (blur etc)
 - not working correctrly for now

# License
Licenses for ImageMagick and supported libs(libpng, libjpg, etc) can be found in corresponding jni/src dirs.
All other covererd by MIT License
