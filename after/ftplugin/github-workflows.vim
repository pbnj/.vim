if exists('g:loaded_ale')
	let b:ale_linters = ['actionlint', 'yamllint']

	function! ALEInstall() abort
		if executable('go')
			! go install github.com/rhysd/actionlint/cmd/actionlint@latest
		endif
	endfunction
	command! ALEInstall call ALEInstall()

endif
