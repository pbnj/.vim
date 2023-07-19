if !exists('g:loaded_fugitive')
    finish
endif
if exists('g:loaded_fugitive_statusline')
    finish
endif
let g:loaded_fugitive_statusline = 1

let &statusline ..= '%{FugitiveStatusline()}'
