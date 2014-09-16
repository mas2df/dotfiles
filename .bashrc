# Regular Colors (https://wiki.archlinux.org/index.php/Color_Bash_Prompt)
BLACK='\e[0;30m'        # Black
RED='\e[0;31m'          # Red
GREEN='\e[0;32m'        # Green
YELLOW='\e[0;33m'       # Yellow
BLUE='\e[0;34m'         # Blue
PURPLE='\e[0;35m'       # Purple
CYAN='\e[0;36m'         # Cyan
WHITE='\e[0;37m'        # White

# Variables for $PATH
export GROOVY_HOME=/Users/michaelsantamaria/src/groovy-2.3.6

PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/sbin
PATH=$PATH:~/src/depot_tools:$GROOVY_HOME/bin
export PATH

# Add git branch to prompt
source ~/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true

# Bash prompt
export PS1="\n\[$CYAN\]\t \[$GREEN\]\u@\h \[$YELLOW\]\w\[\033[m\]\[$PURPLE\]\$(__git_ps1)\[$WHITE\]\n\$ "

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export EDITOR=/Applications/Sublime\ Text\ 2.app/
export PROMPT_COMMAND='history -a; echo -ne "\033]0;${PWD/#$HOME/~}\007"' # change tab name to current directory

# AWS settings
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.7.0_51.jdk/Contents/Home"
export EC2_HOME="/Users/michaelsantamaria/src/ec2-api-tools-1.7.1.0"
export PATH=$PATH:$EC2_HOME/bin 

export CFLAGS=-Qunused-arguments export CPPFLAGS=-Qunused-arguments
export M2_HOME=/usr/local/apache-maven/apache-maven-3.0.4
export M2=$M2_HOME/bin
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/src
source /usr/local/bin/virtualenvwrapper.sh

export GREP_COLOR='1;37;41'    # foreground is red by default, this changes it to red background with white text
alias grep='grep --color=auto'
alias l='ls -lF'
alias ll='ls -alFh'
alias lt='ls -latrh'
alias mysql=/usr/local/mysql-5.5.20-osx10.6-x86_64/bin/mysql
alias mysqladmin=/usr/local/mysql-5.5.20-osx10.6-x86_64/bin/mysqladmin
alias vagrnat=vagrant
alias histroy=history
alias status="git status"

# Memory usage debugging
alias memtop='ps -eo pmem,pcpu,rss,vsize,args | sort -k 1 -r | more'
 
set completion-ignore-case On

# history http://blog.sanctum.geek.nz/better-bash-history/
shopt -s histappend
export HISTTIMEFORMAT='%Y-%m-%d %H:%M - '
HISTSIZE=100000
HISTFILESIZE=100000
HISTCONTROL=ignoreboth
HISTIGNORE='ls:bg:fg:history'
shopt -s cmdhist

# location shortcuts
alias gosrc='cd ~/src; pwd;'
alias godesktop='cd ~/Desktop; pwd;'
alias editbashrc='vi ~/.bashrc'
alias sourcebashrc='source ~/.bash_profile'
alias editsshconfig='vi ~/.ssh/config'
alias catsshconfig='cat ~/.ssh/config'
alias gonas='cd /Volumes/Public/Projects/; pwd;'
alias gosocbrowser='cd ~/src/hg_soc_browser; pwd;'
alias gosocbrowservagrant='cd ~/src/hg_soc_browser; pwd; vagrant ssh;'
alias gogaz='cd ~/src/gaz; pwd;'
alias gotiger='cd ~/src/tiger; pwd;'
alias goezcentos='cd ~/src/ezcentos; pwd;'
alias gomineshaft='cd ~/src/mineshaft-services; pwd;'
alias gocanary='cd ~/src/canary; pwd;'

# Titan Graph DB
export TITAN_HOME="~/src/titan-server-0.4.4"
alias wipetitan="$TITAN_HOME/bin/titan.sh stop;$TITAN_HOME/bin/titan.sh clean;i$TITAN_HOME/bin/titan.sh start;"
