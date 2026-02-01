#!/bin/bash

# clear all the mac stuff
#" tput reset

# config locale string for perl
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export EDITOR="nvim"

# export brew in path
export PATH="$PATH:/opt/homebrew/bin"

# export xcode binaries to path
export PATH="$PATH:/Applications/Xcode.app/Contents/Developer/usr/bin"

# brew linked files
export PATH="$PATH:/opt/homebrew/opt/openjdk/bin"
export PATH="$PATH:/opt/homebrew/opt/openjdk@11/bin"

# override newer bsah to replace mac bash
export PATH="/opt/bin/bash:$PATH"

# export PATH="$PATH:/opt/homebrew/Caskroom/powershell/7.5.2"

# android stuff
function init_android(){
  export ANDROID_HOME=$HOME/Library/Android/sdk
  export PATH=$PATH:$ANDROID_HOME/tools
  export PATH=$PATH:$ANDROID_HOME/tools/bin
  export PATH=$PATH:$ANDROID_HOME/platform-tools
  export PATH=$PATH:$ANDROID_HOME/emulator
}

# Postgres
PATH="/opt/homebrew/Cellar/postgresql@17/17.7/bin:$PATH"

complete -C "/opt/homebrew/bin/aws_completer" aws
# export JULIEN_IS_LOADED_AWS=0
# function aws() {
#   if [ $JULIEN_IS_LOADED_AWS -eq 0 ]; then
#     JULIEN_IS_LOADED_AWS=1
#     complete -C aws_completer aws
#   fi
# 
#   command "/opt/homebrew/bin/aws" "$@"
# }

# Setup TFenv: https://github.com/tfutils/tfenv
export PATH="$HOME/.tfenv/bin:$PATH"
alias tfi="tfenv install min-required && tfenv use min-required && terraform init"


function nvm() {
  if [ -z $NVM_DIR ]; then 
    export NVM_DIR="$HOME/.nvm"
    [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
    [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
  fi

  "/opt/homebrew/opt/nvm/nvm.sh" $@
}

function pyenv() {
  if [ -z $PYENV_ROOT ]; then
    export PYENV_ROOT="$HOME/.pyenv"
    [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
  fi

  command "/opt/homebrew/bin/pyenv" "$@" 
}

# Function for printing a specific row
row() {
  awk "NR==$1" "$2"
}

# Load ASDF. This has very low overhead so this is ok
# source /opt/homebrew/opt/asdf/libexec/asdf.sh

# ----------
# DOCKER TOOLS
alias de="python -m /opt/development/docker-tools/python/run.py"
# ----------

# Aliases

alias vi="nvim"
alias vim="/usr/bin/vim"
alias cat="bat"
# alias ls="ls -a -l --color"
alias ls="eza -la --git --icons --group-directories-first --time-style=long-iso --classify"
alias cdgit='cd $(git rev-parse --show-toplevel)'
# simple tree
alias stree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
alias tree="ls --tree"
alias grep="grep --color=always"
alias less="less -R"

alias tf="terraform"
alias lgit="lazygit"

# who the heck calls it pwsh?
alias powershell="pwsh"

function gitssh() {
  GIT_SSH_COMMAND="ssh -i $1" git ${@:2}
}

function rgl() {
   if [ $# -eq 0 ]; then
     rg --hidden
   else
     rg --hidden -p "$@" | less
   fi
}


export HISTTIMEFORMAT="%Y-%m-%d %H:%M:%S "
