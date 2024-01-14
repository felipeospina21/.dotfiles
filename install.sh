#!/bin/bash

OS=$(uname)
SCRIPT=$(realpath "$0")
SCRIPT_PATH=$(dirname "$SCRIPT")

# install packages
GENERAL_PACKAGES=(stow bat exa fd fzf tree-sitter)
LINUX_PACKAGES=(xclip jq brightnessctl pulseaudio-module-bluetooth pulseaudio-equalizer pulseaudio-module-jack alsa-utils playerctl autoreconf)

if [ "$OS" = "Linux" ]; then
	PACKAGE_MANAGER="sudo apt"
	# TODO: install each package

elif [ "$OS" = "Darwin" ]; then
	# install brew
	PACKAGE_MANAGER="brew"
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	# install each package
else
	echo "No script for selected OS"
	exit 1
fi

# install gum
if [ ! "$(command -v gum)" ]; then
	if [ "$OS" = "Linux" ]; then
		sudo mkdir -p /etc/apt/keyrings
		curl -fsSL https://repo.charm.sh/apt/gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/charm.gpg
		echo "deb [signed-by=/etc/apt/keyrings/charm.gpg] https://repo.charm.sh/apt/ * *" | sudo tee /etc/apt/sources.list.d/charm.list
		sudo apt update && sudo apt install gum -y
	else
		brew install gum
	fi
fi

[ ! -d ~/.local ] && mkdir ~/.local && mkdir ~./local/bin
[ ! -d ~/.config ] && mkdir ~/.config

# select packages to install
DIR_NAMES=$(find . -maxdepth 1 -mindepth 1 -not -path '*/\.*' -type d -printf '%P\n')
PACKAGES=$(echo "$DIR_NAMES" | sort | gum choose --height 20 --no-limit)

# install selected packages
echo "$PACKAGES" | while read -r PACKAGE_NAME; do
	PACKAGE_PATH="$SCRIPT_PATH/$PACKAGE_NAME"

	if [ -f "$PACKAGE_PATH/install.sh" ]; then
		command "$PACKAGE_PATH/install.sh" "$OS"
	else
		command "$PACKAGE_MANAGER" install "$PACKAGE_NAME"
	fi

done

# TODO: create sym links with stow (stow -t $HOME/.config/i3 i3)
# TODO: add linux root files .xprofile .Xresource
# TODO: add global .gitignore
# TODO: install and config nvim & astronvim
# TODO: add default editor when edit from lazygit (see lazygit docs)
# TODO: add bin scripts to .local/bin
# TODO: install go, node, python with mise
# TODO: install ulaunch for linux
# TODO: set scripts execution permissions
