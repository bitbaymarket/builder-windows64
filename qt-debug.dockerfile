FROM bitbayofficial/builder-windows32:mxe
MAINTAINER yshurik <yshurik@gmail.com>

RUN sed -i 's/-release/-debug-and-release/m' /mxe/src/qtbase.mk

RUN make MXE_PLUGIN_DIRS="$MXE_PLUGIN_DIRS" MXE_TARGETS="i686-w64-mingw32.static" qtbase
RUN make MXE_PLUGIN_DIRS="$MXE_PLUGIN_DIRS" MXE_TARGETS="i686-w64-mingw32.static" qttools

ENV PATH "/mxe/usr/bin:/mxe/usr/i686-w64-mingw32.static/qt5:/mxe/usr/i686-w64-mingw32.static/qt5/bin:/go/bin:/usr/local/go/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

RUN ls -l /mxe/usr/bin/
ENV PKG_CONFIG "/mxe/usr/bin/i686-w64-mingw32.static-pkg-config"

ENV mxedir "/mxe/"
RUN qmake -v

RUN make MXE_PLUGIN_DIRS="$MXE_PLUGIN_DIRS" MXE_TARGETS="i686-w64-mingw32.static" libqrencode

WORKDIR /mnt
