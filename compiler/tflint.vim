" Vim compiler file
" Compiler:	tflint
" Maintainer:	Peter Benjamin
" Last Change: 2023-08-01T13:14:01-07:00

if exists('current_compiler')
  finish
endif
let current_compiler = 'tflint'

if exists(':CompilerSet') != 2
  command -nargs=* CompilerSet setlocal <args>
endif

let s:save_cpo = &cpo
set cpo-=C

CompilerSet makeprg=tflint\ --format\ compact
CompilerSet errorformat=%f:%l:%c:\ %tarning\ -\ %m
CompilerSet errorformat+=%f:%l:%c:\ %trror\ -\ %m

let &cpo = s:save_cpo
unlet s:save_cpo

" vim: sw=2 sts=2 et
