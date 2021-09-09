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
if [[ -d $QT5DIR ]]; then
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




apt-get install build-essential libgl1-mesa-dev libxkbcommon-x11-0 libpulse-dev libxcb-util1 libxcb-glx0 libxcb-icccm4 libxcb-image0 libxcb-keysyms1 libxcb-randr0 libxcb-render-util0 libxcb-render0 libxcb-shape0 libxcb-shm0 libxcb-sync1 libxcb-xfixes0 libxcb-xinerama0 libxcb1 -y
git clone -b 5.15.2 https://code.qt.io/qt/qt5.git
cd qt5; ./init-repository -f --module-subset=qtbase,qtcharts,qtsvg ; cd ..
qt5/configure -opensource -confirm-license -platform linux-g++ -feature-thread -nomake examples -no-dbus -no-ssl -prefix ../build/


