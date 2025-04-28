# XDG
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME=$XDG_CONFIG_HOME/local/share
export XDG_CACHE_HOME=$XDG_CONFIG_HOME/cache
export STARSHIP_CONFIG=$XDG_CONFIG_HOME/starship/starship.toml
export ZDOTDIR=$XDG_CONFIG_HOME/zsh
export RIPGREP_CONFIG_PATH="$HOME/.config/ripgrep/.ripgreprc"

export PATH="$HOME:"$HOME/.local/bin":$PATH"
