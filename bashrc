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
    #For use in MPLAB/PIC programming
    export PATH="$PATH:"/Applications/microchip/xc16/v1.41/bin""

#Linux specific setup
elif [ "$(uname -s)" == "Linux" ]; then
    #source ROS stuff
    source /opt/ros/melodic/setup.bash
    source ~/catkin_ws/devel/setup.bash
    source ~/catkin_ws/src/common/setup/.bash_aliases
fi

#Source aliases

if [ -f "$HOME/.bash_aliases" ]; then
    source ~/.bash_aliases
fi

