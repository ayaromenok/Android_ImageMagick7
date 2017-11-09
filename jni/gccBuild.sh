#/bin/sh
cd  ..
rm -f -r obj
rm -f -r libs.gcc
rm -f -r libs
cd ./jni

rm -f ./Application.mk
ln -s ./Application.mk.gcc ./Application.mk
rm -f ./Android.mk
ln -s ./Android.mk.openmp ./Android.mk

cd ./ImageMagick/MagickCore
rm -f magick-baseconfig.h
ln -s magick-baseconfig.h.openmp magick-baseconfig.h
cd ../..

$ANDROID_SDK_PATH/ndk-bundle/ndk-build

cd ..
mv libs libs.gcc
ln -s libs.gcc libs
cd ./jni
