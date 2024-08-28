let &l:iskeyword .= ',-'
let &l:formatprg = 'prettier --stdin-filepath %'
let b:undo_ftplugin = 'setlocal formatprg< iskeyword<'
