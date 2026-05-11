# . "$HOME/.cargo/env"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME=$XDG_CONFIG_HOME/local/share
export XDG_CACHE_HOME=$XDG_CONFIG_HOME/cache

export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml
export RIPGREP_CONFIG_PATH="$HOME/.config/ripgrep/.ripgreprc"
export ZDOTDIR=~/.config/zsh
export EDITOR="nvim"

export PATH="$HOME/.local/bin:$PATH"

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
*":$PNPM_HOME:"*) ;;
*) export PATH="$PNPM_HOME:$PATH" ;;
esac

# shellcheck source=/dev/null
# Source secrets if they exist
[[ -f ~/.zsh_secrets ]] && source ~/.zsh_secrets
