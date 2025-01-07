#!/bin/sh
docker build . -f mxe.dockerfile -t ghcr.io/bitbaymarket/builder-windows64:mxe
docker build . -f qt.dockerfile -t ghcr.io/bitbaymarket/builder-windows64:qt
#docker build . -f qt-debug.dockerfile -t bitbayofficial/builder-windows32:qt-debug
#docker tag bitbayofficial/builder-windows64:qt bitbayofficial/builder-windows64:latest

