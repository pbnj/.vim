let &l:keywordprg = printf(':!ddgr %s', &l:filetype)

let b:ale_fixers = ['prettier']
let b:ale_yaml_ls_config = {'yaml': {'schemaStore': { 'enable': v:true }, 'completion': v:true } }

if exists('g:loaded_ale')
	function! ALEInstall() abort
		if executable('brew')
			! brew install yaml-language-server
		endif
	endfunction
	command! ALEInstall call ALEInstall()
endif

if exists('g:loaded_lsp')
	call LspAddServer([#{ name: 'yaml', filetype: ['yaml', 'yml'], path: 'yaml-language-server', args: ['--stdio'], }])
endif
