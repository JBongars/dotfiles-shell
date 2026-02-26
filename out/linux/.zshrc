
#               __                                                  _..._     
#   .--.     /)/ /\                                              .-'_..._''.  
#  /.''\\._.'// /  '                       .                   .' .'      '.\ 
# (/    `---'/ /  /                      .'|                  / .'            
#           / /  /                      <  |         .-,.--. . '              
#          / /  /                        | |         |  .-. || |              
#         / /  /   .--------.        _   | | .'''-.  | |  | || |              
#        / /  /    |____    |      .' |  | |/.'''. \ | |  | |. '              
#       / /  /,.--.    /   /      .   | /|  /    | | | |  '-  \ '.          . 
#      / /  ///    \ .'   /     .'.'| |//| |     | | | |       '. `._____.-'/ 
#     /_/  / \\    //    /___ .'.'.-'  / | |     | | | |         `-.______ /  
#     \ \ /   `'--'|         |.'   \_.'  | '.    | '.|_|                  `   
#      --'         |_________|           '---'   '---'                        


# GENERATED AUTOMATICALLY - DO NOT EDIT
# ══════════════════════════════════════════════════


# /Users/julien/.config/shell/src/zshrc/linux/.gitkeep
# ──────────────────────────────────────────────────


# /Users/julien/.config/shell/src/zshrc/unified/100-config.zsh
# ──────────────────────────────────────────────────

# _________                _____.__        
# \_   ___ \  ____   _____/ ____\__| ____  
# /    \  \/ /  _ \ /    \   __\|  |/ ___\ 
# \     \___(  <_> )   |  \  |  |  / /_/  >
#  \______  /\____/|___|  /__|  |__\___  / 
#         \/            \/        /_____/  
# ----------------------------------

setopt GLOB_DOTS
[[ ! -o interactive ]] && return

bindkey "^[[3~" delete-char

# start in emacs mode
bindkey -e

# Normal defaults for moving around text
# bindkey "^[b"    backward-word      # Alt+b (back)
# bindkey "^[f"    forward-word       # Alt+f (forward)
# bindkey "^[d"    kill-word          # Alt+d (delete forward)
# bindkey "^[^h"   backward-kill-word # Alt+Backspace (or Alt+Ctrl+h)

setopt EXTENDED_HISTORY       # saves timestamp + duration per command

HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.zsh_history

autoload -Uz compinit && compinit -i
autoload -U +X bashcompinit && bashcompinit


# /Users/julien/.config/shell/src/zshrc/unified/200-help.zsh
# ──────────────────────────────────────────────────

#   ___ ___         .__          
#  /   |   \   ____ |  | ______  
# /    ~    \_/ __ \|  | \____ \ 
# \    Y    /\  ___/|  |_|  |_> >
#  \___|_  /  \___  >____/   __/ 
#        \/       \/     |__|    
# ----------------------------------
read -r -d '' TERM_HELP_TEXT <<'EOF'
                        .           
                      .'|           
                     <  |           
                      | |           
.--------.        _   | | .'''-.    
|____    |      .' |  | |/.'''. \   
    /   /      .   | /|  /    | |   
  .'   /     .'.'| |//| |     | |   
 /    /___ .'.'.-'  / | |     | |   
|         |.'   \_.'  | '.    | '.  
|_________|           '---'   '---' 


  @@@@@@@ @@@  @@@ @@@@@@@@  @@@@@@  @@@@@@@  @@@@@@ @@@  @@@ @@@@@@@@ @@@@@@@@ @@@@@@@
 !@@      @@!  @@@ @@!      @@!  @@@   @@!   !@@     @@!  @@@ @@!      @@!        @@!  
 !@!      @!@!@!@! @!!!:!   @!@!@!@!   @!!    !@@!!  @!@!@!@! @!!!:!   @!!!:!     @!!  
 :!!      !!:  !!! !!:      !!:  !!!   !!:       !:! !!:  !!! !!:      !!:        !!:  
  :: :: :  :   : : : :: :::  :   : :    :    ::.: :   :   : : : :: ::: : :: :::    :   

Globbing Cheatsheet
=======================

Basic Patterns                              Qualifiers (after closing paren)
--------------                              --------------------------------
*           any characters (except /)       *(.)            files only
?           single character                *(/)            directories only
[abc]       a, b, or c                      *(@)            symlinks only
[a-z]       range                           *(x)            executable
[^abc]      not a, b, or c                  *(-.)           files, follow symlinks
**/*        recursive                       *(U)            owned by you
                                            *(L0)           empty files
Modifiers (after :)                         *(Lk+3)         size > 3KB
-------------------                         *(Lm+10)        size > 10MB
*.txt(:t)       filename only (tail)        *(m-7)          modified < 7 days
*.txt(:t:r)     filename without ext        *(mh-1)         modified < 1 hour
*.txt(:e)       extension only              *(om)           order by mtime (newest first)
*.txt(:h)       parent directory (head)     *(om[1,5])      5 most recent
*.txt(:h:h)     grandparent directory
*.txt([1]:h)    parent of first match       Combining: **/*(.Lm-2mh-1om[1,3])
                                              .       files only      om      sort by mtime
                                              Lm-2    < 2MB           [1,3]   first 3 results
                                              mh-1    modified < 1 hour

Extended (setopt EXTENDED_GLOB)
-------------------------------
^pattern        not matching pattern
                  ^*.txt        everything except .txt files
                  ^(foo|bar)*   exclude files starting with foo or bar

x~y             x but not y (set difference)
                  *.txt~README*   .txt files except README*
                  *~*.bak~*.tmp   everything except .bak and .tmp

(#i)pattern     case insensitive matching
                  (#i)*.jpg       matches .jpg, .JPG, .Jpg
                  (#i)readme      matches README, ReadMe, etc.

(pat1|pat2)     alternation (either pattern)
                  *.(jpg|png)     .jpg or .png files
                  (foo|bar)*.txt  files starting with foo or bar

##              one or more of previous (like regex +)
                  a##             one or more 'a's

#               zero or more of previous (like regex *)
                  a#              zero or more 'a's

<n-m>           numeric range
                  file<1-10>.txt  file1.txt through file10.txt
                  file<-5>.txt    file up to 5 (file1-5.txt)
                  file<5->.txt    file 5 and above


Examples
--------
**/*<1-10>.txt      .txt ending in 1-10                 **/*(L0)            empty files
**/[a]*.txt         .txt starting with a                **/*(Lk+3)          files > 3KB
**/(ab|bc)*.txt     .txt starting with ab or bc         **/*(mh-1)          modified in last hour
**/[^cC]*.txt       .txt not starting with c/C          **/*(om[1,3])       3 most recent files
**/*(/)             directories only                    **/*(e:'[[ -d $REPLY/.git ]]':)
**/*(.)             files only                              directories containing .git

Keybindings
-----------
Ctrl-A / Ctrl-E     beginning / end of line             Ctrl-R / Ctrl-S     history search back/fwd
Ctrl-U / Ctrl-K     kill to beginning / end             Ctrl-L              clear screen
Ctrl-W              kill word backward                  Ctrl-Z              suspend process
Alt-B / Alt-F       word backward / forward             Ctrl-C              interrupt
Alt-D               kill word forward                   Tab                 autocomplete
Alt-Backspace       kill word backward                  Alt-.               insert last argument
EOF
export TERM_HELP_TEXT

help() {
  echo "$TERM_HELP_TEXT" | less
}

# /Users/julien/.config/shell/src/zshrc/unified/300-source-bashrc.zsh
# ──────────────────────────────────────────────────

# __________               .__                   
# \______   \_____    _____|  |_________   ____  
#  |    |  _/\__  \  /  ___/  |  \_  __ \_/ ___\ 
#  |    |   \ / __ \_\___ \|   Y  \  | \/\  \___ 
#  |______  /(____  /____  >___|  /__|    \___  >
#         \/      \/     \/     \/            \/ 
# ----------------------------------
#
[[ -f ~/.bashrc ]] && source ~/.bashrc

# /Users/julien/.config/shell/src/zshrc/unified/400-plugins.zsh
# ──────────────────────────────────────────────────

# __________.__               .__               
# \______   \  |  __ __  ____ |__| ____   ______
#  |     ___/  | |  |  \/ ___\|  |/    \ /  ___/
#  |    |   |  |_|  |  / /_/  >  |   |  \\___ \ 
#  |____|   |____/____/\___  /|__|___|  /____  >
#                     /_____/         \/     \/ 
# ----------------------------------

# load plugins after bashrc
fpath=(~/.zsh/completion $fpath)

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


# /Users/julien/.config/shell/src/zshrc/linux/401-hacklas-plugins.zsh
# ──────────────────────────────────────────────────

#   ___ ___                __   .__                 
#  /   |   \_____    ____ |  | _|  | _____    ______
# /    ~    \__  \ _/ ___\|  |/ /  | \__  \  /  ___/
# \    Y    // __ \\  \___|    <|  |__/ __ \_\___ \ 
#  \___|_  /(____  /\___  >__|_ \____(____  /____  >
#        \/      \/     \/     \/         \/     \/ 
# ----------------------------------

h() {
    c=$1; shift
    bash "$HOME/.hacklas/scripts/${c}.sh" $@
}
_h_completions() {
    local scripts=($(/usr/bin/ls ~/.hacklas/scripts/*.sh | sed 's/.*\///;s/\.sh//'))
    compadd -V scripts $scripts
}
compdef _h_completions h

# /Users/julien/.config/shell/src/zshrc/unified/500-post-init.zsh
# ──────────────────────────────────────────────────

# __________               __            .__       .__  __   
# \______   \____  _______/  |_          |__| ____ |__|/  |_ 
#  |     ___/  _ \/  ___/\   __\  ______ |  |/    \|  \   __\
#  |    |  (  <_> )___ \  |  |   /_____/ |  |   |  \  ||  |  
#  |____|   \____/____  > |__|           |__|___|  /__||__|  
#                     \/                         \/          
# ----------------------------------

# Post init custom scripts
# PROMPT='[%F{cyan}%n%f@%F{cyan}%m%f %F{magenta}%1~%f]%# '

# Enable color if terminal supports it
if [[ -x /usr/bin/tput ]] && tput setaf 1 &>/dev/null; then
    if [[ ${EUID} == 0 ]]; then
        PROMPT='%F{red}┌─[%F{red}%Broot%b%F{yellow}@%F{cyan}%m%F{red}]─[%F{green}%~%F{red}]
└──╼ %F{yellow}#%f '
    else
        PROMPT='%F{magenta}┌─%(?..[%F{white}✗%F{magenta}]─)[%f%n%F{yellow}@%F{cyan}%m%F{magenta}]─[%F{green}%~%F{magenta}]
└──╼ %F{yellow}$%f '
    fi
else
    PROMPT='┌──[%n@%m]─[%~]
└──╼ %# '
fi

# reset overrides from atuin
# use arrow keys to got up and down in history
bindkey '^[[A' up-line-or-history
bindkey '^[[B' down-line-or-history

bindkey "^[[3~" delete-char
