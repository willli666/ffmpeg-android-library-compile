#!/bin/bash

. abi_settings.sh $1 $2 $3

pushd fdk-aac

make clean

case $1 in
  armeabi-v7a | armeabi-v7a-neon)
    HOST=arm-linux
  ;;
  x86)
    HOST=i686-linux
  ;;
esac

echo $CFLAGS

./configure \
  --with-sysroot="$NDK_SYSROOT" \
  --host="$HOST" \
  --with-pic \
  --enable-static \
  --disable-shared \
  --prefix="${TOOLCHAIN_PREFIX}" \
  --disable-cli || exit 1


make -j${NUMBER_OF_CORES} install || exit 1

popd
