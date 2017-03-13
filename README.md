# Android_ImageMagick7
ImageMagick 7 port to Android. current version is 7.0.5.2
 - 3rd party libs actual at 20170313
 - builds for armv7/x86/mips can be found at Android_ImageMagick7/tree/master/libs

#for C++ users
 - only MagickCore supported for now
 - number of file formats disabled for now(tiff, exr, svg, jpeg2000, webp)
 
#for Java users
Please, use https://github.com/paulasiimwe/Android-ImageMagick port of ImageMagick 6 - it's include Java interface

#rebuild
ndk10 supported due to getdtablesize() removed from ndk11
- change directory to jni
- run path-to-your-ndk/ndk-build -j 4 
