#!/bin/bash

if [ $# > 1 ];
then
	if [ $1 == "--no-mach-o" ];
	then
		echo "building without machopatchfinder, kernelpatchfinder"
		mv ./makefiles/include-no-mach-o.make ./include/Makefile.am
		mv ./makefiles/liboffsetfinder64-no-mach-o.make ./liboffsetfinder64/Makefile.am
	else 
		mv ./makefiles/include.make ./include/Makefile.am
		mv ./makefiles/liboffsetfinder64.make ./liboffsetfinder64/Makefile.am
	fi
fi

aclocal -I m4
autoconf
autoheader
automake --add-missing
autoreconf -i
./configure "$@"
