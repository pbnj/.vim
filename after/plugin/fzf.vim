if exists('g:loaded_fzf')
  let $FZF_DEFAULT_COMMAND = 'find . -type f \( -not -path ''*.git/*'' \) -prune'
  " let g:fzf_layout = { 'down': '40%' }

  command! URLs call fzf#run( fzf#wrap( {'source': map(filter(uniq(split(join(getline(1,'$'),' '),' ')), 'v:val =~ "http"'), {k,v->substitute(v,'\(''\|)\|"\|,\)','','g')}), 'sink': executable('open') ? '!open' : '!xdg-open', 'options': '--multi --prompt=URLs\>\ '}))

  nnoremap <leader>/ <cmd>Rg<cr>
  nnoremap <leader><space> <cmd>History<cr>
  nnoremap <leader>? <cmd>Helptags<cr>
  nnoremap <leader>bb <cmd>Buffers<cr>
  nnoremap <leader>ff <cmd>Files<cr>
  nnoremap <leader>fg <cmd>GFiles<cr>
  nnoremap <leader>fs <cmd>GFiles?<cr>
  nnoremap <leader>fw :Rg <c-r><c-w><cr>
  nnoremap <leader>tt <cmd>Tags<cr>

  " :h fzf-vim-mappings
  imap <c-x><c-k> <plug>(fzf-complete-word)
  imap <c-x><c-f> <plug>(fzf-complete-path)
  imap <c-x><c-l> <plug>(fzf-complete-line)

  imap <expr> <c-x><c-i> fzf#vim#complete('gh issue list --json number --jq .[].number')
endif
