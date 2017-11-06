#/bin/sh
cd  ..
rm -f -r obj
rm -f -r libs.clang
rm -f -r libs
cd ./jni

rm -f ./Application.mk
ln -s ./Application.mk.clang ./Application.mk
rm -f ./Android.mk
ln -s ./Android.mk.openmp ./Android.mk

cd ./ImageMagick-7.0.5-2/MagickCore
rm -f magick-baseconfig.h
ln -s magick-baseconfig.h.openmp magick-baseconfig.h
cd ../..

$ANDROID_SDK_PATH/ndk-bundle/ndk-build -j 4

cd ..
mv libs libs.clang
ln -s libs.clang libs
cd ./jni
