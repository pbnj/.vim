" Compiler: gitleaks
" Maintainer: Peter Benjamin
" Last Change: 2023-08-08T10:16:49-07:00

if exists('current_compiler') | finish | endif
let current_compiler = 'gitleaks'

if exists(':CompilerSet') != 2
  command -nargs=* CompilerSet setlocal <args>
endif

let s:save_cpo = &cpo
set cpo-=C

let &l:makeprg = 'gitleaks detect --verbose --no-git --no-color --no-banner'
let &l:errorformat = 'Fingerprint: %f:%m:%l'

silent CompilerSet makeprg
silent CompilerSet errorformat

let &cpo = s:save_cpo
unlet s:save_cpo

" vim: sw=2 sts=2 ts=2 et
