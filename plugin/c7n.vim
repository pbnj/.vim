if exists('g:loaded_c7n') | finish | endif
let g:loaded_c7n = 1

command! -nargs=1 -complete=file_in_path C7nRun terminal pipx run c7n run --verbose --output-dir tmp/ <args>
command! -nargs=1 -complete=file_in_path C7nReport terminal pipx run c7n report --output-dir tmp/ <args>
