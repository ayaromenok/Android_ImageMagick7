# list of supported architectures 
# https://developer.android.com/ndk/guides/application_mk.html
#APP_ABI := all 
APP_ABI := armeabi-v7a
APP_PLATFORM := android-19
NDK_TOOLCHAIN_VERSION := 4.9

# list of build-in STL's supported by NDK. 
# switch to clang STL in case of using this compiler
# https://developer.android.com/ndk/guides/cpp-support.html#runtimes
APP_STL := stlport_static

APP_CFLAGS += \
    -DMAGICKCORE_HDRI_ENABLE=0 \
    -DMAGICKCORE_QUANTUM_DEPTH=8

APP_CPPFLAGS += \
    -DMAGICKCORE_HDRI_ENABLE=0 \
    -DMAGICKCORE_QUANTUM_DEPTH=8
