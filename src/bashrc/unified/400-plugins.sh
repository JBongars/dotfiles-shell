# __________.__               .__               
# \______   \  |  __ __  ____ |__| ____   ______
#  |     ___/  | |  |  \/ ___\|  |/    \ /  ___/
#  |    |   |  |_|  |  / /_/  >  |   |  \\___ \ 
#  |____|   |____/____/\___  /|__|___|  /____  >
#                     /_____/         \/     \/ 
# ----------------------------------
# atuin (https://atuin.sh/)
#
# to install
# curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh
#
if [[ -f "$HOME/.atuin/bin/env" ]]; then
    . "$HOME/.atuin/bin/env"
    if [[ -n "$BASH_VERSION" ]]; then
        [[ -f ~/.bash-preexec.sh ]] && source ~/.bash-preexec.sh
        eval "$(atuin init bash)"
        eval "$(atuin gen-completions --shell bash)"
        # returns up and down arrows to default behaviour
        bind '"\e[A": previous-history'
        bind '"\e[B": next-history'
    fi
fi
