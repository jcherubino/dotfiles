if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

"Colorscheme"
Plug 'morhetz/gruvbox'

"Ultisnips snippet manager
Plug 'SirVer/ultisnips'

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<leader>z"
let g:UltiSnipsJumpBackwardTrigger="<leader>b"

"LaTeX plugins for using vim
Plug 'lervag/vimtex', { 'for': 'tex'}

if &filetype == 'tex'
    let g:tex_flavor='latex'
    if g:os == "Darwin"
        let g:vimtex_compiler_program = 'nvr'
        let g:vimtex_view_method ='skim'
    elseif g:os == "Linux"
        let g:vimtex_view_method = 'zathura'
    else
        echo "Unknown OS"
    endif
endif

"Tmux config
Plug 'christoomey/vim-tmux-navigator'

"vim chords
Plug 'kana/vim-arpeggio'

call plug#end()
