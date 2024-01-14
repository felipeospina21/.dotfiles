#!/bin/bash
SCRIPT=$(realpath "$0")
SCRIPTPATH=$(dirname "$SCRIPT")

if [ "$1" = "Linux" ]; then
	sudo apt install zsh -y
	chsh -s "$(which zsh)"
fi

ln -s "$SCRIPTPATH/.zshrc" "$HOME/.zshrc"
exec zsh
