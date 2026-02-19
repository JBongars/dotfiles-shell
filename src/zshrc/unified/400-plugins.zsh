# __________.__               .__               
# \______   \  |  __ __  ____ |__| ____   ______
#  |     ___/  | |  |  \/ ___\|  |/    \ /  ___/
#  |    |   |  |_|  |  / /_/  >  |   |  \\___ \ 
#  |____|   |____/____/\___  /|__|___|  /____  >
#                     /_____/         \/     \/ 
# ----------------------------------

# load plugins after bashrc
fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit && compinit -i


# atuin (https://atuin.sh/)
#
# to install
# curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh
#

if [ -f "$HOME/.atuin/bin/env" ] ; then 
    . "$HOME/.atuin/bin/env"
fi

eval "$(atuin init --disable-up-arrow zsh)"
eval "$(atuin gen-completions --shell zsh)"

