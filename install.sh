#!/bin/bash

OS=$(uname)
SCRIPT=$(realpath "$0")
SCRIPT_PATH=$(dirname "$SCRIPT")
XDG_CONFIG_HOME="$HOME/.config"

GENERAL_PACKAGES=(stow bat exa fd fzf tree-sitter gum nvim)
LINUX_PACKAGES=(xclip jq brightnessctl pulseaudio-module-bluetooth pulseaudio-equalizer pulseaudio-module-jack alsa-utils playerctl autoreconf)

# install brew
if [ "$OS" = "Linux" ]; then
	test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
	test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
	test -r ~/.bash_profile && echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >>~/.bash_profile
	echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >>~/.profile
elif [ "$OS" = "Darwin" ]; then
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# install basic packages
if [ "$OS" = "Linux" ]; then
	LINUX_PACKAGES+=("${GENERAL_PACKAGES[@]}")
	brew install --formula "${LINUX_PACKAGES[@]}"

	ln -s "$HOME/.xprofile" "$HOME/.dotfiles/.xprofile"
	ln -s "$HOME/.Xresources" "$HOME/.dotfiles/.Xresources"

elif [ "$OS" = "Darwin" ]; then
	brew install --formula "${GENERAL_PACKAGES[@]}"

else
	echo "No script for selected OS"
	exit 1
fi

# create .local & .config folders
[ ! -d ~/.local ] && mkdir ~/.local && mkdir ~./local/bin
[ ! -d ~/.config ] && mkdir ~/.config

# select packages to install from dotfiles
DIR_NAMES=$(find . -maxdepth 1 -mindepth 1 -not -path '*/\.*' -type d -printf '%P\n')
PACKAGES=$(echo "$DIR_NAMES" | sort | gum choose --height 20 --no-limit)

# install selected packages
echo "$PACKAGES" | while read -r PACKAGE_NAME; do
	PACKAGE_PATH="$SCRIPT_PATH/$PACKAGE_NAME"

	if [ -f "$PACKAGE_PATH/install.sh" ]; then
		command "$PACKAGE_PATH/install.sh" "$OS"
	else
		command brew install "$PACKAGE_NAME"
	fi

	echo "$PACKAGE_NAME installed"

	# symlink package config folder
	[ ! -d "$XDG_CONFIG_HOME/$PACKAGE_NAME" ] && mkdir "$XDG_CONFIG_HOME/$PACKAGE_NAME"
	stow -t "$XDG_CONFIG_HOME/$PACKAGE_NAME" "$PACKAGE_NAME"
	echo "$PACKAGE_NAME config linked"

done

# add global gitgnore
ln -s "$HOME/.gitignore" "$HOME/.dotfiles/.gitignore"
git config --global --get core.excludesfile

# TODO: install and config astronvim
# TODO: add default editor when edit from lazygit (see lazygit docs)
# TODO: add bin scripts to .local/bin
# TODO: install go, node, python with mise
# TODO: install ulaunch for linux
# TODO: set scripts execution permissions
