if exists('g:loaded_fugitive')
  let &statusline ..= ' %{FugitiveStatusline()}'
endif
