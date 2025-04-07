# Lines configured by zsh-newuser-install
# zmodload zsh/zprof

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt autocd beep extendedglob notify
bindkey -e
zstyle :compinstall filename "$HOME/.zshrc"

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=59'

export DOTFILES=$HOME/.dotfiles

source_if_exists () {
    if test -r "$1"; then
        source "$1"
    else 
        echo "Couldn't find $1"
    fi
}

source_if_exists $DOTFILES/zsh/.bash_aliases
source_if_exists $DOTFILES/zsh/completion.zsh
source_if_exists $DOTFILES/zsh/plugins.zsh
# replaced by mise
# source_if_exists $DOTFILES/zsh/load_nvmrc.zsh
# source_if_exists $DOTFILES/zsh/load_gvm.zsh

eval "$(starship init zsh)"
zvm_after_init_commands+=(eval "$(atuin init zsh)")

mise_path=$(whereis mise | awk -F': ' '{print $2}' | awk '{print $1}')
eval "$("$mise_path" activate zsh)"

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
