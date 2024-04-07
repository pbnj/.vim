let &l:keywordprg = ':!ddgr rustlang'

function! CargoCompletion(A,L,P) abort
	return filter([
				\ 'build', 'b',
				\ 'check', 'c',
				\ 'clean',
				\ 'doc', 'd',
				\ 'new',
				\ 'init',
				\ 'add',
				\ 'remove',
				\ 'run', 'r',
				\ 'test', 't',
				\ 'bench',
				\ 'update',
				\ 'search',
				\ 'publish',
				\ 'install',
				\ 'uninstall',
				\ ], 'v:val =~ a:A')
endfunction
if exists(':Dispatch')
	command! -nargs=* -complete=customlist,CargoCompletion Cargo Dispatch cargo <args>
elseif exists(':terminal')
	command! -nargs=* -complete=customlist,CargoCompletion Cargo terminal cargo <args>
endif

command! -nargs=* Cadd Cargo add <args>
command! -nargs=* Cbench Cargo bench <args>
command! -nargs=* Cbuild Cargo build <args>
command! -nargs=* Ccheck Cargo check <args>
command! -nargs=* Cdoc Cargo doc <args>
command! -nargs=* Cfmt Cargo fmt <args>
command! -nargs=* Cremove Cargo remove <args>
command! -nargs=* Crun Cargo run <args>
command! -nargs=* Csearch Cargo search <args>
command! -nargs=* Ctest Cargo test <args>

nnoremap c<space> :Cargo<space>

if exists('g:loaded_ale')
	let b:ale_fixers = ['rustfmt']
	let b:ale_linters = ['cargo']

	function! ALEInstall() abort
		if executable('brew')
			! brew install rustfmt
		elseif executable('rustup')
			! rustup component add rustfmt
		else
			echoerr "brew or rustup not found. cannot install `rust-analyzer` and/or `rustfmt`"
		endif
	endfunction
	command! ALEInstall call ALEInstall()
endif
