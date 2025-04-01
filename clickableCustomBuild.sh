#!/bin/bash

# script is run by clickable (custom build template)
# $1: build folder

# build folder
clickBuildFolder=$1

# build folder not provided
if [[ -z "$clickBuildFolder" ]]
  then
  echo "clickBuildFolder (\$1) was not provided"
  exit 1
fi

# make sure we are in an armhf environment

# determine qmake (e.g. cross compiler or direct)
if [[ -n $(which qt5-qmake-arm-linux-gnueabihf) ]]
  then
  QMAKE=qt5-qmake-arm-linux-gnueabihf
  else
  QMAKE=qmake
fi

$QMAKE . CONFIG+=ubuntu clickBuildFolder=$clickBuildFolder

make -j install
