if exists('g:loaded_ale')
	let b:ale_linters = ['actionlint', 'yaml-language-server']
	let b:ale_yaml_ls_config = { 'yaml': {
				\ 'completion': v:true,
				\ 'customTags': [],
				\ 'format': { 'enable': v:true },
				\ 'schemaStore': { 'enable': v:true },
				\ 'schemas': { 'https://json.schemastore.org/github-workflow-template-properties.json': ['/*']},
				\ 'validate': v:true
				\ } }

	function! ALEInstall() abort
		if executable('go')
			! go install github.com/rhysd/actionlint/cmd/actionlint@latest
		endif
	endfunction
	command! ALEInstall call ALEInstall()

endif
