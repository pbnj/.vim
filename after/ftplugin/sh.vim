let &l:keywordprg = ':!ddgr shell'
let &l:formatprg = 'shfmt'

let b:ale_fixers = ['shfmt']

if exists('g:loaded_ale')
	function! ALEInstall() abort
		if executable('brew')
			! brew install shfmt
			! brew install shellcheck
		elseif executable('go')
			! go install mvdan.cc/sh/v3/cmd/shfmt@latest
		else
			echoerr "brew or go not found. cannot install `shfmt` and/or `shellcheck`"
		endif
	endfunction
	command! ALEInstall call ALEInstall()
endif
