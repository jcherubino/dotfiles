#!/usr/bin/env bash
#Script to symlink config files safely

#function to check if a file or directory exists or not
#returns 0 if it does and 1 if not
exists () {
    #check if first arg is -d
    if [ "$1" == "-d"] || [ "$1" == "--directory" ]; then
        flag="-d"
    else
        flag="-f"
    fi

    #Check in path exists  
    if [[ "$flag $1"]]; then
        return 0
    else
        return 1
    fi
}

usage () {
    echo "usage: link_conf_files [-d || --directory] source dest"
}

link_files () {
    ln -s $1 $2
}

main () {
    exists_flag=""
    #parse over all args containing -
    while [[ "$1" == *"-"* ]]; do
        case $1 in
            -d | --directory ) shift
                               exists_flag="-d"
                               ;;
            -h | --help ) shift
                          usage
                          exit
                          ;;
           * )            usage
                          exit 1
         esac
         shift
     done
    
    # set source and destination
    src=$1
    dest=$2

    #check source exists
    if [[ "$(exists $exists_flag $src)" == 1]]; then
        echo "$src does not exist, please create it." >&2
        return 1
    fi

    #check dest doesn't exist
    if [[ "$(exists $exists_flag $dest)" == 0]]; then
        echo "$dest already exists." >&2
        return 1
    fi

    link_files $src $dest
    #Check if symlink ran successfully
    if [ $? -eq 0 ]; then
        echo "$src symlinked with $dest"
        return 0
    else
        echo "Symlink not created" >&2
        return 1
    fi
}

exit "$(main $@)"

