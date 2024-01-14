#!/bin/bash

if [ "$1" = "Linux" ]; then
	bash <(curl https://raw.githubusercontent.com/atuinsh/atuin/main/install.sh)
elif [ "$1" = "Darwin" ]; then
	brew install atuin
fi
