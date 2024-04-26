let &l:formatprg = 'terraform fmt -'

function! s:TFenvCompletion(A,L,P) abort
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
command! -buffer -nargs=? -complete=customlist,s:TFenvCompletion TFenv ! tfenv <args>

" TerraformStateCompletion provides terraform resource address suggestions to
" :TerraformStateShow command
function! s:TerraformStateCompletion(A,L,P) abort
  let l:cmd = printf('terraform -chdir=%s state list 2>/dev/null', fnamemodify(expand('%'), ':h'))
  return filter(systemlist(l:cmd),'v:val =~ a:A')
endfunction
command! -buffer -nargs=? -complete=customlist,s:TerraformStateCompletion TerraformStateShow <mods> terminal terraform -chdir=%:h state show <args>

" function! s:TerraformCompletion(A,L,P) abort
"   return [
"         \ 'apply',
"         \ 'console',
"         \ 'destroy',
"         \ 'fmt',
"         \ 'force-unlock',
"         \ 'get',
"         \ 'graph',
"         \ 'import',
"         \ 'init',
"         \ 'login',
"         \ 'logout',
"         \ 'metadata',
"         \ 'output',
"         \ 'plan',
"         \ 'providers',
"         \ 'refresh',
"         \ 'show',
"         \ 'state',
"         \ 'taint',
"         \ 'test',
"         \ 'untaint',
"         \ 'validate',
"         \ 'version',
"         \ 'workspace',
"         \ ]->filter('v:val =~ a:A')
" endfunction
" command! -buffer -nargs=? -complete=customlist,s:TerraformCompletion Terraform terminal terraform -chdir=%:h <args>
