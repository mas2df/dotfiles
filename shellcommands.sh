#!/bin/bash

# Make a directory and cd into it
mkcd () {
	mkdir -p "$*"
	cd "$*"
}

# Grep history
ghistory () {
	history | egrep -i "$*"
}

# Grep processes
pgrep () {
	ps aux | egrep -i "$*"
}

# Grep find for all files in directory 
gfind () {
    find . | egrep -i "$*"
}

# Name the current tab
function nametab {
    echo -ne "\033]0;"$*"\007"
    unset PROMPT_COMMAND
}

function myip {
    #ifconfig | grep "inet " | grep -v "127.0.0.1"
    ifconfig en0 | grep inet | grep -v inet6
}

function prepend_to_file {
    echo "$1" | cat - $2 > temp && mv temp $2
}

function pip_package_download {
    if [ -z "$1" ]
    then
        echo "Pass in the name of the pip package and version to download"
        echo "    $ pip_package_download.sh rawes==0.5.5"
        exit 0
    fi
                                              
    DOWNLOAD_DIR=./pip_download
    mkdir $DOWNLOAD_DIR
    cd $DOWNLOAD_DIR
    pip install -IV $1 --download-cache .

    # Rename files
    rm *.whl
    rm *type
    for file in *.gz
    do
        # finds last instance of %2F
        echo "${file##*%2F}"
        mv "$file" "${file##*%2F}"
    done
}

function killGrep {
    ps aux | grep -ie $1 | awk '{print $2}' | xargs kill -9 
}

# Searches for a file name for all jars in a directory
function findInJars {
  find "$1" -name "*.jar" -a -exec bash -c "jar tvf {} | grep $2" \; -print
}

# Makes a git ignore file: https://www.gitignore.io/docs
#function gi() { curl http://www.gitignore.io/api/$@ ;}
function gi() { curl -s https://www.gitignore.io/api/$@ ;}
