#/bin/sh
cd  ..
rm -f -r obj
rm -f -r lib.gcc.opencl
rm -f -r lib
cd ./jni

rm -f ./Application.mk
ln -s ./Application.mk.gcc.opencl ./Application.mk
rm -f ./Android.mk
ln -s ./Android.mk.opencl ./Android.mk

cd ./ImageMagick/MagickCore
rm -f magick-baseconfig.h
ln -s magick-baseconfig.h.opencl magick-baseconfig.h
cd ../..

$ANDROID_SDK_PATH/ndk-bundle/ndk-build -j 4

cd ..
mv lib lib.gcc.opencl
ln -s lib.gcc.opencl lib
cd ./jni
