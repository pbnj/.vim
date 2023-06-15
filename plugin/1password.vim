if exists('g:loaded_1password')
	finish
endif
let g:loaded_1password = 1

function! s:OPInstall() abort
	if executable('brew')
		terminal brew install 1password 1password-cli
	endif
endfunction
command! OPInstall call s:OPInstall()

" Custom cmmand for `op` (aka 1password cli) with completion for item names
function! OnePasswordItemCompletion(A,L,P) abort
	return filter(systemlist("op item list --format=json | jq -rc '.[].title'"), 'v:val =~ a:A')
endfunction
command! -nargs=* -complete=customlist,OnePasswordItemCompletion OP <mods> terminal op item get <q-args>
