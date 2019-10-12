"Call the vimrc plug file to install all used plugins
 if filereadable(expand("~/.vim/plugins"))
     source ~/.vim/plugins
 endif

"Set compatibility to ViM (not Vi)
set nocompatible

"Helps force plug-ins to load correctly when it is turned back on 
filetype off

"Enable syntax highlighting
syntax on

" So plug-ins load correctly
filetype plugin indent on

"Automatically wrap text that extends beyond screen length
set wrap

"Set maximum column length to 80 characters
set textwidth=80

"Format tabs correctly
"show existing tab with 4 spaces width
set tabstop=4
"when indenting with '>', use 4 spaces width
set shiftwidth=4
"On pressing tab, insert 4 spaces
set expandtab

"Show status bar
set laststatus=2

" Display options
set showmode
set showcmd

"Highlight matching pairs of brackets
set matchpairs+=<:>

"show line numbers
set number

" Encoding
set encoding=utf-8

"SEARCHING
"Highlight search matches
set hlsearch
"Enable incremental search
set incsearch
" Include matching uppercase words with lowercase search term
set ignorecase
"Include only uppercase words with uppercase search term
set smartcase
