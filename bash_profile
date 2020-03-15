#EXPORTS
export PS1="\[\033[36m\]\u\[\033[m\]🤟\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\] \$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
export TIBCO_HOME='/opt/tibco/home'

#ALIASES
alias ls='ls -GFh'
alias ll='ls -als'
alias cls='clear'
alias pstibco='ps -ef | grep tibco'
alias nc='nc -zv'
alias vpn='/opt/cisco/anyconnect/bin/vpn.sh'
alias bwhome='pushd /opt/tibco/home/BW642/bw/6.4'
alias bwscripts='pushd /opt/tibco/script'
alias tea='/opt/tibco/script/tea'
alias ems='/opt/tibco/script/ems'
alias bwagent='/opt/tibco/script/bwagent'
alias startAll='/opt/tibco/script/startAll.sh'
alias statusAll='/opt/tibco/script/statusAll.sh'
alias stopAll='/opt/tibco/script/stopAll.sh'
alias lsof='lsof -n -i :\$1 | grep LISTEN'
