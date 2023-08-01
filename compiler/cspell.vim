" Vim compiler file
" Compiler:	cspell
" Maintainer:	Peter Benjamin
" Last Change: 2023-08-01T10:52:30-07:00

if exists('current_compiler')
  finish
endif
let current_compiler = 'cspell'

if exists(':CompilerSet') != 2
  command -nargs=* CompilerSet setlocal <args>
endif

let s:save_cpo = &cpo
set cpo-=C

CompilerSet makeprg=cspell\ %
CompilerSet errorformat=%f:%l:%c\ -\ %m

let &cpo = s:save_cpo
unlet s:save_cpo

" vim: sw=2 sts=2 et
