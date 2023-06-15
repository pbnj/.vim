if exists('g:loaded_jira')
	finish
endif
let g:loaded_jira = 1

function! s:JiraInstall() abort
	if executable('brew')
		terminal brew install ankitpokhrel/jira-cli/jira-cli
	endif
endfunction

command! JiraInstall call s:JiraInstall()
command! -nargs=? Jira ! jira <args>
