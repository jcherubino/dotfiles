function CompileAndRedraw()
    :write
    :silent execute "! gcc -o " . expand("%:r") . " " . expand("%r")
    :redraw!
endfunction

nnoremap <localleader>c :call CompileAndRedraw()<CR>
