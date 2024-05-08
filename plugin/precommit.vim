command! -nargs=* -complete=file_in_path PrecommitRun
      \ terminal pre-commit run --files <args>
