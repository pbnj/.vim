let &l:formatprg = 'terraform fmt -'
let &l:keywordprg = printf(':!ddgr %s', &l:filetype)

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

if exists('g:loaded_ale')
  let b:ale_fixers = ['terraform', 'remove_trailing_lines', 'trim_whitespace']
  let b:ale_linters = ['terraform', 'tflint', 'terraform_ls', 'snyk', 'gitleaks']

  function! ALEInstall() abort
    if executable('brew')
      ! brew install tflint tfenv
    endif
  endfunction
  command! ALEInstall call ALEInstall()
endif
