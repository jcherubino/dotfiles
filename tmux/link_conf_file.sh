#!/usr/bin/env bash
#Script to symlink the tmux conf file into the home directory

#Variable set up
out_path="$HOME/.tmux.conf"
in_path="$HOME/.vim/tmux/tmux.conf"

#Check ~/.vim/tmux/tmux.conf exists & exit with message if it does not
if [ ! -f $in_path ]; then
    echo "File $in_path does not exist, please create this file" >&2
    exit 1
fi

#Check if ~/.tmux.conf exists as regular file & exit if it does
if [ -f $out_path ]; then
    echo "$out_path already exists." >&2
    exit 1
fi

#check if ~/.tmux.conf exists as symlink already
if [ -f $out_path ]; then
    echo "Symlink at $out_path already exists" >&2
    exit 1
fi

#symlink ~/.vim/tmux/tmux.conf to ~/.tmux.conf
ln -s $in_path $out_path

#Check if symlink ran successfully
if [ $? -eq 0 ]; then
    echo "$out_path symlinked with $in_path"
    exit 0
else
    echo "Symlink not created" >&2
    exit 1
fi
