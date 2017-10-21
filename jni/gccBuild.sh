#/bin/sh
rm -f ./Application.mk
ln -s ./Application.mk.gcc ./Application.mk
$ANDROID_SDK_PATH/ndk-bundle/ndk-build -j 4
