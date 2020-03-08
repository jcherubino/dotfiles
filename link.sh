#!/usr/bin/env bash
#Script to symlink config files safely

link () {
    #Check in path exists & exit with message if it does not
    if [ ! -f $1 ] || [ ! -d $1]; then
        echo "$1 does not exist, please create it." >&2
        return 1
    fi

    #Check if outpath  exists as regular file or directory & exit if it does
    if [ -f $2 ] || [ -d $2 ]; then
        echo "$2 already exists." >&2
        return 1
    fi

    #symlink in path and out path
    ln -s $1 $2

    #Check if symlink ran successfully
    if [ $? -eq 0 ]; then
        echo "$2 symlinked with $1"
        return 0
    else
        echo "Symlink not created" >&2
        return 1
    fi
}
