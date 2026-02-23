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
