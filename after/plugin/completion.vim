imap <c-@> <Plug>(asyncomplete_force_refresh)

autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({
			\ 'name': 'buffer',
			\ 'allowlist': ['*'],
			\ 'priority': 9,
			\ 'completor': function('asyncomplete#sources#buffer#completor'),
			\ 'config': {
			\    'max_buffer_size': 5000000,
			\  },
			\ }))

autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
			\ 'name': 'file',
			\ 'allowlist': ['*'],
			\ 'priority': 10,
			\ 'completor': function('asyncomplete#sources#file#completor')
			\ }))

autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#tags#get_source_options({
			\ 'name': 'tags',
			\ 'allowlist': ['*'],
			\ 'completor': function('asyncomplete#sources#tags#completor'),
			\ 'config': {
			\    'max_file_size': 50000000,
			\  },
			\ }))

