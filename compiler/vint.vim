" Vim compiler file
" Compiler:	vint
" Maintainer:	Peter Benjamin
" Last Change: 2023-07-31T10:45:12-07:00

if exists('current_compiler')
  finish
endif
let current_compiler = 'vint'

if exists(':CompilerSet') != 2
  command -nargs=* CompilerSet setlocal <args>
endif

let s:save_cpo = &cpo
set cpo-=C

CompilerSet makeprg=vint\ %
CompilerSet errorformat=%f:%l:%c:\ %m

let &cpo = s:save_cpo
unlet s:save_cpo

" vim: sw=2 sts=2 et
