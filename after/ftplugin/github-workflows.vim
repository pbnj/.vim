if exists('g:loaded_ale')

	function! ALEInstall() abort
		if executable('go')
			! go install github.com/rhysd/actionlint/cmd/actionlint@latest
		endif
	endfunction
	command! ALEInstall call ALEInstall()

endif
