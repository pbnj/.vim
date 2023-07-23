let b:ale_fixers = ['terraform', 'remove_trailing_lines', 'trim_whitespace']
let b:ale_linters = ['terraform', 'tflint', 'terraform_ls']

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

function! ALEInstall() abort
	let l:terraformls_version = '0.31.3'
	let l:uname_a = split(trim(system('uname -a')), ' ')
	let l:uname_os = l:uname_a[0]
	let l:uname_arch = l:uname_a[-1]
	let l:terraformls_url = 'https://releases.hashicorp.com/terraform-ls/' ..  l:terraformls_version .. '/terraform-ls_' .. l:terraformls_version .. '_' .. l:uname_os .. '_' .. l:uname_arch .. '.zip'
	if executable('brew')
		! brew install hashicorp/tap/terraform-ls tflint tfenv
	else
		! git clone --filter=blob:none --depth=1 https://github.com/tfutils/tfenv.git ~/.tfenv
		execute '! curl ' .. l:terraformls_url
		! curl https://raw.githubusercontent.com/terraform-linters/tflint/master/install_linux.sh | bash
	endif
endfunction
command! ALEInstall call ALEInstall()
