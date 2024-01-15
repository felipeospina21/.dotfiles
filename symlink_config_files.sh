#!/bin/bash
#
OS=$(uname)

if [ ! "$(command -v stow)" ]; then
	#install stow
	[ "$OS" = "Linux" ] && sudo apt install stow -y
	[ "$OS" = "Darwin" ] && brew install stow
else
	for package in "$@"; do
		link_path="$HOME/.config/$package/"
		stow -t "$link_path" "$package"
		echo "$package linked in $link_path"
		#ignore or manage different with zsh and starship (should be linked to $HOME)
	done

fi
