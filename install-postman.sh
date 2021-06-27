#!/bin/sh
if [ $(id -u) -ne 0 ]; then
    echo "Must be run as root."
    exit
fi

URL=https://dl.pstmn.io/download/latest/linux64
TARGET=/usr/share

curl -s $URL | tar xvz -C $TARGET
cat > $TARGET/applications/postman.desktop <<EOF
#!/usr/bin/env xdg-open
[Desktop Entry]
Version=1.0
Terminal=false
Type=Application
Name=Postman
Exec=$TARGET/Postman/Postman
Icon=$TARGET/Postman/app/resources/app/assets/icon.png
EOF