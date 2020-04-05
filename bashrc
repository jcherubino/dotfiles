#set terminal text styling
orange=$(tput setaf 166);
yellow=$(tput setaf 228);
green=$(tput setaf 71);
white=$(tput setaf 15);
bold=$(tput bold);
reset=$(tput sgr0);

PS1="\[${bold}\]\n";
PS1+="\[${orange}\]\u";
#PS1+="\[${white}\] at ";
#PS1+="\[${yellow}\]\h";
PS1+="\[${white}\] in ";
PS1+="\[${green}\]\W";
PS1+="\n"
PS1+="\[${white}\]\$ \[${reset}\]";
export PS1

export EDITOR=vim

#OSX specific setup
if [ "$(uname -s)" == "Darwin" ]; then

    #VirtualBox stuff
    alias startvm="VBoxManage startvm 'ubuntu' --type headless"
    alias stopvm="VBoxManage controlvm 'ubuntu' poweroff --type headless"
    alias sshvm="ssh jcherubino@127.0.0.1 -p 2222"
    
    #Aliases for current unit folders and note folders
    alias notes="cd ~/Documents/notes"
    alias n2071="cd ~/Documents/notes/ECE2071"
    alias n3141="cd ~/Documents/notes/ECE3141"
    alias n2131="cd ~/Documents/notes/ECE2131"
    alias n2402="cd ~/Documents/notes/MEC2402"

    alias 2071="cd ~/Documents/ECE2071"
    alias 3141="cd ~/Documents/ECE3141"
    alias 2131="cd ~/Documents/ECE2131"
    alias 2402="cd ~/Documents/MEC2402"

    #aliases to edit rover repos
    alias rover="cd ~/Documents/novarover/rover"
    alias base="cd ~/Documents/novarover/base"
    alias common="cd ~/Documents/novarover/common"
    alias science="cd ~/Documents/novarover/science"
    alias pics="cd ~/Documents/novarover/pics"

    #to make launching skim at a certain pdf easier, use by skim <filename>
    alias skim="open -a 'skim'"

    #set alias for g++ and gcc compilers to use brew versions
    alias gcc="gcc-9"
    alias g++="g++-9"

    #For use in MPLAB/PIC programming
    export PATH="$PATH:"/Applications/microchip/xc16/v1.41/bin""

#Linux specific setup
elif [ "$(uname -s)" == "Linux" ]; then
    #source ROS stuff
    source /opt/ros/melodic/setup.bash
    source ~/catkin_ws/devel/setup.bash
    source ~/catkin_ws/src/common/setup/.bash_aliases
fi

