let &l:keywordprg = printf(':!ddgr %s', &l:filetype)

let b:ale_fixers = ['terraform', 'remove_trailing_lines', 'trim_whitespace']
let b:ale_linters = ['terraform', 'tflint', 'terraform_ls', 'snyk']

function! TFenvCompletion(A,L,P) abort
	return filter([
				\ 'install',
				\ 'use',
				\ 'uninstall',
				\ 'list',
				\ 'list-remote',
				\ 'version-name',
				\ 'init',
				\ 'pin',
				\ ], 'v:val =~ a:A')
endfunction
command! -nargs=? -complete=customlist,TFenvCompletion TFenv ! tfenv <args>

" TerraformStateCompletion provides terraform resource address suggestions to
" :TerraformStateShow command
function! TerraformStateCompletion(A,L,P) abort
	return filter(systemlist('terraform state list 2>/dev/null'),'v:val =~ a:A')
endfunction
command! -nargs=? -complete=customlist,TerraformStateCompletion TerraformStateShow <mods> terminal terraform state show <args>

if exists('g:loaded_ale')
	function! ALEInstall() abort
		if executable('brew')
			! brew install hashicorp/tap/terraform-ls tflint tfenv
		else
			let l:os = trim(system('uname -s | tr "[:upper:]" "[:lower:]"'))
			let l:arch = trim(system('uname -m | tr "[:upper:]" "[:lower:]"'))
			let l:terraformls_version = trim(system('basename "$(curl -Ls -o /dev/null -w %\{url_effective\} https://github.com/hashicorp/terraform-ls/releases/latest)"'))
			let l:terraformls_shortversion = substitute(l:terraformls_version, 'v', '', '')
			let l:terraformls_filename = 'terraformls_'..l:terraformls_shortversion
			let l:terraformls_url = printf('https://releases.hashicorp.com/terraform-ls/%s/%s_%s_%%s.zip', l:terraformls_shortversion, l:terraformls_filename, l:os, l:arch)
			execute '! curl -L --progress-bar ' .. l:terraformls_url .. ' -o ' .. l:terraformls_filename .. ' && unzip ' .. l:terraformls_filename .. ' && rm ' .. l:terraformls_filename
			! git clone --filter=blob:none --depth=1 https://github.com/tfutils/tfenv.git ~/.tfenv
			! curl https://raw.githubusercontent.com/terraform-linters/tflint/master/install_linux.sh | bash
		endif
	endfunction
	command! ALEInstall call ALEInstall()
endif
