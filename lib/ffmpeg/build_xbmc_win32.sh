#!/bin/bash

MAKEFLAGS=""

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
--disable-doc"

#
# Flag when ffmpeg is configured 
#

WIN32CONF=.win32configured
DLLPATHS_INCLUDE=/xbmc/xbmc/DllPaths_win32_ffmpeg.h


#
# Set parallel build mode
#

if [ $NUMBER_OF_PROCESSORS > 1 ]
then
  MAKEFLAGS=-j$NUMBER_OF_PROCESSORS
fi


#
# Clean object files and libraries
#

if [ "$1" == "clean" ]
then
  make distclean
  rm -f $WIN32CONF $DLLPATHS_INCLUDE
fi


#
# Only run configure when neccesary and break if configure fails.
#

if [ ! -f $WIN32CONF ]; then

  echo "$0: Running ffmpeg configure..."

  if ./configure --extra-cflags="-fno-common -Iinclude-xbmc-win32/dxva2 -DNDEBUG" \
				--extra-ldflags="-L/xbmc/system/players/dvdplayer" ${OPTIONS}; then
	touch $WIN32CONF
  else
	echo "$0: configure failed."
	exit 1
  fi
fi


#
# @FFMPEG113 - version agnostic build, copy and generate DLL-paths include file.
# 

# enable break on error:
set -e

make $MAKEFLAGS 

DLL_PATH_LIBAVCODEC=$(set -- libavcodec/avcodec-[0-9]*.dll; echo $1)
DLL_PATH_LIBAVFORMAT=$(set -- libavformat/avformat-[0-9]*.dll; echo $1)
DLL_PATH_LIBAVUTIL=$(set -- libavutil/avutil-[0-9]*.dll; echo $1)
DLL_PATH_LIBAVFILTER=$(set -- libavfilter/avfilter-[0-9]*.dll; echo $1)
DLL_PATH_LIBPOSTPROC=$(set -- libpostproc/postproc-[0-9]*.dll; echo $1)
DLL_PATH_LIBSWSCALE=$(set -- libswscale/swscale-[0-9]*.dll; echo $1)
DLL_PATH_LIBSWRESAMPLE=$(set -- libswresample/swresample-[0-9]*.dll; echo $1)

#
# @FFMPEG113 - Generate dll path defintion file $DLLPATHS_INCLUDE
#

for DLL in	DLL_PATH_LIBAVCODEC DLL_PATH_LIBAVFORMAT DLL_PATH_LIBAVUTIL \
		DLL_PATH_LIBAVFILTER DLL_PATH_LIBPOSTPROC DLL_PATH_LIBSWSCALE \
		DLL_PATH_LIBSWRESAMPLE
do
	echo "#define $DLL		\"special://xbmcbin/system/players/dvdplayer/$(basename ${!DLL})\""
done > $DLLPATHS_INCLUDE

#
# @FFMPEG113 - Copy dll's to system player folder
#

cp $DLL_PATH_LIBAVCODEC		/xbmc/system/players/dvdplayer/
cp $DLL_PATH_LIBAVFORMAT	/xbmc/system/players/dvdplayer/
cp $DLL_PATH_LIBAVUTIL		/xbmc/system/players/dvdplayer/ 
cp $DLL_PATH_LIBAVFILTER	/xbmc/system/players/dvdplayer/ 
cp $DLL_PATH_LIBPOSTPROC	/xbmc/system/players/dvdplayer/ 
cp $DLL_PATH_LIBSWSCALE		/xbmc/system/players/dvdplayer/ 
cp $DLL_PATH_LIBSWRESAMPLE	/xbmc/system/players/dvdplayer/ 
