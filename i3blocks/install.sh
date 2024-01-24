#!/bin/bash

if [ "$1" = "Linux" ]; then
	git clone https://github.com/vivien/i3blocks
	cd i3blocks || exit 1
	./autogen.sh
	./configure
	make
	make install
else
	echo "i3 only supported by linux"
fi
