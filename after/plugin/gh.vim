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

" REPO
function! s:gh_repo_list_cache(org) abort
	let l:cmd = 'gh repo list --no-archived --limit 1000 --json nameWithOwner --jq .[].nameWithOwner ' . a:org
	let l:cache_file = '/tmp/gh_repo_list_' . a:org
	call system(l:cmd . ' > ' . l:cache_file)
endfunction

function! s:gh_repo_clone_completion(A,L,P) abort
	let l:org = trim(system('gh org list | awk ''{print $1}'''))
	if stridx(a:A, '/') >= 0
		let l:org = split(a:A, '/')[0]
	endif
	let l:cache_file = '/tmp/gh_repo_list_' . l:org
	if !filereadable(l:cache_file)
		call s:gh_repo_list_cache(l:org)
	endif
	let l:gh_repo_list = readfile(l:cache_file)
	return filter(l:gh_repo_list, 'v:val =~ a:A')
endfunction

command! -nargs=* -complete=customlist,s:gh_repo_clone_completion GHRepoClone
			\ exe printf('<mods> terminal gh repo clone <args> %s', expand('~/Projects/github.com/<args>'))

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
