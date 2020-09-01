"Set compatibility to Vim (not VI)
set nocompatible

"Helps force plug-ins to load correctly when it is turned back on 
filetype off

"Enable syntax highlighting
syntax on

" So plug-ins load correctly
filetype plugin indent on

let mapleader =";"
let maplocalleader = "\\"

"Set global OS in g:os variable
let g:os = substitute(system('uname'), '\n', '', '')

"Call the vimrc plug file to install all used plugins
 if filereadable(expand("~/.config/nvim/plugins.vim"))
     source ~/.config/nvim/plugins.vim
 endif

" COLORSCHEME
colorscheme gruvbox
"Set dark mode
set bg=dark

"Splits open at bottom and right 
set splitbelow 
set splitright

"shortcut split navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"Set maximum column length to unlimited characters
set textwidth=0
"Set column to mark max ideal linewidth of 80
set colorcolumn=80

"Turn on spell checking
setlocal spell spelllang=en_au
"Customise incorrect spelling appearance
hi SpellBad ctermfg=001 cterm=bold,underline

"Fix delay in pressing <Esc> to exit
set timeoutlen=1000 ttimeoutlen=0


"Disable automatic nextline commenting
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
"Format tabs correctly
"show existing tab with 4 spaces width
set tabstop=4
"when indenting with '>', use 4 spaces width
set shiftwidth=4
"On pressing tab, insert 4 spaces
set expandtab
"automatic indenting for any filetype
set autoindent

"Fix backspacing
set backspace=indent,eol,start

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

"Folding
set foldmethod=manual

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
nnoremap <CR> :nohlsearch<CR>:<backspace>

"FILE FINDING
"Search down into subfolders. Provides tab-completion for file-related tasks
set path+=**

"Display all matching files when tab completing
set wildmenu

"STATUS BAR
"Always display status bar
set laststatus=2

"Functions for getting git branch and repo name for statusline display
function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

"Due to slow performance function is not being used - needs to smartly store
"name 
"function! GitRepoName()
"    let l:name = system("basename -s .git `git config --get remote.origin.url`")
"    " use indexes to strip ^@ characters from end of repo name
"    return l:name[:-2] 
"endfunction
"
"function! HasUncommitedChanges()
"    let l:status = system("git status --porcelain --untracked-files=no")
"    if len(l:status) > 0
"        return '!'
"    else
"        return ''
"    endif
"endfunction
"
"function! StatuslineGit()
"  let l:branchname = GitBranch()
"  "If branch name is not empty then in a git repo
"  if strlen(l:branchname)>0
"      "let l:repo = GitRepoName()
"      let l:status = HasUncommitedChanges()
"      if l:status == '!'
"          return join([l:branchname, l:status], ' : ') . ' '
"      else
"          return  ' ' . l:branchname . ' '
"      endif
"  else
"      return ''
"  endif
"endfunction

"If the relative path to the file name exceeds 20 characters, then function will just
"return a string of the function name for use in the statusline
function! SetFilePathDisplay()
    if strlen(expand('%:~')) > 20
        return expand('%')
    else
        return expand('%:~')
    endif
endfunction

"Configure status bar display
set statusline=
"Blue highlighting style
set statusline+=%#PmenuSel#
"Display status line in format reponame : branchname : ! if changes need
"committing
"set statusline+=%{StatuslineGit()}
"Show [+] in red text if changes to file have been made
set statusline+=%#WarningMsg#
set statusline+=%m
"Display path to file
set statusline+=%#Tooltip#
set statusline+=%f
"Right align text
set statusline+=%=
set statusline+=%#CursorColumn#
"Display filetype
set statusline+=\ %y
"Display file encoding
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
"Display line and column numbers
set statusline+=\ %l:%c
set statusline+=\ 

"Chords setup
call arpeggio#load()
"Chords mappings
"map jk to exit insert mode
Arpeggio inoremap jk <Esc>
"map jk to exit visual mode
Arpeggio vnoremap jk <Esc>
"ps in normal mode to paste from system keyboard
Arpeggio nnoremap ps "+p

"General mappings
"Capitalise current word
inoremap <leader>u <esc> viwUi
nnoremap <leader>u viwU
"Edit vimrc
nnoremap <leader>ev :vsplit ~/.config/nvim/init.vim<cr>
nnoremap <leader>sv :source ~/.config/nvim/init.vim<cr>

"yank to system clipboard
nnoremap <leader>ys "+y

"Abbreivations
"email
iabbrev @@ josh.cherubino@gmail.com

"Autocommands

"Python autocommands
augroup filetype_python
    autocmd!
    autocmd FileType python nnoremap <buffer> <localleader>c I#<esc>
augroup end

"Makefile autocommands
augroup filetype_make
    autocmd!
    "Use actual tab characters in makefiles
    autocmd Filetype make set noexpandtab
augroup end

"Joint cpp and c autocommands
augroup filetype_compiled
    autocmd!
    "compile files with a makefile 
    autocmd Filetype cpp,c nnoremap <localleader>c :write<CR>:silent make<CR>:redraw!<CR>
    autocmd QuickFixCmdPost * :copen
    "Clean files
    autocmd Filetype cpp,c nnoremap <localleader>e :silent make clean<CR>:redraw!<CR>
augroup end

"auto save and autoload folds
augroup AutoSaveFolds
  autocmd!
  " view files are about 500 bytes
  " bufleave but not bufwinleave captures closing 2nd tab
  " nested is needed by bufwrite* (if triggered via other autocmd)
  autocmd BufWinLeave,BufLeave,BufWritePost ?* nested silent! mkview!
  autocmd BufWinEnter ?* silent! loadview
augroup end

