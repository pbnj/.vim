let &l:keywordprg = printf(':!ddgr %s', &filetype)

if exists('g:loaded_ale')
	function! ALEInstall() abort
		if executable('npm')
			! npm install -g dockerfile-language-server-nodejs
			! npm install -g @microsoft/compose-language-service
		endif
	endfunction
	command! ALEInstall call ALEInstall()
	call ale#linter#Define('dockerfile', {
				\ 'name': 'docker-language-server',
				\ 'lsp': 'stdio',
				\ 'executable': 'docker-langserver',
				\ 'command': '%e --stdio',
				\ 'language': 'dockerfile',
				\ 'project_root': { _ -> expand('%p:h') }
				\ })

endif

if exists('g:loaded_lsp')
	call LspAddServer([#{name: 'dockerfile', filetype: ['Dockerfile'], path: 'docker-langserver', args: ['--stdio']}])
endif
