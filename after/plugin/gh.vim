if exists('g:loaded_gh')
	finish
endif
let g:loaded_gh = 1

" Custom Vim command for `gh` tool with completion for subcommand names
function! GHCompletion(A,L,P) abort
	return filter(
				\ [
				\ 'alias',
				\ 'api',
				\ 'auth',
				\ 'browse',
				\ 'codespace',
				\ 'config',
				\ 'extension',
				\ 'gist',
				\ 'gpg-key',
				\ 'issue',
				\ 'label',
				\ 'org',
				\ 'pr',
				\ 'project',
				\ 'release',
				\ 'repo',
				\ 'run',
				\ 'search',
				\ 'secret',
				\ 'ssh-key',
				\ 'status',
				\ 'variable',
				\ 'workflow',
				\ ],
				\ 'v:val =~ a:A' )
endfunction
command! -nargs=* -complete=customlist,GHCompletion GH
			\ <mods> terminal gh <args>
command! -nargs=* GHRunView
			\ <mods> terminal gh run view <args>
command! -nargs=* GHRunLog
			\ <mods> terminal gh run view --log <args>
command! -nargs=* GHRunWatch
			\ <mods> terminal gh run watch <args>
