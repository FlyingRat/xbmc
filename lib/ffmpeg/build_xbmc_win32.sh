#!/bin/bash -x


if [ "$1" == "clean" ]
then
  if [ -d .libs ]
  then
    rm -r .libs
  fi
  mingw32-make distclean
fi

MAKEFLAGS=-j3

if [ ! -d .libs ]; then
  mkdir .libs
fi

# add --enable-debug (remove --disable-debug ofc) to get ffmpeg log messages in xbmc.log
# the resulting debug dll's are twice to fourth time the size of the release binaries

OPTIONS="
--enable-shared \
--enable-memalign-hack \
--enable-gpl \
--enable-w32threads \
--enable-postproc \
--enable-zlib \
--disable-static \
--disable-altivec \
--disable-muxers \
--disable-encoders \
--disable-debug \
--disable-ffplay \
--disable-ffserver \
--disable-ffmpeg \
--disable-ffprobe \
--disable-devices \
--disable-crystalhd \
--enable-muxer=spdif \
--enable-muxer=adts \
--enable-encoder=ac3 \
--enable-encoder=aac \
--enable-runtime-cpudetect \
--enable-avfilter \
--enable-dxva2 \
--cpu=i686 \
--enable-libopus \
--enable-libspeex \
--disable-doc"

# ./configure --extra-cflags="-fno-common -Iinclude-xbmc-win32/dxva2 -DNDEBUG" --extra-ldflags="-L/xbmc/system/players/dvdplayer" ${OPTIONS} &&
 
# mingw32-make $MAKEFLAGS &&
cp lib*/*.dll .libs/ &&
cp .libs/avcodec.dll /xbmc/system/players/dvdplayer/ &&
cp .libs/avformat.dll /xbmc/system/players/dvdplayer/ &&
cp .libs/avutil.dll /xbmc/system/players/dvdplayer/ &&
cp .libs/avfilter.dll /xbmc/system/players/dvdplayer/ &&
cp .libs/postproc.dll /xbmc/system/players/dvdplayer/ &&
cp .libs/swresample.dll /xbmc/system/players/dvdplayer/ &&
cp .libs/swscale.dll /xbmc/system/players/dvdplayer/
