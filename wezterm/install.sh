#!/bin/bash

if [ "$1" = "Linux" ]; then
	curl -LO https://github.com/wez/wezterm/releases/download/20230712-072601-f4abf8fd/WezTerm-20230712-072601-f4abf8fd-Ubuntu20.04.AppImage
	chmod +x WezTerm-20230712-072601-f4abf8fd-Ubuntu20.04.AppImage
	mv ./WezTerm-20230712-072601-f4abf8fd-Ubuntu20.04.AppImage ~/.local/bin/wezterm

elif [ "$1" = "Darwin" ]; then
	brew install --cask wezterm
fi
