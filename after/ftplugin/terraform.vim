let &l:formatprg = 'terraform fmt -no-color -'
let &l:keywordprg = 'ddgr'
let b:undo_ftplugin = 'setlocal formatprg< keywordprg<'

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
  return systemlist(printf('terraform -chdir=%s state list', fnamemodify(expand('%'), ':h')))->filter('v:val =~ a:A')
endfunction
command! -buffer -nargs=? -complete=customlist,TerraformStateCompletion TerraformStateShow terminal terraform -chdir=%:h state show <args>

" function! TerraformDocCompletion(A, L, P) abort
"   return systemlist('terraform -chdir='.fnamemodify(expand('%'), ':h') . 'show -json 2>/dev/null | jq -rc .values.root_module.resources[].provider_name | sort -u')->filter('v:val =~ a:A')
" endfunction
" function! s:TerraformDocs(args) abort
" endfunction
" command! -buffer -nargs=? -complete=customlist,TerraformDocCompletion TerraformDocs call s:TerraformDocs(<args>)
