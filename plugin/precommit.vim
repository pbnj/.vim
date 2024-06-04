if exists('g:loaded_precommit') | finish | endif
let g:loaded_precommit = 1

command! -nargs=1 -complete=file_in_path PrecommitRun
      \ Sh pre-commit run --files <args>
