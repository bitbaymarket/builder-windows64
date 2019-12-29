#!/bin/sh
docker build . -f mxe-db6.dockerfile -t bitbayofficial/builder-windows64:mxe-db6
docker build . -f qt-db6.dockerfile -t bitbayofficial/builder-windows64:qt-db6
docker tag bitbayofficial/builder-windows64:qt-db6 bitbayofficial/builder-windows64:latest-db6

