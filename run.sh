#/bin/bash

export ANDROID_NDK=~/SoftWareInstall/android-ndk-r26b

cmake -DCMAKE_TOOLCHAIN_FILE=$ANDROID_NDK/build/cmake/android.toolchain.cmake \
        -DANDROID_ABI="arm64-v8a" \
        -DANDROID_NDK=$ANDROID_NDK \
        -DANDROID_PLATFORM=android-24 \
        -DHWCPIPE_BUILD_EXAMPLES=ON \
        -B build .

cd build
adb shell rm -rf /data/local/tmp/api-example
make
cd ..
adb push build/examples/api-example /data/local/tmp
adb shell /data/local/tmp/api-example
rm -rf build
