#/bin/sh
rm -f ./Application.mk
ln -s ./Application.mk.gcc ./Application.mk
rm -f ./Android.mk
ln -s ./Android.mk.opencl ./Android.mk
$ANDROID_SDK_PATH/ndk-bundle/ndk-build V=1
