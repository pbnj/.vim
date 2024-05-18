if exists('g:loaded_fzf_custom') | finish | endif
let g:loaded_fzf_custom = 1

" URL fuzzy finder & launcher
command! URLs call fzf#run( fzf#wrap( {'source': map(filter(uniq(split(join(getline(1,'$'),' '),' ')), 'v:val =~ "http"'), {k,v->substitute(v,'\(''\|)\|"\|,\)','','g')}), 'sink': executable('open') ? '!open' : '!xdg-open', 'options': '--multi --prompt=URLs\>\ '}))

" Project fuzzy finder and launcher
command! Projects call fzf#run( fzf#wrap( {'source': 'fd . ~/Projects --type d --max-depth 3', 'sink': 'Explore', 'options': '--multi --prompt=Projects\>\ '}))
