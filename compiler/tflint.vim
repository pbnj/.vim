" Compiler: tflint
" Maintainer: Peter Benjamin
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

let &l:makeprg = 'tflint --format compact'

setlocal errorformat=%f:%l:%c:\ %tarning\ -\ %m
setlocal errorformat+=%f:%l:%c:\ %trror\ -\ %m

silent CompilerSet makeprg
silent CompilerSet errorformat

let &cpo = s:save_cpo
unlet s:save_cpo

" vim: sw=2 sts=2 et
