set &l:keywordprg = ':!cargo doc --open'

function! ALEInstall() abort
	if executable('brew')
		! brew install rust-analyzer rustfmt
	elseif executable('rustup')
		! rustup component add rust-analyzer rustfmt
	endif
endfunction
command! ALEInstall call ALEInstall()
