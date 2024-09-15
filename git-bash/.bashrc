
# TODO: make sure this works on all machines
export PATH="$HOME/scripts:$PATH"

HISTTIMEFORMAT="%F %T "

if [ -f ~/.bash_aliases ]; then
. ~/.bash_aliases
fi

if [ -f ~/.bash_functions ]; then
. ~/.bash_functions
fi

