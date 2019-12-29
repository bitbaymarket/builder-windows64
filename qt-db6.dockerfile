FROM bitbayofficial/builder-windows64:mxe-db6
MAINTAINER yshurik <yshurik@gmail.com>

RUN make MXE_PLUGIN_DIRS="$MXE_PLUGIN_DIRS" MXE_TARGETS="x86_64-w64-mingw32.static.posix" qtbase
RUN make MXE_PLUGIN_DIRS="$MXE_PLUGIN_DIRS" MXE_TARGETS="x86_64-w64-mingw32.static.posix" qttools

ENV PATH "/mxe/usr/bin:/mxe/usr/x86_64-w64-mingw32.static.posix/qt5:/mxe/usr/x86_64-w64-mingw32.static.posix/qt5/bin:/go/bin:/usr/local/go/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

RUN ls -l /mxe/usr/bin/
ENV PKG_CONFIG "/mxe/usr/bin/x86_64-w64-mingw32.static.posix-pkg-config"

ENV mxedir "/mxe/"
RUN qmake -v

RUN make MXE_PLUGIN_DIRS="$MXE_PLUGIN_DIRS" MXE_TARGETS="x86_64-w64-mingw32.static.posix" libqrencode

WORKDIR /mnt

