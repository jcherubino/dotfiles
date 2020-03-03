# dotvim 
A repo to store .vim file for sharing across machines

# setup (vim)
- from the home directory run the command `git clone https://github.com/jcherubino/dotvim .vim` to clone the repo under the name `.vim`.
- In the home directory also create a file `.vimrc` containing the single line: `runtime vimrc` which calls the .vim vimrc.

- Also create the file `.inputrc` in the home directory containing the following lines (to enable and configure bash-vi mode):
```
set editing-mode vi
...
```
- Finally open vim and in normal mode run the command `:PlugInstall` to install all listed plugins
# setup (tmux)
- Install `tmux` and run the command `./.vim/tmux/link_conf_file.sh` to use the tmux conf file listed in the .vim directory

# setup (latex)
- Install LaTeX/pdflatex 
- On Linux, install the PDF editor zathura (or Skim if on OSX)


