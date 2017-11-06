#/bin/sh
cd  ..
rm -f -r obj
rm -f -r libs.gcc.opencl
rm -f -r libs
cd ./jni

rm -f ./Application.mk
ln -s ./Application.mk.gcc ./Application.mk
rm -f ./Android.mk
ln -s ./Android.mk.opencl ./Android.mk

cd ./ImageMagick-7.0.5-2/MagickCore
rm -f magick-baseconfig.h
ln -s magick-baseconfig.h.opencl magick-baseconfig.h
cd ../..

$ANDROID_SDK_PATH/ndk-bundle/ndk-build -j 4

cd ..
mv libs libs.gcc.opencl
ln -s libs.gcc.opencl libs
cd ./jni
