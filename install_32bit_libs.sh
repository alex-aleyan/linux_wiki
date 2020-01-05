#!/bin/bash

#lsb_release -r | sed -n -e 's/^Release:\s//p'


# Determine if we running centos6 or centos7
centos_version="$( lsb_release -r | sed -n -e 's/^Release:\s//p' \
                                  | awk -v RS=[0-9]+ '{print RT+0;exit}'  )"

if [[ $centos_version -eq 6 ]]; then
    echo "Ver: $centos_version"
    libs_32bit=(
        libc.i686
        glibc.i686
        libXext.i686
        libX11.i686
        libXau.i686
        libXdmcp.i686
        freetype.i686
        fontconfig.i686
        libpng.i686 
        libSM.i686
        expat.i686
        libXft.i686
        ncurses-libs.i686
        libstdc++*
        libstdc++*686
    )

elif [[ $centos_version -eq 7 ]]; then
    echo "Ver: $centos_version"
    
    libs_32bit=(
        unixODBC-libs*i686
        unixODBC*i686
        ncurses*i686
        ncurses-libs*i686
        libzmq3*i686
        libXext*i686
        alsa-lib*i686
        libXtst*i686
        libXft*i686
        libxml2*i686
        libedit*i686
        libX11*i686
        libXi*i686
    )

fi

echo "${libs_32bit[@]}"

exit



install_32_libs=(
glibc:i386
libXext.i386
libX11.i386
libXau.i386
libXdmcp.i386
freetype.i386
fontconfig.i386
libpng.i386 
libSM.i386
expat.i386
libXft.i386
ncurses-libs.i386
)

yum install ${libs_32bit[@]}
