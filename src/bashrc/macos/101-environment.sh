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

# AWS CLI completion
complete -C "/opt/homebrew/bin/aws_completer" aws

# Setup TFenv: https://github.com/tfutils/tfenv
export PATH="$HOME/.tfenv/bin:$PATH"

