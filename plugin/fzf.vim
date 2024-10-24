if exists('g:loaded_fzf_custom') | finish | endif
let g:loaded_fzf_custom = 1

" URL fuzzy finder & launcher
" Test data
" http://www.one.com " should match http
" https://www.two.com " should match https
" https://three@three:three.com " should match connection strings
" (https://four.com) " should extract url from parens
" [https://five.com] " should extract url from brackets
" {https://six.com} " should extract url from braces
" <https://six.com> " should extract url from angle brackets
" 'https://seven.com' " should extract url from single quotes
" "https://eight.com" " should extract url from double quotes
" https://nine.com?foo=bar&baz=qux " should match query parameters
command! URLs
      \ call fzf#run(
      \   fzf#wrap({
      \     'source': getline(1,'$')->join(' ')->split(' ')->map({_,v -> matchstr(v,'\chttp\(s\)\?:\/\/[0-9a-z.@:?=&/\-\_$#%]\+')})->filter('!empty(v:val)')->sort()->uniq(),
      \     'sink': executable('open') ? '!open' : '!xdg-open', 'options': '--multi --prompt=URLs\>\ '
      \   })
      \ )

" Projects fuzzy finds local projects & opens them in a new vim buffer
command! -nargs=? Projects
      \ Files ~/Projects
nnoremap <leader>fp <cmd>Projects<cr>

" GHProjects fuzzy finds remote projects, clones them, then open them in a new
" vim buffer
function! KHRepoCompletion(A, L, P) abort
  return systemlist('gh search repos --json fullName --jq .[].fullName --owner=komodohealth '.a:A)->filter('v:val =~ a:A')
endfunction
command! -nargs=1 -complete=customlist,KHRepoCompletion KHProjects call system('gh repo clone '.<q-args>.' ~/Projects/github.com/'.<q-args>) | Projects <args>
