let &l:keywordprg = ':!ddgr docker-compose'

if exists('g:loaded_ale')
	function! ALEInstall() abort
		if executable('npm')
			! npm install -g @microsoft/compose-language-service
		endif
	endfunction
	command! ALEInstall call ALEInstall()
	call ale#linter#Define('docker-compose', {
				\ 'name': 'docker-compose-langserver',
				\ 'lsp': 'stdio',
				\ 'executable': 'docker-compose-langserver',
				\ 'command': '%e --stdio',
				\ 'project_root': { _ -> expand('%p:h') }
				\ })
endif

" if exists('g:loaded_lsp')
" 	call LspAddServer([#{name: 'dockerfile', filetype: ['Dockerfile'], path: 'docker-langserver', args: ['--stdio']}])
" endif
