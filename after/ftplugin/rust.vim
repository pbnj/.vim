let b:ale_fixers = ['rustfmt']
let b:ale_linters = ['cargo', 'analyzer']

function! ALEInstall() abort
	if executable('brew')
		! brew install rust-analyzer rustfmt
	elseif executable('rustup')
		! rustup component add rust-analyzer rustfmt
	else
		echoerr "brew or rustup not found. cannot install `rust-analyzer` and/or `rustfmt`"
	endif
endfunction
command! ALEInstall call ALEInstall()
