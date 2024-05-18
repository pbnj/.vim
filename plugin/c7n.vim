if exists('g:loaded_c7n') | finish | endif
let g:loaded_c7n = 1

command! -nargs=1 -complete=file_in_path C7nRun Sh pipx run c7n run --output-dir tmp/ --region all --format json <args>
command! -nargs=1 -complete=file_in_path C7nReport Sh pipx run c7n report --output-dir tmp/ --region all --format json <args>
