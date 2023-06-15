if exists('g:loaded_aws')
	finish
endif
let g:loaded_aws = 1

" Custom command for `aws` with completion for profile names
function! AWSProfileCompletion(A,L,P) abort
	return filter(systemlist("awk -F '[][]' '{print $2}' ~/.aws/config | awk 'NF > 0 {print $2}'"),'v:val =~ a:A')
endfunction
command! -nargs=* -complete=customlist,AWSProfileCompletion AWS
			\ <mods> terminal aws --output text --profile <args>
command! -nargs=1 -complete=customlist,AWSProfileCompletion AWSConsole
			\ ! aws-console -p <args>
command! -nargs=1 -complete=customlist,AWSProfileCompletion AWSLogin
			\ ! aws sso login --profile <args>
