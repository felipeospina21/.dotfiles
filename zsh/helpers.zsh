source_if_exists() {
    if test -r "$1"; then
        source "$1"
    else
        echo "Couldn't find $1"
    fi
}

eval_if_installed() {
    if command -v "$1" &>/dev/null; then
        eval "$("${@:1}")"
    fi
}
