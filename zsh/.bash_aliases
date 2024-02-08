#!/bin/bash
alias ls=lsReplacement
alias ll=ll
alias la=la
alias cls='clear'
alias gg='lazygit'
alias lg='lazygit'
alias npk='npx npkill'

alias mac-keys='bat $DOTFILES/skhd/skhdrc'
alias mks='mac-keys | fzf'

# Git
alias gb='git branch | fzf | xargs git checkout'
alias git-current-branch="git branch | grep \* | cut -d ' ' -f2"
alias gaa='git add .'
alias gp='git pull'

# Zsh
alias up_alias='nvim $DOTFILES/zsh/.bash_aliases'
alias up_zsh='nvim $DOTFILES/zsh/.zshrc'
alias up_zsh_fold='nvim $DOTFILES/zsh'

# Node (projects)
alias tc='npm run type-check'
alias gq='npm run gql:gen && npm run lint:fix'
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
	cat <"$HOME"/.dotfiles/zsh/.bash_aliases | grep -A"${2:-1}" "$1" | bat || less
}

function zsh_init_mes {
	# seq prints sequences of numbers. We use it with for .. in loop to run the commands 10 times
	# time is a utility command to execute a command and then print out time used
	# -i running zsh in interactive mode - meaning we can run (or pass) commands to it to execute
	# -c tells zsh to take the next part which is exit as a command to execute, not as a parameter

	for _ in $(seq 1 10); do /usr/bin/time zsh -i -c exit; done
}

function lsReplacement {
	if command -v eza &>/dev/null; then
		eza --icons --sort=ext "$@"
	elif command -v exa &>/dev/null; then
		exa --icons --sort=ext "$@"
	else
		ls --color=always "$@"
	fi
}

function ll {
	if command -v eza &>/dev/null; then
		eza -lh --icons --sort=ext
	elif command -v exa &>/dev/null; then
		exa -lh --icons --sort=ext
	else
		ls -l --color=always
	fi
}

function la {
	if command -v eza &>/dev/null; then
		eza -lha --icons --sort=ext
	elif command -v exa &>/dev/null; then
		exa -lha --icons --sort=ext
	else
		ls -la --color=always
	fi
}
