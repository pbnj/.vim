if exists('g:loaded_fzf')
	let $FZF_DEFAULT_COMMAND = 'rg --files --hidden'

	command! URLs call fzf#run( fzf#wrap( {'source': map(filter(uniq(split(join(getline(1,'$'),' '),' ')), 'v:val =~ "http"'), {k,v->substitute(v,'\(''\|)\|"\|,\)','','g')}), 'sink': executable('open') ? '!open' : '!xdg-open', 'options': '--multi --prompt=URLs\>\ '}))

	nnoremap <leader>bb <cmd>Buffers<cr>
	nnoremap <leader>ff <cmd>Files<cr>
	nnoremap <leader>FF <cmd>Files %:p:h<cr>
	nnoremap <leader>fg <cmd>GFiles<cr>
	nnoremap <leader>FG <cmd>GFiles?<cr>
	nnoremap <leader>fw :Rg <c-r><c-w><cr>
	nnoremap <leader>fW :Rg <c-r><c-f><cr>
	nnoremap <leader>ft :Tags <c-r><c-w><cr>

endif
