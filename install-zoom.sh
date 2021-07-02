#!/bin/bash
if [ $(id -u) -ne 0 ]; then
    echo "Must be run as root."
    exit
fi

URL=https://zoom.us/client/latest/zoom_amd64.deb
TARGET=/var/tmp/zoom.deb
echo "Downloading deb file..."
curl -sL $URL -o $TARGET
dpkg -i $TARGET
rm -f $TARGET
