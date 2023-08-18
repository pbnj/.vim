if exists('g:loaded_gh') | finish | endif
let g:loaded_gh = 1

" Custom Vim command for `gh` tool with completion for subcommand names
function! s:gh_completion(A,L,P) abort
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
				\ '--help',
				\ ],
				\ 'v:val =~ a:A' )
endfunction

command! -nargs=* -complete=customlist,s:gh_completion GH
			\ <mods> terminal gh <args>

" PR
function! s:gh_pr_completion(A,L,P) abort
	return filter(
				\ [
				\ 'create',
				\ 'list',
				\ 'status',
				\ 'checkout',
				\ 'checks',
				\ 'close',
				\ 'comment',
				\ 'diff',
				\ 'edit',
				\ 'lock',
				\ 'merge',
				\ 'ready',
				\ 'reopen',
				\ 'review',
				\ 'unlock',
				\ 'view',
				\ '-R', '--repo',
				\ '--help',
				\ ], 'v:val =~ a:A')
endfunction

command! -nargs=* -complete=customlist,s:gh_pr_completion GHPR
			\ <mods> terminal gh pr <args>

" RUN
function! s:gh_run_completion(A,L,P) abort
	return filter(
				\ [
				\ 'cancel',
				\ 'delete',
				\ 'download',
				\ 'list',
				\ 'rerun',
				\ 'view',
				\ 'watch',
				\ '-R', '--repo',
				\ '--help',
				\ ], 'v:val =~ a:A')
endfunction

command! -nargs=* -complete=customlist,s:gh_run_completion GHRun
			\ <mods> terminal gh run <args>

function! s:gh_run_view_completion(A,L,P) abort
	return filter(systemlist('gh run list --json=databaseId --jq .[].databaseId'), 'v:val =~ a:A')
endfunction

command! -nargs=* -complete=customlist,s:gh_run_view_completion GHRunView
			\ <mods> terminal gh run view <args>
command! -nargs=* -complete=customlist,s:gh_run_view_completion GHRunLog
			\ <mods> terminal gh run view --log <args>
command! -nargs=* GHRunWatch
			\ <mods> terminal gh run watch <args>
