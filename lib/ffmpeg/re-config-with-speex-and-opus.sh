bash $1 ./configure \
--extra-cflags='-g -O -std=gnu99 -no_compact_linkedit -no-cpp-precomp -arch i386 -D_DEBUG -Wall  -w -D_DARWIN_C_SOURCE \
-L/usr/local/lib -Dattribute_deprecated= -Wl,-no_pie' \
--disable-doc \
--target-os=darwin \
--arch=x86_32 \
--enable-gpl \
--enable-postproc \
--enable-static \
--enable-pthreads \
--enable-protocol=http \
--enable-runtime-cpudetect \
--enable-muxer=spdif \
--enable-muxer=adts \
--enable-encoder=ac3 \
--enable-encoder=aac \
--enable-libopus \
--enable-libspeex \
--enable-version3 \
--enable-nonfree \
--enable-postproc  \
--enable-swscale \
--enable-avfilter \
--enable-libvorbis \
--cc="clang -m32"

# --cc="clang -m32"
# --cc=clang
# --cc="clang"
# --as=/Applications/Xcode.app/Contents/Developer/usr/bin/as
# --disable-ffplay \
# --disable-ffmpeg \
# --disable-ffprobe \
# --disable-ffserver \
# --disable-libvorbis \
# --disable-muxers \
# --disable-encoders \
# --disable-devices \
#--disable-vda \
#--disable-crystalhd \
#--disable-decoder=mpeg_xvmc \
#--disable-amd3dnow \
#--enable-muxer=spdif \
#--enable-muxer=adts \
#--enable-encoder=ac3 \
#--enable-encoder=aac \
# --enable-libmp3lame \
# --enable-libtheora \
# --enable-libfaac \
# --enable-libxvid \
# --enable-libx264 \
# ./configure --cc=clang --enable-nonfree --enable-gpl --enable-version3  --enable-postproc --enable-swscale --enable-avfilter --enable-libmp3lame  --enable-libvorbis --enable-libtheora --enable-libfaac --enable-libxvid  --enable-libx264 --enable-libvpx --enable-libvo-amrwbenc  --enable-shared --enable-pthreads --disable-indevs --disable-doc  --arch=x86_64

