function! ALEInstall() abort
	if executable('python3')
		! python3 -m pip install -U isor black mypy
	endif
endfunction
command! ALEInstall call ALEInstall()
