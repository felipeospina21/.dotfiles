alias ls='exa -lh --icons --sort=ext'
alias la='exa -lha --icons --sort=ext'
alias cls='clear'
alias lg='lazygit'
alias npk='npx npkill'

function take {
    mkdir -p $1
    cd $1
}

# Git
alias gb='git branch | fzf | xargs git checkout'
alias git-current-branch="git branch | grep \* | cut -d ' ' -f2"
alias gaa='git add .'

function gp {
    git push origin $@
}

function gpb {
    local curr_branch=`git-current-branch`
    git push origin $curr_branch $@
}
