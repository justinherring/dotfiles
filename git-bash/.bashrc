# TODO: make sure this works on all machines
export PATH="$HOME/scripts:$PATH"

# history settings
shopt -s histappend
shopt -s cmdhist

HISTSIZE=500000
HISTFILESIZE=1000000

HISTCONTROL="ignoreboth"
HISTTIMEFORMAT="%F %T "
export HISTIGNORE="&:[ ]*:exit:ls:history:clear"

# attempt to spell-check directories when cd-ing/auto-completing
shopt -s cdspell
shopt -s dirspell

# use ** to recursively list directories. end with / to only show directories
shopt -s globstar

# update window size after every command
shopt -s checkwinsize

# load aliases and functions
if [ -f ~/.bash_aliases ]; then
. ~/.bash_aliases
fi

if [ -f ~/.bash_functions ]; then
. ~/.bash_functions
fi

# source ~/scripts/autolaunchssh.sh

