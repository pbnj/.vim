augroup vimrc
	autocmd!
	autocmd BufRead,BufNewFile */security-terraform/* setlocal path+=terraform/**
augroup END
