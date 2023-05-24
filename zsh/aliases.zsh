alias ls='exa -lh --icons --sort=ext'
alias la='exa -lha --icons --sort=ext'
alias cls='clear'
alias lg='lazygit'
alias npk='npx npkill'

function take {
    mkdir -p $1
    cd $1
}

function gp {
    git push origin $@
}
