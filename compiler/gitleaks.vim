" Vim compiler file
" Compiler:	gitleaks
" Maintainer:	Peter Benjamin
" Last Change: 2023-08-08T10:16:49-07:00

if exists('current_compiler')
  finish
endif
let current_compiler = 'gitleaks'

if exists(':CompilerSet') != 2
  command -nargs=* CompilerSet setlocal <args>
endif

let s:save_cpo = &cpo
set cpo-=C

CompilerSet makeprg=gitleaks\ detect\ --no-git\ --no-color\ --no-banner\ --verbose\ --source=%
CompilerSet errorformat=Fingerprint:\ %f:%m:%l

let &cpo = s:save_cpo
unlet s:save_cpo

" vim: sw=2 sts=2 et