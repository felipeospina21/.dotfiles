# profiling
# zmodload zsh/zprof

# shellcheck disable=SC2034 # error for unusued variables fasle positive
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

setopt HIST_IGNORE_DUPS  # don't store consecutive duplicates
setopt HIST_IGNORE_SPACE # commands starting with space won't be saved
setopt SHARE_HISTORY

# autocd: don't cd by typing dir name | beep: no terminal bell | extendedglob: avoid conflicts with git refs | notify: no immediate bg job alerts
unsetopt autocd beep extendedglob notify

export DOTFILES=$HOME/.dotfiles

source "$DOTFILES/zsh/helpers.zsh"

source_if_exists "$DOTFILES/zsh/.bash_aliases"
source_if_exists "$DOTFILES/zsh/completion.zsh"
source_if_exists "$DOTFILES/zsh/plugins.zsh"

eval_if_installed starship init zsh
eval_if_installed mise activate zsh

if command -v atuin &>/dev/null; then
    zvm_after_init_commands+=(eval "$(atuin init zsh)")
fi

if [ -x "/home/linuxbrew/.linuxbrew/bin/brew" ]; then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# profiling
# zprof
