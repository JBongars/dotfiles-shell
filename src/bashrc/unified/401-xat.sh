xat() {
    local f delim
    for f in "$@"; do
        if [[ ! -f "$f" ]]; then
            printf 'xat: %s: not a regular file\n' "$f" >&2
            continue
        fi

        # Pick a delimiter that doesn't appear as a line in the file
        delim=EOF
        while grep -qxF "$delim" "$f"; do
            delim="EOF_$RANDOM"
        done

        printf "\cat > %s << '%s'\n" "$f" "$delim"
        \cat -- "$f"
        # Add a newline only if the file doesn't already end with one,
        # so the closing delimiter lands on its own line
        [[ -n "$(tail -c1 -- "$f")" ]] && printf '\n'
        printf '%s\n\n' "$delim"
    done
}
