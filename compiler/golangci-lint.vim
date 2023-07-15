" Vim compiler file
" Compiler:	golangci-lint
" Maintainer:	Peter Benjamin
" Last Change: Fri Jul 14 19:47:06 PDT 2023

if exists('current_compiler')
  finish
endif
let current_compiler = 'golangci-lint'

if exists(':CompilerSet') != 2
  command -nargs=* CompilerSet setlocal <args>
endif

let s:save_cpo = &cpo
set cpo-=C

CompilerSet makeprg=golangci-lint\ run\ %
CompilerSet errorformat=%A%f:%l:%c:\ %m,%-G%.%#

let &cpo = s:save_cpo
unlet s:save_cpo

" vim: sw=2 sts=2 et
