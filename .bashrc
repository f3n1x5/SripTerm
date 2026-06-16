shopt -s autocd no_empty_cmd_completion

export EDITOR='nano -xiemSZT2'

alias l='ls -t'
alias ll='l -gGh'
alias la='l -A'
alias lla='ll -A'
alias cp='cp -rv'
alias mv='mv -v'
alias rm='rm -rv'
alias md='mkdir -p'
alias nano="$EDITOR"
alias n=nano
alias grep='grep --color'
alias hg='history|grep'
alias cm='sudo bash ~/.scripts/cmgr'

t() (cd "${1:-.}" 2>/dev/null && find -printf '%p\n' 2>/dev/null|sed 's@[^/]*/@| @g')
e() { n $EPOCHSECONDS.${1:-txt}; }

export EDITOR=nano
HISTSIZE=5000
HISTFILESIZE=5000
HISTCONTROL=ignoreboth:erasedups

rl(){ bind "set $1 ${2:-on}";}
for _i in colored-completion-prefix colored-stats history-preserve-point mark-symlinked-directories menu-complete-display-prefix revert-all-at-newline show-all-if-ambiguous show-all-if-unmodified skip-completed-text; do rl $_i; done
unset _i
rl bell-style none
rl page-completions off
bind -x '"\C-l": builtin printf "\e[H\e[2J\e[3J"'
bind '"\t": menu-complete'
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
eval "$(dircolors -b)"

PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"

PS1='\n\[\e[m\e]2;\w\a\e[1;33m\]\W:\j::$?\[\e[m\]\n\$ '
