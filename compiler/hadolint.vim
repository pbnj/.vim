" Compiler: hadolint
" Maintainer: Peter Benjamin
" Last Change: 2023-08-14T14:51:13-07:00

if exists('current_compiler')
  finish
endif
let current_compiler = 'hadolint'

if exists(':CompilerSet') != 2
  command -nargs=* CompilerSet setlocal <args>
endif

let s:save_cpo = &cpo
set cpo-=C

let &l:makeprg = 'hadolint --no-color %'

" match on output like:
"   /path/to/Dockerfile:123 DL123 error: some error message
"   /path/to/Dockerfile:123 SC123 warning: some warning message
setlocal errorformat=%f:%l\ DL%n\ %t%*[a-z]:\ %m
setlocal errorformat+=%f:%l\ SC%n\ %t%*[a-z]:\ %m

silent CompilerSet makeprg
silent CompilerSet errorformat

let &cpo = s:save_cpo
unlet s:save_cpo

" vim: sw=2 sts=2 et
