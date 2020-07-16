#!/bin/bash

if [ $# > 1 && $1 == "--no-mach-o"];
then
	echo "building without machopatchfinder, kernelpatchfinder"
	cp ./makefiles/include-no-mach-o.make ./include/Makefile.am
	cp ./makefiles/liboffsetfinder64-no-mach-o.make ./liboffsetfinder64/Makefile.am
else 
	cp ./makefiles/include.make ./include/Makefile.am
	cp ./makefiles/liboffsetfinder64.make ./liboffsetfinder64/Makefile.am
fi

aclocal -I m4
autoconf
autoheader
automake --add-missing
autoreconf -i
if [ $# > 1 && $1 == "--no-mach-o"];
then
	./configure "$0"
else
	./configure
fi
