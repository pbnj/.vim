let &l:formatprg = 'npx prettier --stdin-filepath=%'
let b:undo_ftplugin = 'setlocal formatprg<'

" Generate Table of Contents
command! -buffer -nargs=1 -complete=file_in_path TOC
      \ !npx doctoc --no-title <args>
