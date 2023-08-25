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


# take -> create a dir & cd to it
function take {
    mkdir -p $1
    cd $1
}

# gpb -> push current branch into origin
function gpb {
    local curr_branch=`git-current-branch`
    git push origin $curr_branch $@
}

# gmr -> fetch remote MR branch to review & checkout into it
function gmr {
    git fetch $1 merge-requests/$2/head:mr-$1-$2
    git checkout mr-$1-$2
}

# fun -> search & prints a custom function name
function fun {
    cat $HOME/.dotfiles/zsh/.bash_aliases | grep -A${2:-1} $1
}
