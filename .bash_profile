export GIT_EDITOR="emacsclient -t"
export PATH="$HOME/bin:$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

psg(){
ps aux | grep "$@" | grep -v "$*"
}

hg () { history | grep "$@" | grep -v "$*" ; }

lg () { 
    if [ $# -gt 1 ]; then
	ls -a "$2" | grep "$1" ;
    else
	ls -a | grep "$@" ;
    fi }

= () { echo "$*" | bc -l; }

alias ta="tmux attach"
alias man="TERM=xterm LC_ALL= w3mman"
