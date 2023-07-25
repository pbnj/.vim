let &statusline = '%f %m%r%h%w%y%q'

if exists('g:loaded_fugitive')
	let &statusline ..= ' %{FugitiveStatusline()}'
endif

let &statusline ..= ' %#Error#%{len(getloclist(winnr())) > 0 ? len(getloclist(winnr())) : ""}%*'
