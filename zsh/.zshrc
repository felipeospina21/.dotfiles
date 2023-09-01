# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt autocd beep extendedglob notify
bindkey -e
zstyle :compinstall filename "$HOME/.zshrc"

# Version managers
alias gvm="unalias gvm;  [[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"; gvm $@"
alias nvm="unalias nvm; [[ -s "$NVM_DIR/nvm.sh" ]] && . "$NVM_DIR/nvm.sh"; nvm $@"

source_if_exists () {
    if test -r "$1"; then
        source "$1"
    fi
}

source_if_exists $DOTFILES/zsh/.bash_aliases
source_if_exists $DOTFILES/zsh/load_nvmrc.zsh
source_if_exists $DOTFILES/zsh/plugins.zsh

# import ENV variables
export PATH="$HOME:"$HOME/.local/bin":$PATH"

eval "$(starship init zsh)"
eval "$(atuin init zsh)"

# Linux Homebrew
test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
test -r ~/.bash_profile && echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> ~/.bash_profile
echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> ~/.profile


#if [ -e /home/felipe/.nix-profile/etc/profile.d/nix.sh ]; then . /home/felipe/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
