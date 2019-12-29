FROM golang:latest 
MAINTAINER yshurik <yshurik@gmail.com>

RUN apt update
RUN apt-get -y install \
    autoconf \
    automake \
    autopoint \
    bash \
    bison \
    bzip2 \
    flex \
    g++ \
    g++-multilib \
    gettext \
    git \
    gperf \
    intltool \
    libc6-dev-i386 \
    libgdk-pixbuf2.0-dev \
    libltdl-dev \
    libssl-dev \
    libtool-bin \
    libxml-parser-perl \
    make \
    openssl \
    p7zip-full \
    patch \
    perl \
    pkg-config \
    python \
    ruby \
    scons \
    sed \
    unzip \
    wget \
    xz-utils
WORKDIR /
RUN echo mark5
RUN git clone https://github.com/yshurik/mxe.git
WORKDIR /mxe
RUN sed -i 's/DEFAULT_MAX_JOBS   := 6/DEFAULT_MAX_JOBS   := 32/' /mxe/Makefile
RUN git checkout base0

ENV MXE_TARGETS "x86_64-w64-mingw32.static.posix"
ENV MXE_PLUGIN_DIRS plugins/gcc7

RUN make download-gcc
RUN make MXE_PLUGIN_DIRS="$MXE_PLUGIN_DIRS" MXE_TARGETS="x86_64-w64-mingw32.static.posix" cc
RUN make MXE_TARGETS="$MXE_TARGETS" boost
RUN make MXE_TARGETS="$MXE_TARGETS" cmake
RUN make MXE_TARGETS="$MXE_TARGETS" freetype
RUN make MXE_TARGETS="$MXE_TARGETS" fontconfig
RUN make MXE_TARGETS="$MXE_TARGETS" sqlite
RUN make MXE_TARGETS="$MXE_TARGETS" jpeg pcre2
RUN make MXE_TARGETS="$MXE_TARGETS" miniupnpc
RUN make MXE_TARGETS="$MXE_TARGETS" db
ADD openssl.mk /mxe/src/
RUN make MXE_TARGETS="$MXE_TARGETS" openssl
RUN make MXE_TARGETS="$MXE_TARGETS" freetds
ADD postgresql.mk /mxe/src
RUN make MXE_TARGETS="$MXE_TARGETS" postgresql
RUN make MXE_TARGETS="$MXE_TARGETS" libmysqlclient
RUN ls /mxe/usr/bin
COPY cpp_int.hpp /mxe/usr/x86_64-w64-mingw32.static.posix/include/boost/multiprecision/cpp_int.hpp

