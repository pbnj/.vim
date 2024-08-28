if exists('g:loaded_gh') | finish | endif
let g:loaded_gh = 1

" Custom Vim command for `gh` tool with completion for subcommand names
function! s:gh_completion(A,L,P) abort
  return filter(
        \ [
        \   'alias',
        \   'api',
        \   'auth',
        \   'browse',
        \   'codespace',
        \   'config',
        \   'extension',
        \   'gist',
        \   'gpg-key',
        \   'issue',
        \   'label',
        \   'org',
        \   'pr',
        \   'project',
        \   'release',
        \   'repo',
        \   'run',
        \   'search',
        \   'secret',
        \   'ssh-key',
        \   'status',
        \   'variable',
        \   'workflow',
        \   '--help',
        \ ],
        \ 'v:val =~ a:A' )
endfunction

command! -nargs=* -complete=customlist,s:gh_completion GH
      \ terminal gh <args>

" PR
function! s:gh_pr_completion(A,L,P) abort
  return filter(
        \ [
        \   'create',
        \   'list',
        \   'status',
        \   'checkout',
        \   'checks',
        \   'close',
        \   'comment',
        \   'diff',
        \   'edit',
        \   'lock',
        \   'merge',
        \   'ready',
        \   'reopen',
        \   'review',
        \   'unlock',
        \   'view',
        \   '-R', '--repo',
        \   '--help',
        \ ], 'v:val =~ a:A')
endfunction

command! -nargs=* -complete=customlist,s:gh_pr_completion GHPR
      \ terminal gh pr <args>

" RUN
function! s:gh_run_completion(A,L,P) abort
  return filter(
        \ [
        \   'cancel',
        \   'delete',
        \   'download',
        \   'list',
        \   'rerun',
        \   'view',
        \   'watch',
        \   '-R', '--repo',
        \   '--help',
        \ ], 'v:val =~ a:A')
endfunction

command! -nargs=* -complete=customlist,s:gh_run_completion GHRun
      \ terminal gh run <args>

function! s:gh_run_view_completion(A,L,P) abort
  return filter(systemlist('gh run list --json=databaseId --jq .[].databaseId'), 'v:val =~ a:A')
endfunction

command! -nargs=* -complete=customlist,s:gh_run_view_completion GHRunView
      \ terminal gh run view <args>
command! -nargs=* -complete=customlist,s:gh_run_view_completion GHRunLog
      \ terminal gh run view --log <args>
command! -nargs=* GHRunWatch
      \ terminal gh run watch <args>

" WORKFLOW
function! s:gh_workflow_completion(A,L,P) abort
  return filter(systemlist('gh workflow list --json=name --jq .[].name'), 'v:val =~ a:A')
endfunction

command! -nargs=1 -complete=customlist,s:gh_workflow_completion GHWorkflowRun
      \ exe 'terminal gh workflow run ' .. shellescape('<args>')
