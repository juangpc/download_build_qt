#!/bin/bash


CURRENT_DIR=`pwd`
SCRIPT_NAME=$(basename "$0")
SCRIPT_PATH="$(
    cd "$(dirname "$0")" >/dev/null 2>&1
    pwd -P
)"
BASE_PATH=${SCRIPT_PATH}/../..

# create a new directory ./qt5 if it doesn't exist already.
QT5DIR=qt5
if [[ -d QT5DIR ]]; then
echo "  "
read -p "Directory $QT5DIR already exists. Do you want to delete it?   " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]; then
    # do dangerous stuff
    rm -fr qt5
else 
    DOWNLOAD=NO
fi 
fi

git clone ${q} -b $QTVER https://code.qt.io/qt/qt5.git



