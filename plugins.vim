if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

"Colorscheme"
Plug 'morhetz/gruvbox'

"Javascript and JSX syntax highlighting for react
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'

"Ultisnips snippet manager
Plug 'SirVer/ultisnips'

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<leader>z"
let g:UltiSnipsJumpBackwardTrigger="<leader>b"

"LaTeX plugins for using vim
Plug 'lervag/vimtex'
let g:tex_flavor='latex'
if g:os == "Darwin"
    let g:vimtex_view_general_viewer
                \ = '/Applications/Skim.app/Contents/SharedSupport/displayline'
elseif g:os == "Linux"
    let g:vimtex_view_general_viewer
                    \ = 'zathura'
else
    echo "Unknown OS"
endif

let g:vimtex_view_general_options = '-r @line @pdf @tex'
let g:vimtex_quickfix_mode=0

" This adds a callback hook that updates Skim after compilation
let g:vimtex_latexmk_callback_hooks = ['UpdateSkim']
function! UpdateSkim(status)
        if !a:status | return | endif

        let l:out = b:vimtex.out()
        let l:tex = expand('%:p')
        let l:cmd = [g:vimtex_view_general_viewer, '-r']
        if !empty(system('pgrep Skim'))
            call extend(l:cmd, ['-g'])
        endif
        if has('nvim')
            call jobstart(l:cmd + [line('.'), l:out, l:tex])
        elseif has('job')
            call job_start(l:cmd + [line('.'), l:out, l:tex])
        else
            call system(join(l:cmd + [line('.'), shellescape(l:out), shellescape(l:tex)], ' '))
        endif
endfunction

call plug#end()

