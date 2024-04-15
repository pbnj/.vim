let &l:formatprg = 'terraform fmt -'

function! TFenvCompletion(A,L,P) abort
  return filter([
        \ 'install',
        \ 'use',
        \ 'uninstall',
        \ 'list',
        \ 'list-remote',
        \ 'version-name',
        \ 'init',
        \ 'pin',
        \ ], 'v:val =~ a:A')
endfunction
command! -nargs=? -complete=customlist,TFenvCompletion TFenv ! tfenv <args>

" TerraformStateCompletion provides terraform resource address suggestions to
" :TerraformStateShow command
function! TerraformStateCompletion(A,L,P) abort
  return filter(systemlist('terraform state list 2>/dev/null'),'v:val =~ a:A')
endfunction
command! -nargs=? -complete=customlist,TerraformStateCompletion TerraformStateShow <mods> terminal terraform state show <args>
