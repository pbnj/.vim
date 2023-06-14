function! ALEInstall() abort
	if executable('brew')
		! brew install shfmt
		! brew install shellcheck
	elseif executable('go')
		! go install mvdan.cc/sh/v3/cmd/shfmt@latest
	endif
endfunction
command! ALEInstall call ALEInstall()
