#zcomet plugin manager
# Clone zcomet if necessary
if [[ ! -f ${ZDOTDIR:-${HOME}}/.zcomet/bin/zcomet.zsh ]]; then
    command git clone https://github.com/agkozak/zcomet.git ${ZDOTDIR:-${HOME}}/.zcomet/bin
fi

source ${ZDOTDIR:-${HOME}}/.zcomet/bin/zcomet.zsh

# Load some plugins
zcomet load agkozak/zsh-z
zcomet load ohmyzsh plugins/gitfast

# Lazy load version managers
zcomet trigger nvm node npm yarn pnpm ohmyzsh plugins/nvm
zcomet trigger gvm go gopls dgnest/zsh-gvm-plugin
# zcomet load dgnest/zsh-gvm-plugin

# It is good to load these popular plugins last, and in this order:
zcomet load zsh-users/zsh-syntax-highlighting
zcomet load jeffreytse/zsh-vi-mode
zcomet load zsh-users/zsh-autosuggestions

# Run compinit and compile its cache
zcomet compinit
