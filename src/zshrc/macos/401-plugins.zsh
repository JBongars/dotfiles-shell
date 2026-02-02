# docker autocomplete
source <(docker completion zsh)

# SDKman initialization
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# Terraform completion
complete -o nospace -C $(which terraform) terraform

# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/julien/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions
