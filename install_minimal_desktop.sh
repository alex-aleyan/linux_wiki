#!/bin/bash

yum_centos_repo='yum -y --disablerepo="*" --enablerepo="*centos_7*"'

# Determine if we running centos6 or centos7
centos_version="$( lsb_release -r | sed -n -e 's/^Release:\s//p' \
                                  | awk -v RS=[0-9]+ '{print RT+0;exit}'  )"

if [[ -z $centos_version ]]; then echo "ERROR: Install lsb_release!"; exit -1; fi

if [[ $centos_version -eq 7 ]]; then
echo "Ver: $centos_version"
install_these_libs=(
gnome-classic-session
gnome-terminal
nautilus-open-terminal
control-center
liberation-mono-fonts
)
fi

yum_centos_repo groupinstall "X Window System"
if [ $? -ne 0 ]; then exit -1; fi
yum_centos_repo groupinstall "fonts"
if [ $? -ne 0 ]; then exit -1; fi

yum_centos_repo install ${install_these_libs[@]}
if [ $? -ne 0 ]; then exit -1; fi

ln -fs /lib/systemd/system/graphical.target /etc/systemd/system/default.target
if [ $? -ne 0 ]; then exit -1; fi
