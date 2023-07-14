let b:ale_fixers = ['ruff']

function! ALEInstall() abort
	if executable('brew')
		! brew install mypy ruff
	elseif executable('python3')
		! python3 -m pip install -U mypy ruff
	else
		echoerr "brew and python3 not found. cannot install `mypy` and/or `ruff`"
	endif
endfunction
command! ALEInstall call ALEInstall()
