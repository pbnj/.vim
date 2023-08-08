let &l:keywordprg = printf(':!ddgr %s', &l:filetype)

if exists('g:loaded_ale')
	" let b:ale_fixers = ['prettier']
	let b:ale_yaml_ls_config = { 'yaml': {
				\ 'completion': v:true,
				\ 'customTags': [],
				\ 'format': { 'enable': v:true },
				\ 'schemaStore': { 'enable': v:true },
				\ 'schemas': { 'https://json.schemastore.org/github-workflow-template-properties.json': ['/*']},
				\ 'validate': v:true
				\ } }

	function! ALEInstall() abort
		if executable('brew')
			! brew install yaml-language-server
		endif
	endfunction
	command! ALEInstall call ALEInstall()
endif

if exists('g:loaded_lsp')
	call LspAddServer([#{ name: 'yaml', filetype: ['yaml', 'yml'], path: 'yaml-language-server', args: ['--stdio'] }])
endif
