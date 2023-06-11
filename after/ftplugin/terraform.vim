" TerraformStateCompletion provides terraform resource address suggestions to
" :TerraformStateShow command
function! TerraformStateCompletion(A,L,P) abort
	return filter(systemlist('terraform state list 2>/dev/null'),'v:val =~ a:A')
endfunction

command! -nargs=? -complete=customlist,TerraformStateCompletion TerraformStateShow <mods> terminal terraform state show <args>

function! ALEInstall() abort
	if executable('brew')
		! brew install hashicorp/tap/terraform hashicorp/tap/terraform-ls tflint
	elseif executable('apt')
		! git clone https://github.com/hashicorp/terraform.git && cd ./terraform && go install
		! git clone https://github.com/hashicorp/terraform-ls && cd ./terraform-ls && go install
		! curl -s https://raw.githubusercontent.com/terraform-linters/tflint/master/install_linux.sh | bash
	endif
endfunction
command! ALEInstall call ALEInstall()
