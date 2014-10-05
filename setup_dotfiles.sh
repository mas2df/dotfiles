# Capture current date for backups
CURR_DATE=`date +%Y%m%d`
BAK="_bak_"

DOTFILES_LIST=(".bash_profile" ".bashrc" ".bash_aliases" ".bash_commands" ".vimrc" "git-prompt.sh")

for dotfile in ${DOTFILES_LIST[@]}; do
    echo -e "\nProcessing $dotfile:"

    BACKUP_FILENAME=$dotfile$BAK$CURR_DATE

    # Check if file is symbolic link and make backups
    if [ -L ~/$dotfile ]
    then 
        #echo "~/$dotfile is a symlink"
        dest=$(readlink ~/$dotfile)
        echo "copying $dest to ~/$BACKUP_FILENAME..."
        cp $dest ~/$BACKUP_FILENAME
    else 
        if [ -f ~/$dotfile ]
        then
            echo "Copying ~/$dotfile to ~/$BACKUP_FILENAME..."
            cp ~/$dotfile ~/$BACKUP_FILENAME
        fi
    fi

    # Create symlink
    rm ~/$dotfile
    ln -s ~/src/dotfiles/$dotfile ~/$dotfile
done
