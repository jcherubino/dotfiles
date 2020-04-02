"Mapping to save and compile program with the executable being written as the file minus the extension
nnoremap <localleader>c : write <CR> :execute "!  clear && gcc -o " . expand("%:r") . " " . expand("%r")<CR>
