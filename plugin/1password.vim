" Custom cmmand for `op` (aka 1password cli) with completion for item names

command! -nargs=* OP ! op <args>

function! OnePasswordItemCompletion(A,L,P) abort
  return filter(systemlist("op item list | awk 'NR>1 {print $2}'"),'v:val =~ a:A')
endfunction

command! -nargs=* -complete=customlist,OnePasswordItemCompletion OPItem ! op item get <args>
