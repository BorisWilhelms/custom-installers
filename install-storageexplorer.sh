#!/bin/bash
if [ $(id -u) -ne 0 ]; then
    echo "Must be run as root."
    exit
fi

URL=$(curl -s https://api.github.com/repos/microsoft/AzureStorageExplorer/releases/latest | grep -o "http.*tar.gz")
TARGET=/usr/share/storageexplorer

mkdir -p $TARGET
curl -Ls $URL | tar xvz -C $TARGET

cat > /usr/share/applications/storageexplorer.desktop <<EOF
#!/usr/bin/env xdg-open
[Desktop Entry]
Version=1.0
Terminal=false
Type=Application
Name=Azure Storage Explorer
Exec=$TARGET/StorageExplorer --no-sandbox
Icon=$TARGET/resources/app/out/app/icon.png
EOF

