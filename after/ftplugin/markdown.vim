let &l:formatprg = 'npx prettier --stdin-filepath=%'
let b:undo_ftplugin = 'setlocal formatprg<'

iab toc <!-- START doctoc generated TOC please keep comment here to allow auto update --><CR><!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE --><CR><CR><!-- END doctoc generated TOC please keep comment here to allow auto update -->
iab readme # TITLE<CR><CR>## Table of Contents<CR><CR><ESC>:norm atoc<ESC>a<CR><CR>## Overview<CR><CR>

" Generate Table of Contents
command! -buffer -nargs=1 -complete=file_in_path TOC
      \ !npx doctoc --no-title <args>
