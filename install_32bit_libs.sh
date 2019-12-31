#!/bin/bash

install_these_libs=(
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
unixODBC-libs*i686
unixODBC*i686
ncurses*i686
ncurses-libs*i686
libzmq3*i686
libXext*i686
alsalib*i686
libXtst*i686
libXft*i686
libxml2*i686
libedit*i686
libX11*i686
libXi*i686
)

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

yum install ${install_these_libs[@]}
#yum install ${install_32_libs[@]}
