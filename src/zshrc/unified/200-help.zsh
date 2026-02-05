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
