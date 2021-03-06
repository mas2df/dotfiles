# If not running interactively, don't do anything
[ -z "$PS1" ] && return

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
export EC2_HOME="/Users/michaelsantamaria/src/ec2-api-tools-1.7.1.0"
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export EDITOR=/Applications/Sublime\ Text\ 2.app/
export PROMPT_COMMAND='history -a; echo -ne "\033]0;${PWD/#$HOME/~}\007"' # change tab name to current directory
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.7.0_51.jdk/Contents/Home"
export EC2_HOME="/Users/michaelsantamaria/src/ec2-api-tools-1.7.1.0"
export CFLAGS=-Qunused-arguments export CPPFLAGS=-Qunused-arguments
export M2_HOME=/usr/local/apache-maven/apache-maven-3.0.4
export M2=$M2_HOME/bin
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/src
export GREP_COLOR='1;37;41'    # foreground is red by default, this changes it to red background with white text
export TITAN_HOME="~/src/titan-server-0.4.4"


# Set up PATH
PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/sbin
PATH=$PATH:~/src/depot_tools
PATH=$PATH:$GROOVY_HOME/bin
PATH=$PATH:$EC2_HOME/bin 
export PATH

# Add git branch to prompt
source ~/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true

# Bash prompt
export PS1="\n\[$CYAN\]\t \[$GREEN\]\u@\h \[$YELLOW\]\w\[\033[m\]\[$PURPLE\]\$(__git_ps1)\[$WHITE\]\n\$ "

set completion-ignore-case On

# history http://blog.sanctum.geek.nz/better-bash-history/
shopt -s histappend
export HISTTIMEFORMAT='%Y-%m-%d %H:%M - '
HISTSIZE=100000
HISTFILESIZE=100000
HISTCONTROL=ignoreboth
HISTIGNORE='ls:bg:fg:history'
shopt -s cmdhist

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Virtual Env Wrapper
VENV_WRAPPER_FILE=/usr/local/bin/virtualenvwrapper.sh
if [ -f $VENV_WRAPPER_FILE ]; then
    source $VENV_WRAPPER_FILE
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# Alias definitions
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Shell commands
if [ -f ~/.bash_commands ]; then
    source ~/.bash_commands
fi
