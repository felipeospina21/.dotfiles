alias ls='exa -lh --icons --sort=ext'
alias la='exa -lha --icons --sort=ext'
alias cls='clear'
alias gg='lazygit'
alias lg='lazygit'
alias npk='npx npkill'

# Git
alias gb='git branch | fzf | xargs git checkout'
alias git-current-branch="git branch | grep \* | cut -d ' ' -f2"
alias gaa='git add .'

# Node (projects)
alias tc='npm run type-check'
alias gq='npm run gql:gen'
alias ci='npm run ci-check'

# Jira
alias jlm='jira issue list -a$(jira me)'


function take {
    mkdir -p $1
    cd $1
}

function gp {
    git push origin $@
}

function gpb {
    local curr_branch=`git-current-branch`
    git push origin $curr_branch $@
}
