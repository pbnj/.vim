call ale#linter#Define('docker-compose', {
			\ 'name': 'docker-compose-langserver',
			\ 'lsp': 'stdio',
			\ 'executable': 'docker-compose-langserver',
			\ 'command': '%e --stdio',
			\ 'project_root': { _ -> expand('%p:h') }
			\ })

function! ALEInstall() abort
	if executable('npm')
		! npm install -g dockerfile-language-server-nodejs
		! npm install -g @microsoft/compose-language-service
	endif
endfunction
command! ALEInstall call ALEInstall()
