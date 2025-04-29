#!/bin/bash
alias ls=lsReplacement
alias ll=ll
alias la=la
alias cls='clear'
alias gg='lazygit'
alias lg='lazygit'
alias glt='glabt'
alias npk='npx npkill'
alias zsh-alias='nvim $DOTFILES/zsh/.bash_aliases'

alias mac-keys='bat $DOTFILES/skhd/skhdrc'
alias mks='mac-keys | fzf'

# Git
alias gb='git branch | fzf | xargs git checkout'
alias git-current-branch="git branch | grep \* | cut -d ' ' -f2"
alias gaa='git add .'
alias gp='git_pull_and_install'

# Zsh
alias up_alias='nvim $DOTFILES/zsh/.bash_aliases'
alias up_zsh='nvim $DOTFILES/zsh/.zshrc'
alias up_zsh_fold='nvim $DOTFILES/zsh'

# Node (projects)
alias nps='npm start || pnpm run dev'
alias tc='npm run type-check'
alias tt='npm run test'
alias tw='npm run test:watch'
alias tws='npm run test:watch -- --silent'
alias gq="npm run gql:gen && ./node_modules/.bin/prettier --write 'src/shared/graphql/**/*.{js,ts,tsx,jsx,scss}'"
alias ci='$PWD/node_modules/.bin/npm-run-all prettier lint:fix stylelint type-check'
alias outdated='npx npm-check-updates -i --format group'

# Jira
alias jlm='jira issue list -a$(jira me)'

# Brew
alias brewup='brew outdated | gum choose --no-limit | xargs brew upgrade'

# tok -> update project token
function tok {
	token=$(gum input --password --char-limit 9999 --placeholder "paste token...")
	if [ -n "$token" ]; then
		echo "ID_TOKEN=$token" >.env.local
		echo "token updated in $PWD/.env.local"
	fi
}

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

# fun -> search & prints a custom func name
function fun {
	cat <"$HOME"/.dotfiles/zsh/.bash_aliases | grep -A"${2:-1}" "$1" | bat || less
}

# zsh_init_mes -> measures the time that zsh takes to start
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

function git_pull_and_install {
	isNewPackage=$(git pull | grep "package.json")
	if [[ $isNewPackage ]]; then
		packageManager=$(gum confirm "Install new packages?" && gum choose "npm" "pnpm" "yarn")
		if [[ $packageManager ]]; then
			"$packageManager" install
		fi
	fi
}

# yy -> yazi
function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# notes -> open notes folder
# notes new -> creates new note and open it
function notes() {
	p="$HOME/notes/"

	cd "$p" || exit

	if [ -n "$1" ] && [ "$1" = "new" ]; then
		d="$(date +"%d_%m_%y")"
		n="$(ls -l | wc -l | xargs)"
		count=$((n + 1))
		filename="note${count}_${d}.md"
		touch "$filename"
		nvim "$filename"
	else
		nvim .
	fi

}

# mentoria -> open notes folder
alias ment='mentoria'
function mentoria() {
	base_path="$HOME/mentorias"
	selected_dir=$(fd --type d --max-depth 1 --base-directory "$base_path" . | fzf --prompt="Select a directory: " --preview="eza -lh --icons --sort=ext $base_path/{}")

	if [ -n "$selected_dir" ]; then
		cd "$base_path"/"$selected_dir" || exit
		nvim "$base_path"/"$selected_dir"

	else
		echo "No directory selected. Exiting."
	fi

}
