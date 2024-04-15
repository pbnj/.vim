let &l:formatprg = 'prettier --stdin-filepath %'
command! TOC ! markdown-toc -i %
