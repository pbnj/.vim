if exists('g:loaded_fzf')
        let $FZF_DEFAULT_COMMAND = 'find . -type f \( -not -path ''*.git/*'' \) -prune'
        let g:fzf_colors = { 'fg': ['fg', 'Normal'], 'bg': ['bg', 'Normal'], 'hl': ['fg', 'Comment'], 'fg+': ['fg', 'CursorLine', 'CursorColumn', 'Normal'], 'bg+': ['bg', 'CursorLine', 'CursorColumn'], 'hl+': ['fg', 'Statement'], 'info': ['fg', 'PreProc'], 'border': ['fg', 'Ignore'], 'prompt': ['fg', 'Conditional'], 'pointer': ['fg', 'Exception'], 'marker': ['fg', 'Keyword'], 'spinner': ['fg', 'Label'], 'header': ['fg', 'Comment'] }

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
