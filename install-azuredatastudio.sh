#!/bin/bash
if [ $(id -u) -ne 0 ]; then
    echo "Must be run as root."
    exit
fi

REGEX="\[linux-deb\]: ([a-z0-9:?=\.\/]*)\\\r"
CONTENT=$(curl -s https://api.github.com/repos/microsoft/azuredatastudio/releases/latest)

if [[ $CONTENT =~ $REGEX ]]; then
    echo "Downloading deb file..."
    curl -sL "${BASH_REMATCH[1]}" -o /var/tmp/azuredatastudio.deb
    dpkg -i /var/tmp/azuredatastudio.deb
else
    echo "Could not get download url..."
fi
