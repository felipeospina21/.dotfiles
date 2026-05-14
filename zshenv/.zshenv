# stow command for .zshenv
# stow: stow -d ~/.dotfiles -t ~ zshenv

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
export RIPGREP_CONFIG_PATH="$HOME/.config/ripgrep/.ripgreprc"
export ZDOTDIR="$HOME/.config/zsh"
export EDITOR="nvim"

export PATH="$HOME/.local/bin:$PATH"

# cargo
# shellcheck source=/dev/null
[[ -f "$HOME/.cargo/env" ]] && . "$HOME/.cargo/env"

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
*":$PNPM_HOME:"*) ;;
*) export PATH="$PNPM_HOME:$PATH" ;;
esac

# shellcheck source=/dev/null
# Source secrets if they exist
[[ -f ~/.zsh_secrets ]] && source ~/.zsh_secrets

## migrate to right XDG paths
## rsync -a ~/.config/local/share/ ~/.local/share/ && rm -rf ~/.config/local/share && rsync -a ~/.config/cache/ ~/.cache/ && rm -rf ~/.config/cache && mkdir -p ~/.local/state && rmdir ~/.config/local 2>/dev/null; echo "Done"
