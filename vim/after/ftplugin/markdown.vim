"use markdown compiler file
compiler markdown

"define compiler mapping
nnoremap <buffer> <leader>c :silent make <bar> redraw!<CR>

"mapping to open skim
nnoremap <buffer> <leader>s : execute "! open -a 'skim' " expand("%:r") . ".pdf"<CR>

