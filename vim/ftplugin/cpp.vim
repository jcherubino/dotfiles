function! CompileAndRedraw()
    :write
    :silent execute "! g++ -o " . expand("%:r") . " " . expand("%r")
    :redraw!
endfunction

nnoremap <localleader>c :call CompileAndRedraw()<CR>
