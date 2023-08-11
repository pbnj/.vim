function! MakeCompletion(A,L,P) abort
    let l:targets = systemlist('make -qp 2>/dev/null | awk -F'':'' ''/^[a-zA-Z0-9][^$#\/\t=]*:([^=]|$)/ {split($1,A,/ /);for(i in A)print A[i]}'' | grep -v Makefile | sort -u')
    return filter(l:targets, 'v:val =~ "^' . a:A . '"')
endfunction

if exists(':Make')
    command! -nargs=* -complete=customlist,MakeCompletion MMake Make <args>
else
    command! -nargs=* -complete=customlist,MakeCompletion MMake :make <args>
endif
