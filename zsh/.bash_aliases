#!/bin/bash
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
	mkdir -p "$1"
	cd "$1" || exit
}

# gpb -> push current branch into origin
function gpb {
	local curr_branch
	curr_branch=$(git-current-branch)
	git push origin "$curr_branch" "$@"
}

# gpbf -> force with lease & don't verify push current branch into origin
function gpbf {
	local curr_branch
	curr_branch=$(git-current-branch)
	git push origin "$curr_branch" --no-verify --force-with-lease
}

# gmr -> fetch remote MR branch to review & checkout into it
function gmr {
	git fetch "$1" merge-requests/"$2/head:mr-$1-$2"
	git checkout mr-"$1-$2"
}

# fun -> search & prints a custom function name
function fun {
	cat "$HOME"/.dotfiles/zsh/.bash_aliases | grep -A"${2:-1}" "$1"
}

function zsh_init_mes {
	# seq prints sequences of numbers. We use it with for .. in loop to run the commands 10 times
	# time is a utility command to execute a command and then print out time used
	# -i running zsh in interactive mode - meaning we can run (or pass) commands to it to execute
	# -c tells zsh to take the next part which is exit as a command to execute, not as a parameter

	for i in $(seq 1 10); do /usr/bin/time zsh -i -c exit; done
}
