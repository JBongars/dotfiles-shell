#!/bin/zsh

autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit

# start in emacs mode
bindkey -e

zle -N toggle_vim_mode
function toggle_vim_mode() {
    if [ "$(bindkey -l)" = "viins" ]; then
        bindkey -e  # switch to emacs
    else
        bindkey -v  # switch to vim
    fi
}

# Try both common ways to bind Ctrl+Q
bindkey "^H" toggle_vim_mode

bindkey '^H' backward-word
bindkey '^L' forward-word
bindkey '^DH' backward-kill-word  # ctrl-d-h to delete word backward
bindkey '^DL' kill-word          # ctrl-d-l to delete word forward

bindkey "^[[3~" delete-char # Mac sends the wrong character sequence for Del key


# DISABLED AS ASDF MODIFIES TERMINAL 
# I DON'T SEE WHY THIS IS NECESSAY FOR ALL TERMINAL SESSIONS
# export PATH="$PATH:/$HOME/.asdf/shims"
# export JULIEN_LOAD_ASDF
# 
# function asdf(){
#     if [ -z "$JULIEN_LOAD_ASDF" ]; then
#         JULIEN_LOAD_ASDF=1
# 
#         "$HOME/.asdf/asdf.sh"  
#         "$HOME/.asdf/completions/asdf.bash" 
#     fi
# 
#     command asdf "$@"
# }

[ -f ~/.bashrc ] && source ~/.bashrc

# load plugins after bashrc
fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit && compinit -i

# docker autocomplete
source <(docker completion zsh)

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C $(which terraform) terraform
# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/julien/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions
