FROM ghcr.io/bitbaymarket/builder-windows64:mxe

RUN make MXE_PLUGIN_DIRS="$MXE_PLUGIN_DIRS" MXE_TARGETS="x86_64-w64-mingw32.static" qtbase
RUN make MXE_PLUGIN_DIRS="$MXE_PLUGIN_DIRS" MXE_TARGETS="x86_64-w64-mingw32.static" qttools

ENV PATH="/mxe/usr/bin:/mxe/usr/x86_64-w64-mingw32.static/qt5:/mxe/usr/x86_64-w64-mingw32.static/qt5/bin:/go/bin:/usr/local/go/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

RUN ls -l /mxe/usr/bin/
ENV PKG_CONFIG="/mxe/usr/bin/x86_64-w64-mingw32.static-pkg-config"

ENV mxedir="/mxe/"
RUN qmake -v

RUN make MXE_PLUGIN_DIRS="$MXE_PLUGIN_DIRS" MXE_TARGETS="x86_64-w64-mingw32.static" libqrencode
RUN make MXE_PLUGIN_DIRS="$MXE_PLUGIN_DIRS" MXE_TARGETS="x86_64-w64-mingw32.static" curl

WORKDIR /mnt

