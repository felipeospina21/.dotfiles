#!/bin/bash

if [ "$1" = "Linux" ]; then
	curl https://mise.jdx.dev/install.sh | sh
elif [ "$1" = "Darwin" ]; then
	brew install mise
fi
