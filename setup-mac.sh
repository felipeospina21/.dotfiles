#!/bin/bash
set -e

DOTFILES="$(cd "$(dirname "$0")" && pwd)"
XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

# --- Install Homebrew ---
if ! command -v brew &>/dev/null; then
	echo "Installing Homebrew..."
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# --- Install packages from Brewfile ---
echo "Installing packages..."
brew bundle --file="$DOTFILES/Brewfile"

# --- Create required directories ---
mkdir -p "$HOME/.local/bin" "$XDG_CONFIG_HOME"

# --- Stow configs ---
# Packages whose folder name matches their XDG config dir name
STOW_PACKAGES=(
	nvim
	starship
	lazygit
	lazydocker
	wezterm
	yazi
	atuin
	bottom
	ripgrep
	tmux
	yabai
	skhd
	sketchybar
	mise
)

echo "Linking configs..."
for pkg in "${STOW_PACKAGES[@]}"; do
	if [ -d "$DOTFILES/$pkg" ]; then
		mkdir -p "$XDG_CONFIG_HOME/$pkg"
		stow -t "$XDG_CONFIG_HOME/$pkg" -d "$DOTFILES" "$pkg"
		echo "  ✓ $pkg"
	fi
done

# --- Zsh (special case: links to $HOME) ---
stow -t "$HOME" -d "$DOTFILES" zsh
echo "  ✓ zsh"

# --- Scripts to PATH ---
stow -t "$HOME/.local/bin" -d "$DOTFILES" bin
echo "  ✓ bin scripts"

# --- Global gitignore ---
ln -sf "$DOTFILES/.gitignore" "$HOME/.gitignore"
git config --global core.excludesfile "$HOME/.gitignore"

# --- Install language runtimes via mise ---
if command -v mise &>/dev/null; then
	echo "Installing runtimes via mise..."
	mise install
fi

# --- SSH key ---
if [ ! -f "$HOME/.ssh/id_ed25519" ]; then
	read -rp "Email for SSH key: " ssh_email
	ssh-keygen -t ed25519 -C "$ssh_email" -f "$HOME/.ssh/id_ed25519" -N ""
	eval "$(ssh-agent -s)"
	ssh-add "$HOME/.ssh/id_ed25519"
	echo ""
	echo "⚠️  Add this SSH key to GitLab/GitHub:"
	echo "   https://gitlab.com/-/user_settings/ssh_keys"
	echo "   https://github.com/settings/ssh/new"
	echo ""
	cat "$HOME/.ssh/id_ed25519.pub"
	echo ""
fi

# --- macOS preferences ---
echo "Setting macOS defaults..."
source "$DOTFILES/macos-defaults.sh"

echo "Done! Restart your shell."
