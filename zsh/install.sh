#!/bin/bash

if [ "$1" = "Linux" ]; then
	sudo apt install zsh -y
	chsh -s "$(which zsh)"
fi

ln -s "$HOME/.dotfiles/zsh/.zprofile" "$HOME/.zprofile"

exec zsh
