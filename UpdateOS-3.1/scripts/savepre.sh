#!/bin/sh

USER_DIR=${USER_DIR:="/usbdrive"}
# PATCH_DIR=${PATCH_DIR:="/usbdrive/Patches"}
# FW_DIR=${FW_DIR:="/root"}
# SCRIPTS_DIR=$FW_DIR/scripts

# don't clear aux screen.  it is cleared and set with OG version 

oscsend localhost 4001 /oled/aux/line/1 s "Saveing Preset..."
oscsend localhost 4001 /oled/aux/line/2 s "$1"
oscsend localhost 4001 /oled/aux/line/3 s "Sates: "
oscsend localhost 4001 /oled/aux/line/4 s ""
oscsend localhost 4001 /oled/aux/line/5 s ""

# set to aux screen, signals screen update
oscsend localhost 4001 /oled/setscreen i 1

oscsend localhost 4000 /save s "$USER_DIR/Scenes/z1-$1/state.txt"
cp -r "$USER_DIR/Patches/$1" "$DRIVE/Scenes/z1-$1"
