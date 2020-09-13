if exists("current_compiler")
	finish
endif

let current_compiler = "markdown"

setlocal makeprg=pandoc\ -o\ %:r.pdf\ %
setlocal errorformat="%f",\ line\ %l:\ %m
