#!/bin/bash

BASE_CONFIG_PATH="$(cd "$(dirname "$0")" && pwd)"
BASE_SOURCE_PATH="${BASE_CONFIG_PATH}/src"

PLATFORMS=("linux" "macos")
# TARGETS=("bashrc" "zshrc" "bash_profile")
TARGETS=("bashrc" "zshrc")

COMMAND="$1"

function cat_config() {
    local base_target_path=$1
    local platform=$2

    find "${base_target_path}/unified" -name '000-banner.*' -exec cat {} +
    echo "# GENERATED AUTOMATICALLY - DO NOT EDIT"
    echo "# $(printf '═%.0s' {1..50})"
    echo ""
    {
        find "${base_target_path}/unified" -type f
        find "${base_target_path}/${platform}" -type f
    } | while read -r f; do
        printf '%s\t%s\n' "$(basename "$f")" "$f"
    done | grep -v '000-banner' | sort | cut -f2- | while read -r f; do    
        echo ""
        echo "# $f"
        echo "# $(printf '─%.0s' {1..50})"
        echo ""
        cat "$f"
    done
}

function generate_config(){
    local target=$1
    local platform=$2
    local base_target_path="${BASE_SOURCE_PATH}/${target}"
    local base_target_out="${BASE_CONFIG_PATH}/out/${platform}"
    local base_target_out_file="${base_target_out}/.$target"

    # Check if target is supported on platform
    if [ ! -d "${base_target_path}/${platform}" ] ; then
        exit 0
    fi

    # Check if out folder exists
    if [ ! -d "${base_target_out}" ] ; then
        mkdir "${base_target_out}"
    fi

    ( cat_config "$base_target_path" "$platform" )> "${base_target_out_file}"
}

function main() {
    for target in "${TARGETS[@]}" ; do
        echo "generating $target..."
        for platform in "${PLATFORMS[@]}" ; do
            echo "    - $platform"
            generate_config "$target" "$platform"
        done
    done

    if [ "$COMMAND" = "install" ]; then
        exec bash "$BASE_CONFIG_PATH/install.sh"
    fi
}

main

