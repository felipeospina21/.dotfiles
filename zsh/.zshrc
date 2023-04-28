# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt autocd beep extendedglob notify
bindkey -e
zstyle :compinstall filename '/home/felipe/.zshrc'

# End of lines added by compinstall
eval "$(oh-my-posh init zsh)"
eval "$(oh-my-posh --init --shell bash --config ~/custom_kali.omp.json)"

# Aliases
alias ls='ls --color=auto'
alias cls='clear'
alias nvim='~/nvim/nvim-linux64/bin/nvim'
alias lg='lazygit'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# import ENV variables 
source ${HOME}/var.txt
export RIPGREP_CONFIG_PATH="~/.config/ripgrep/.ripgreprc"

#zcomet plugin manager
# Clone zcomet if necessary
if [[ ! -f ${ZDOTDIR:-${HOME}}/.zcomet/bin/zcomet.zsh ]]; then
  command git clone https://github.com/agkozak/zcomet.git ${ZDOTDIR:-${HOME}}/.zcomet/bin
fi

source ${ZDOTDIR:-${HOME}}/.zcomet/bin/zcomet.zsh

# Load some plugins
zcomet load agkozak/zsh-z
zcomet load ohmyzsh plugins/gitfast

# It is good to load these popular plugins last, and in this order:
#zcomet load zsh-users/zsh-syntax-highlighting
zcomet load zsh-users/zsh-autosuggestions

# Run compinit and compile its cache
zcomet compinit
