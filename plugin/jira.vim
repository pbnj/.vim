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

function! JiraCompletion(A,L,P) abort
	return filter(
				\ [
				\ 'board',
				\ 'epic',
				\ 'issue',
				\ 'open',
				\ 'project',
				\ 'sprint',
				\ 'completion',
				\ 'help',
				\ 'init',
				\ 'man',
				\ 'me',
				\ 'serverinfo',
				\ 'version',
				\ '-c', '--config',
				\ '--debug',
				\ '-h', '--help',
				\ '-p', '--project',
				\ ], 'v:val =~ a:A'
				\ )
endfunction

command! -nargs=? -complete=customlist,JiraCompletion Jira
			\ <mods> terminal jira <args>

function! JiraIssueList(A,L,P) abort
	return filter(
				\ [
				\ '-t', '--type',
				\ '-R', '--resolution',
				\ '-s', '--status',
				\ '-y', '--priority',
				\ '-r', '--reporter',
				\ '-a', '--assignee',
				\ '-C', '--component',
				\ '-l', '--label',
				\ '-P', '--parent',
				\ '--history',
				\ '-w', '--watching',
				\ '--created',
				\ '--updated',
				\ '--created-after',
				\ '--updated-after',
				\ '--created-before',
				\ '--updated-before',
				\ '-q', '--jql',
				\ '--order-by',
				\ '--reverse',
				\ '--paginate',
				\ '--plain',
				\ '--no-headers',
				\ '--no-truncate',
				\ '--columns',
				\ '--fixed-columns',
				\ '-h', '--help',
				\ '-c', '--config',
				\ '--debug',
				\ '-p', '--project',
				\ ], 'v:val =~ a:A'
				\ )
endfunction

command! -nargs=? -complete=customlist,JiraIssueList JiraIssueList
			\ <mods> terminal jira issue list <args>
