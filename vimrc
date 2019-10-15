"Set compatibility to ViM (not Vi)
set nocompatible

"Helps force plug-ins to load correctly when it is turned back on 
filetype off

"Enable syntax highlighting
syntax on

" So plug-ins load correctly
filetype plugin indent on

"Call the vimrc plug file to install all used plugins
 if filereadable(expand("~/.vim/plugins.vim"))
     source ~/.vim/plugins.vim
 endif

" COLORSCHEME
colorscheme gruvbox
"Set dark mode
set bg=dark

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
"automatic indenting for any filetype
set autoindent

" Display options
set showmode
set showcmd

"Highlight matching pairs of brackets
set matchpairs+=<:>

"show line numbers - relative for all lines except current line
set number
set relativenumber 

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
"Press enter when in search to remove all highlighting - Note that search is
"still active
nnoremap <CR> :nohlsearch<CR><CR>:<backspace>

"FILE FINDING
"Search down into subfolders. Provides tab-completion for file-related tasks
"set path+=**

"Display all matching files when tab completing
set wildmenu

"STATUS BAR
"Always display status bar
set laststatus=2

"Functions for getting git branch and repo name for statusline display
function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! GitRepoName()
    let l:name = system("basename -s .git `git config --get remote.origin.url`")
    " use indexes to strip ^@ characters from end of repo name
    return l:name[:-2] 
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  "If branch name is not empty then in a git repo
  if strlen(l:branchname)>0
      let l:reponame = GitRepoName()
      return join([l:reponame, l:branchname], ' : ')
  "Otherwise return an empty string
  else
      return ''
  endif
endfunction

"STATUS BAR
"Always display status bar
set laststatus=2

"Functions for getting git branch and repo name for statusline display
function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! GitRepoName()
    let l:name = system("basename -s .git `git config --get remote.origin.url`")
    " use indexes to strip ^@ characters from end of repo name
    return l:name[:-2] 
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  "If branch name is not empty then in a git repo
  if strlen(l:branchname)>0
      let l:reponame = GitRepoName()
      return join([l:reponame, l:branchname], ' : ') . ' '
  "Otherwise return an empty string
  else
      return ''
  endif
endfunction

"Configure status bar display
set statusline=
set statusline+=%#PmenuSel#
set statusline+=%{StatuslineGit()}
set statusline+=%#WarningMsg#
set statusline+=%m
set statusline+=%#Tooltip#
set statusline+=\ %f
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %l:%c
set statusline+=\ 
