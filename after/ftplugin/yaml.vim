let &l:keywordprg = printf(':!ddgr %s', &l:filetype)

let b:ale_fixers = ['prettier']
let b:ale_yaml_ls_config = {'yaml': {'schemaStore': { 'enable': v:true }, 'completion': v:true } }

function! ALEInstall() abort
	if executable('brew')
		! brew install yaml-language-server
	endif
endfunction
command! ALEInstall call ALEInstall()
