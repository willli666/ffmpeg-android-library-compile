#!/bin/bash

. abi_settings.sh $1 $2 $3

pushd ffmpeg

case $1 in
  armeabi-v7a | armeabi-v7a-neon)
    CPU='cortex-a8'
  ;;
  x86)
    CPU='i686'
  ;;
esac

make clean

./configure \
--target-os="$TARGET_OS" \
--cross-prefix="$CROSS_PREFIX" \
--arch="$NDK_ABI" \
--cpu="$CPU" \
--enable-runtime-cpudetect \
--sysroot="$NDK_SYSROOT" \
--enable-pic \
--enable-libx264 \
--enable-libfdk-aac \
--enable-pthreads \
--enable-version3 \
--enable-hardcoded-tables \
--enable-nonfree \
--enable-gpl \
--disable-encoders \
--enable-encoder=libx264 \
--enable-encoder=libx264rgb \
--enable-encoder=png \
--enable-encoder=bmp \
--enable-encoder=aac \
--disable-decoders \
--enable-decoder=h264 \
--enable-decoder=bmp \
--enable-decoder=png \
--enable-decoder=aac \
--disable-filters \
--enable-filter=scale \
--enable-filter=crop \
--enable-filter=amerge \
--enable-filter=pan \
--enable-filter=aresample \
--enable-filter=fps \
--disable-muxers \
--enable-muxer=image2 \
--enable-muxer=mov \
--enable-muxer=h264 \
--enable-muxer=mp4 \
--enable-muxer=h264 \
--disable-demuxers \
--enable-demuxer=image2 \
--enable-demuxer=mov \
--enable-demuxer=h264 \
--enable-demuxer=aac \
--disable-parsers \
--enable-parser=png \
--enable-parser=bmp \
--enable-parser=h264 \
--enable-parser=aac \
--disable-debug \
--disable-network \
--disable-ffplay \
--disable-ffprobe \
--disable-doc \
--disable-ffserver \
--disable-avdevice \
--disable-shared \
--enable-static \
--pkg-config="${2}/ffmpeg-pkg-config" \
--prefix="${2}/build/${1}" \
--extra-cflags="-I${TOOLCHAIN_PREFIX}/include $CFLAGS" \
--extra-ldflags="-L${TOOLCHAIN_PREFIX}/lib $LDFLAGS" \
--extra-libs="-lpng -lm" \
--extra-cxxflags="$CXX_FLAGS" || exit 1

make -j${NUMBER_OF_CORES} && make install || exit 1

popd
