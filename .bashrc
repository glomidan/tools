#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# alias
alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -la'
mkcd () { mkdir -vp "$@" && cd "$@"; }

PS1="\u@\h[\W]\$ "

# terminal size
term_size 15

# POSTGRES VAR
export PGDATA="$HOME/postgres_data"
export PGHOST="/tmp"
export PGDATA="$HOME/postgres_data"
export PGHOST="/tmp"
