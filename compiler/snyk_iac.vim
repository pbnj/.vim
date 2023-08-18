" Vim compiler file
" Compiler: snyk iac
" Maintainer: Peter Benjamin
" Last Change: 2023-08-13T15:30:44-07:00

if exists('current_compiler')
  finish
endif
let current_compiler = 'snyk_iac'

if exists(':CompilerSet') != 2
  command -nargs=* CompilerSet setlocal <args>
endif

let s:save_cpo = &cpo
set cpo-=C

" produce errorformat-friendly output
let &l:makeprg = 'snyk iac test --json | jq -rc ''.[] | select(.ok == false) | @text "\(.targetFilePath):\(.infrastructureAsCodeIssues[].lineNumber | if (. < 0) then 1 else . end) \(.infrastructureAsCodeIssues[].msg) - \(.infrastructureAsCodeIssues[].issue) - \(.infrastructureAsCodeIssues[].impact) - \(.infrastructureAsCodeIssues[].resolve) [\(.infrastructureAsCodeIssues[].id)]"'' | sort -u'
let &l:errorformat = '%f:%l %m'

silent CompilerSet makeprg
silent CompilerSet errorformat

let &cpo = s:save_cpo
unlet s:save_cpo

" vim: sw=2 sts=2 et
