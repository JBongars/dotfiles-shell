#   ___ ___                __   .__                 
#  /   |   \_____    ____ |  | _|  | _____    ______
# /    ~    \__  \ _/ ___\|  |/ /  | \__  \  /  ___/
# \    Y    // __ \\  \___|    <|  |__/ __ \_\___ \ 
#  \___|_  /(____  /\___  >__|_ \____(____  /____  >
#        \/      \/     \/     \/         \/     \/ 
# ----------------------------------

function base64wrap(){
    echo "echo -n '$(base64 -w0)' | base64 -d | bash"
}

function urlencode(){
    python3 -c "import sys,urllib.parse;print(urllib.parse.quote(sys.stdin.read().strip(),safe=''))"
}

alias gtt="cd \"$(cat ~/.hacklas/.current-target)\""

# BLACKLISTED FUNCTIONS!

alias gobuster='echo "STOP USING GOBUSTER! Use the following:-

gobuster dir -w wordlist -u hostname
feroxbuster -w wordlist -u hostname

gobuster vhost -w wordlist -u hostname
ffuf -w wordlist -u hostname -H \"Host: FUZZ.hostname\"
"'

