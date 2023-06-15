if exists('g:loaded_gitbrowse')
	finish
endif
let g:loaded_gitbrowse = 1

" GitBrowse takes a dictionary and opens files on remote git repo websites.
function! GitBrowse(args) abort
	let l:branch = len(a:args.branch) ? a:args.branch : 'origin'
	let l:remote = trim(system('git config branch.'..l:branch..'.remote'))
	let l:cmd = 'git browse ' .. ((a:args.range) ? printf("%s %s %s %s",l:remote, a:args.filename, a:args.line1, a:args.line2) : printf("%s %s", l:remote, a:args.filename))
	echom l:cmd
	execute 'silent ! '..l:cmd | redraw!
endfunction

" [G]it [B]rowse to launch repo, branch, & file in the browser
command! -range GB
			\ call GitBrowse({
			\   'branch': trim(system('git rev-parse --abbrev-ref HEAD 2>/dev/null')),
			\   'filename': trim(system('git ls-files --full-name ' .. expand('%'))),
			\   'range': <range>,
			\   'line1': <line1>,
			\   'line2': <line2>,
			\ })
command! GR execute 'lcd '..finddir('.git/..', expand('%:p:h')..';')
