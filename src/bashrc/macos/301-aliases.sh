# Get correct path for nvm
function nvm() {
  if [ -z $NVM_DIR ]; then 
    export NVM_DIR="$HOME/.nvm"
    [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
    [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
  fi

  "/opt/homebrew/opt/nvm/nvm.sh" $@
}

# Get correct path for pyenv
function pyenv() {
  if [ -z $PYENV_ROOT ]; then
    export PYENV_ROOT="$HOME/.pyenv"
    [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
  fi

  command "/opt/homebrew/bin/pyenv" "$@" 
}

alias tfi="tfenv install min-required && tfenv use min-required && terraform init"
