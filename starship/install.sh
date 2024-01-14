#!/bin/bash

if [ "$1" = "Linux" ]; then
	curl -sS https://starship.rs/install.sh | sh
elif [ "$1" = "Darwin" ]; then
	brew install starship
fi
