let &l:keywordprg = printf(':!ddgr %s', &l:filetype)

if exists('g:loaded_ale')
	let b:ale_yaml_ls_config = { 'yaml': {
			\ 'completion': v:true,
			\ 'customTags': [],
			\ 'format': { 'enable': v:true },
			\ 'hover': v:true,
			\ 'schemaStore': { 'enable': v:true },
			\ 'schemas': {},
			\ 'validate': v:true,
			\ } }

	function! ALEInstall() abort
		if executable('brew')
			! brew install yaml-language-server
		endif
	endfunction
	command! ALEInstall call ALEInstall()

endif
