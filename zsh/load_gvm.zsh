autoload -U add-zsh-hook

gvm_echo() {
    command printf %s\\n "$*" 2>/dev/null
}

gvm_find_up() {
    local path_
    path_="${PWD}"
    while [ "${path_}" != "" ] && [ "${path_}" != '.' ] && [ ! -f "${path_}/${1-}" ]; do
        path_=${path_%/*}
    done
    gvm_echo "${path_}"
}

gvm_find_gomod() {
    # finds if there is a go.mod int the curr dir 
    local dir
    dir="$(gvm_find_up 'go.mod')"
    if [ -e "${dir}/go.mod" ]; then
        gvm_echo "${dir}/go.mod"
    fi
}

get_gvm_default(){
    # reads the file content, look for the go version and removes white spaces
    cat "${1}" | grep -m 1 go | tr -d " \t\n\r"
}

load-gvm() {
    if [[ -f "$PWD/go.mod" ]]; then
        local go_default_version="$(gvm list | grep '=>' | awk '{print $2}')"
        local gomod_path="$(gvm_find_gomod)"

        if [ -n "$gomod_path" ]; then
            local gomod_go_version=$(get_gvm_default "${gomod_path}")

            if [ "$gomod_go_version" != "$go_default_version" ]; then
                gvm applymod
            else
                echo $gomod_go_version
            fi

        elif [ "$go_default_version" != "$(get_gvm_default '${gomod_path}')" ]; then
            echo "Reverting to gvm default version"
            gvm use $go_default_version
        fi
    fi
}

add-zsh-hook chpwd load-gvm
load-gvm
