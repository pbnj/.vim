if !exists('g:loaded_minpac')
    finish
endif

packadd minpac

command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()
command! PackStatus call minpac#status()

call minpac#init()

call minpac#add('https://github.com/dense-analysis/ale')
call minpac#add('https://github.com/editorconfig/editorconfig-vim')
call minpac#add('https://github.com/junegunn/fzf')
call minpac#add('https://github.com/junegunn/fzf.vim')
call minpac#add('https://github.com/lifepillar/vim-mucomplete')
call minpac#add('https://github.com/machakann/vim-highlightedyank')
call minpac#add('https://github.com/sheerun/vim-polyglot')
call minpac#add('https://github.com/tpope/vim-commentary')
call minpac#add('https://github.com/tpope/vim-eunuch')
call minpac#add('https://github.com/tpope/vim-fugitive')
call minpac#add('https://github.com/tpope/vim-rhubarb')
call minpac#add('https://github.com/tpope/vim-rsi')
call minpac#add('https://github.com/tpope/vim-surround')
call minpac#add('https://github.com/tpope/vim-unimpaired')
call minpac#add('https://github.com/tpope/vim-vinegar')
if executable('ctags') | call minpac#add('https://github.com/ludovicchabant/vim-gutentags') | endif

packloadall
