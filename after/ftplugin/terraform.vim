let &l:formatprg = 'terraform fmt -'

function! TFenvCompletion(A, L, P)
  return filter([
        \ 'install',
        \ 'use',
        \ 'uninstall',
        \ 'list',
        \ 'list-remote',
        \ 'version-name',
        \ 'init',
        \ 'pin',
        \ ],
        \ 'v:val =~ a:A')
endfunction
command! -buffer -nargs=? -complete=customlist,TFenvCompletion TFenv ! tfenv <args>

" TerraformStateCompletion provides terraform resource address suggestions to
" :TerraformStateShow command
function! TerraformStateCompletion(A, L, P) abort
  let cmd = 'terraform -chdir=' . fnamemodify(expand('%'), ':h') . 'state list 2>/dev/null'
  return filter(systemlist(cmd), 'v:val =~ a:A')
endfunction
command! -buffer -nargs=? -complete=customlist,TerraformStateCompletion TerraformStateShow <mods> terminal terraform -chdir=%:h state show <args>
