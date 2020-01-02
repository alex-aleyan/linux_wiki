#!/bin/bash

install_these_libs=(
gnome-classic-session
gnome-terminal
nautilus-open-terminal
control-center
liberation-mono-fonts
)

yum groupinstall "X Window System" "fonts"
if [ $? -ne 0 ]; then exit -1; fi

yum install ${install_these_libs[@]}
if [ $? -ne 0 ]; then exit -1; fi

ln -fs /lib/systemd/system/graphical.target /etc/systemd/system/default.target
if [ $? -ne 0 ]; then exit -1; fi
