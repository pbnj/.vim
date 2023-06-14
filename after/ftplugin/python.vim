function! ALEInstall() abort
	if executable('python3')
		! python3 -m pip install -U isort black mypy
	endif
endfunction
command! ALEInstall call ALEInstall()
