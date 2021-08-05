#!/bin/bash
# This script uninstalls Chitubox

ICON="chitubox.png"
DESKFILE="chitubox.desktop"
INSTALL_DIR="/usr/bin"
ICONS_DIR="/usr/share/icons/hicolor"
DESKFILES_DIR="/usr/share/applications"


# Delete install dir
sudo rm -rf $INSTALL_DIR/chitubox

# Delete icons
## 32x32
sudo rm $ICONS_DIR/32x32/apps/$ICON
## 48x48
sudo rm $ICONS_DIR/48x48/apps/$ICON
## 64x64
sudo rm $ICONS_DIR/64x64/apps/$ICON
## 128x128
sudo rm $ICONS_DIR/128x128/apps/$ICON

# Deploy desktop file (Gnome menu entry)
sudo rm $DESKFILES_DIR/$DESKFILE
