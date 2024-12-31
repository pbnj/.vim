let &statusline ..= ' %{FugitiveStatusline()}'

if executable('ctags')
  let &statusline ..= ' %{gutentags#statusline()} '
endif
