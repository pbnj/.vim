if exists('g:loaded_brew') | finish | endif
let g:loaded_brew = 1

function! BrewCompletion(A,L,P) abort
  return [
        \ 'search',
        \ 'info',
        \ 'install',
        \ 'update',
        \ 'upgrade',
        \ 'uninstall',
        \ 'list',
        \ 'autoremove',
        \ 'outdated',
        \ 'cleanup',
        \ ]->filter('v:val =~ a:A')
endfunction
command! -nargs=* -complete=customlist,BrewCompletion Brew Start brew <args>
