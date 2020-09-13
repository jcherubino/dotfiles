setlocal textwidth=0

"Function to compile markdown to pdf using pandoc and then redraw vim to fix black screen
"Caused by silent
function UpdateAndRedraw() 
    :write
    :silent execute "! pandoc -o PDFs/" . expand("%:r") . ".pdf" . " " . expand("%r")
    :redraw!
endfunction

nnoremap <localleader>c :call UpdateAndRedraw()<CR>
nnoremap <localleader>s : execute "! open -a 'skim' PDFs/" . expand("%:r") . ".pdf"<CR>
