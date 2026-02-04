#!/bin/bash

BASE_CONFIG_PATH="$(cd "$(dirname "$0")" && pwd)"
BASE_SOURCE_PATH="${BASE_CONFIG_PATH}/src"

function get_platform() {
    case "$(uname -s)" in
        Linux*)  echo "linux" ;;
        Darwin*) echo "macos" ;;
        *)       echo "unknown" ;;
    esac
}

function backup_config() {
    local backup_profile=$1

    mkdir -p "$backup_profile"
    local files=(".bash_logout" ".profile" ".bash-preexec.sh" ".bash_profile" ".bashrc" ".zshrc")
    for f in "${files[@]}"; do
        [[ -f "$HOME/$f" ]] && mv "$HOME/$f" "$backup_profile/"
    done
}

function main() {
    echo "backing up old dotfiles..."
    backup_config "$HOME/.profile.bak/$(date +"%Y%m%d%H%M%S")"

    echo "installing dotfiles..."
    stow -R -d "${BASE_CONFIG_PATH}/out" -t "$HOME" "$(get_platform)"
}

main

