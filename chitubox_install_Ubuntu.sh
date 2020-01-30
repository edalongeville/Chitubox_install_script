#!/bin/bash
# This script installs Chitubox on Ubuntu 18.04

FILE="CHITUBOX_V1.6.3.tar.gz"
ICON="chitubox.png"
DESKFILE="chitubox.desktop"
INSTALL_DIR="/usr/bin"
ICONS_DIR="/usr/share/icons/hicolor"
DESKFILES_DIR="/usr/share/applications"

# Ensure chitubox archive is here
if test -f "$FILE"; then
	echo "Chitubox archive found"
else
	echo "Please download chitubox from their website and place the archive in the same folder as this script"
	echo "https://www.chitubox.com"
	exit 1
fi

# Ensure icon is here
if ! test -f "$ICON"; then
	echo "Icon not found! $ICON should be in the same folder as this script"
	exit 1
fi

# Extract Chitubox to install dir
sudo mkdir $INSTALL_DIR/chitubox
sudo tar -xvf $FILE -C $INSTALL_DIR/chitubox --strip-components 1

# Deploy icons
## 32x32
sudo convert -resize 32x32 $ICON $ICONS_DIR/32x32/apps/$ICON
## 48x48
sudo convert -resize 48x48 $ICON $ICONS_DIR/48x48/apps/$ICON
## 64x64
sudo convert -resize 64x64 $ICON $ICONS_DIR/64x64/apps/$ICON
## 128x128
sudo cp $ICON $ICONS_DIR/128x128/apps/$ICON

# Deploy desktop file (Gnome menu entry)
sudo cp $DESKFILE $DESKFILES_DIR/$DESKFILE

# Create file association
echo "model/x.stl-binary=chitubox.desktop" | sudo tee -a /usr/share/applications/defaults.list > /dev/null
