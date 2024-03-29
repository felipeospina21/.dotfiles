#!/bin/bash

if [ "$1" = "Linux" ]; then
	curl -LO https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep_13.0.0_amd64.deb
	sudo dpkg -i ripgrep_13.0.0_amd64.deb
elif [ "$1" = "Darwin" ]; then
	brew install ripgrep
fi
