if !executable('fzf') || exists('g:loaded_fzf_custom') | finish | endif
let g:loaded_fzf_custom = 1

nnoremap <leader>/  <cmd>Rg<cr>
nnoremap <leader>:  <cmd>Commands<cr>
nnoremap <leader>;  <cmd>History:<cr>
nnoremap <leader>bb <cmd>Buffers<cr>
nnoremap <leader>ff <cmd>Files<cr>
nnoremap <leader>fo <cmd>History<cr>
nnoremap <leader>fp <cmd>Files ~/Projects<cr>
nnoremap <leader>fw :Rg <c-r><c-w><cr>
nnoremap <leader>gf <cmd>GFiles<cr>
nnoremap <leader>gs <cmd>GFiles?<cr>
nnoremap <leader>hh <cmd>Helptags<cr>
nnoremap <leader>tT <cmd>Tags<cr>
nnoremap <leader>tt <cmd>BTags<cr>
vnoremap <leader>/  y:Rg <c-r>0<cr>
vnoremap <leader>fw y:Rg <c-r>0<cr>

" URLs fuzzy finder & launcher for URLs in any vim buffer
"
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
      \     'source': getline(1,'$')->map({_,v -> matchstr(v,'\chttp\(s\)\?:\/\/[0-9a-z.@:?=&/\-\_$#%]\+')})->filter('!empty(v:val)')->sort()->uniq(),
      \     'sink': executable('open') ? '!open' : '!xdg-open',
      \     'options': '--multi --prompt=URLs\>\ ',
      \   })
      \ )
