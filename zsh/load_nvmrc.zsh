# nvm autmoatic use of .nvmrc

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

autoload -U add-zsh-hook

nvm_echo() {
    command printf %s\\n "$*" 2>/dev/null
}

nvm_find_up() {

    local path_
    path_="${PWD}"
    while [ "${path_}" != "" ] && [ "${path_}" != '.' ] && [ ! -f "${path_}/${1-}" ]; do
        path_=${path_%/*}
    done
    nvm_echo "${path_}"
}

nvm_find_nvmrc() {
    local dir
    dir="$(nvm_find_up '.nvmrc')"
    if [ -e "${dir}/.nvmrc" ]; then
        nvm_echo "${dir}/.nvmrc"
    fi
}

load-nvmrc() {
    alias nvm="unalias nvm; [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"; nvm $@"

    if [[ -f "$PWD/package.json" ]]; then
        local node_version="$(nvm version)"
        local nvmrc_path="$(nvm_find_nvmrc)"

        if [ -n "$nvmrc_path" ]; then
            local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

            if [ "$nvmrc_node_version" = "N/A" ]; then
                nvm install
            elif [ "$nvmrc_node_version" != "$node_version" ]; then
                nvm use
            fi
        elif [ "$node_version" != "$(nvm version default)" ]; then
            echo "Reverting to nvm default version"
            nvm use default
        fi
    fi
}

add-zsh-hook chpwd load-nvmrc
load-nvmrc
