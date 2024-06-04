if exists('g:loaded_fzf_custom') | finish | endif
let g:loaded_fzf_custom = 1

" URL fuzzy finder & launcher
command! URLs
      \ call fzf#run(
      \   fzf#wrap({
      \     'source': getline(1,'$')->join(' ')->split(' ')->map({_,v -> matchstr(v,'\chttp\(s\)\?:\/\/[a-z.@:?=&]\+')})->filter('!empty(v:val)')->sort()->uniq(),
      \     'sink': executable('open') ? '!open' : '!xdg-open', 'options': '--multi --prompt=URLs\>\ '
      \   })
      \ )

" Test data
" http://www.one.com " http
" https://www.two.com " https
" https://three@three:three.com " connection string
" (https://four.com) " parens
" [https://five.com] " brackets
" {https://six.com} " braces
" <https://six.com> " angle brackets
" 'https://seven.com' " single quotes
" "https://eight.com" " double quotes
" https://nine.com?foo=bar&baz=qux " query parameters

" Project fuzzy finder and launcher
command! Projects call fzf#run( fzf#wrap( {'source': 'fd . ~/Projects --type d --max-depth 3', 'sink': 'Explore', 'options': '--multi --prompt=Projects\>\ '}))
