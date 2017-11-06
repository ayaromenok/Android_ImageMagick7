#/bin/sh
rm -f ./Application.mk
ln -s ./Application.mk.gcc ./Application.mk
rm -s ./Android.mk
ln -s ./Android.mk.openmp ./Android.mk
$ANDROID_SDK_PATH/ndk-bundle/ndk-build -j 4
