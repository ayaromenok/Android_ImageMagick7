#/bin/sh
cd  ..
rm -f -r obj
rm -f -r lib.gcc
rm -f -r lib
cd ./jni

rm -f ./Application.mk
ln -s ./Application.mk.gcc ./Application.mk
rm -f ./Android.mk
ln -s ./Android.mk.openmp ./Android.mk

cd ./ImageMagick/MagickCore
rm -f magick-baseconfig.h
ln -s magick-baseconfig.h.openmp magick-baseconfig.h
cd ../..

$ANDROID_SDK_PATH/ndk-bundle/ndk-build -j 4

cd ..
mv lib lib.gcc
ln -s lib.gcc lib
cd ./jni
