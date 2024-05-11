nnoremap <silent><nowait><space> <nop>
let g:mapleader = ' '
let g:maplocalleader = ' '

" Plugins
" Enable built-in plugin to filter quickfix list. See :h :Cfilter
packadd cfilter

" vim-only plugins
runtime ftplugin/man.vim

" disable some built-in plugins
let g:loaded_2html_plugin = 1

" better matchit
if has('syntax') && has('eval')
  packadd! matchit
endif

packadd! editorconfig

" Download plug.vim if it doesn't exist yet
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
augroup PLUG
  autocmd!
  autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)')) > 0
        \ |   PlugInstall --sync
        \ |   source $MYVIMRC
        \ | endif
augroup END

call plug#begin()

" misc
Plug 'https://github.com/Konfekt/vim-compilers'
Plug 'https://github.com/bfrg/vim-jqplay', { 'on': ['Jqplay'] }
Plug 'https://github.com/dstein64/vim-startuptime', { 'on': ['StartupTime'] }
Plug 'https://github.com/godlygeek/tabular', { 'on': ['Tabularize'] }
Plug 'https://github.com/kana/vim-textobj-entire'
Plug 'https://github.com/kana/vim-textobj-user'
Plug 'https://github.com/machakann/vim-highlightedyank'
Plug 'https://github.com/pbnj/vim-ddgr', { 'on': ['DDGR'] }
Plug 'https://github.com/romainl/vim-qf'
Plug 'https://github.com/sheerun/vim-polyglot'
Plug 'https://github.com/tpope/vim-commentary'
Plug 'https://github.com/tpope/vim-dadbod', { 'on': ['DB'] }
Plug 'https://github.com/tpope/vim-dotenv'
Plug 'https://github.com/tpope/vim-endwise'
Plug 'https://github.com/tpope/vim-eunuch'
Plug 'https://github.com/tpope/vim-fugitive', { 'on': ['G', 'Git', 'Gwrite', 'GBrowse'] }
Plug 'https://github.com/tpope/vim-rhubarb', { 'on': ['G', 'Git', 'Gwrite', 'GBrowse'] } | nnoremap <leader>gg <cmd>Git<cr>
Plug 'https://github.com/tpope/vim-rsi'
Plug 'https://github.com/tpope/vim-sleuth'
Plug 'https://github.com/tpope/vim-surround'
Plug 'https://github.com/tpope/vim-unimpaired'
Plug 'https://github.com/tpope/vim-vinegar'
Plug 'https://github.com/wellle/targets.vim'
Plug 'https://github.com/wellle/tmux-complete.vim'
Plug 'https://github.com/habamax/vim-shout', { 'on': ['Sh'] }

" completion
Plug 'https://github.com/lifepillar/vim-mucomplete'

" fzf
Plug 'https://github.com/junegunn/vim-slash' | noremap <plug>(slash-after) zz
Plug 'https://github.com/junegunn/fzf', { 'dir': '~/.fzf', 'do': { -> fzf#install() } }
Plug 'https://github.com/junegunn/fzf.vim' ", { 'on': ['Rg', 'Commands', 'History', 'History:', 'Helptags', 'Tags', 'Buffers', 'Files', 'GFiles?'] }
nnoremap <leader>/       <cmd>Rg<cr>
nnoremap <leader>:       <cmd>Commands<cr>
nnoremap <leader>;       <cmd>History:<cr>
nnoremap <leader><space> <cmd>History<cr>
nnoremap <leader>?       <cmd>Helptags<cr>
nnoremap <leader>bb      <cmd>Buffers<cr>
nnoremap <leader>ff      <cmd>Files<cr>
nnoremap <leader>fs      <cmd>GFiles?<cr>
nnoremap <leader>fw      :Rg <c-r><c-w><cr>
vnoremap <leader>fw      y:Rg <c-r>0<cr>
nnoremap <leader>gf      <cmd>GFiles<cr>

call plug#end()

filetype plugin indent on
syntax on

" Options
source $VIMRUNTIME/defaults.vim

set autoindent
set autoread
set background=dark
set backspace=indent,eol,start
set belloff=all
set breakindent
set clipboard=unnamed
set complete-=i
set completeopt=menuone,noselect
set expandtab
set hidden
set hlsearch
set ignorecase
set incsearch
set infercase
set laststatus=2
set lazyredraw
set list
set listchars=tab:→·,trail:~
set modeline
set modelines=5
set mouse=a
set nocursorline
set nonumber
set noruler
set noswapfile
set notermguicolors
set nowrap
set path=.,,
set pumheight=50
set shortmess=filnxtocTOCI
set showmode
set signcolumn=no
set smartcase
set smarttab
set statusline=%f:%l:%c%m%r%h%w%q%=[%{&formatprg}]%y
set ttimeout
set ttimeoutlen=50
set ttyfast
set viminfofile=$HOME/.vim/.viminfo
set wildignorecase
set wildmenu
set wildoptions=pum

set wildignore=LICENSE,tags,*/.git/*
set wildignore+=*/.mypy_cache/*,*/__pycache__/*
set wildignore+=*/target/*
set wildignore+=*/dist/*,*/node_modules/*,*/vendor/*,*/cache/*

if executable('rg')
  let &grepprg = 'rg --vimgrep --smart-case $*'
  let &grepformat = '%f:%l:%m'
endif

" https://gist.github.com/romainl/7e2b425a1706cd85f04a0bd8b3898805
augroup PATH
  autocmd!
  autocmd VimEnter,BufReadPost,BufNewFile * if isdirectory('.git')
        \ |   if executable('fd')
        \ |     let &path .= join(systemlist('fd . --type d --hidden'), ',')
        \ |   elseif executable('git')
        \ |     let &path .= join(systemlist('git ls-tree -d --name-only -r HEAD'), ',')
        \ |   endif
        \ | endif
augroup END

" change insert/replace cursor shape based on vim mode, similar to neovim
if &term =~# 'xterm'
  let &t_SI = "\e[6 q"
  let &t_SR = "\e[4 q"
  let &t_EI = "\e[2 q"
endif

" Mappings
cnoremap <c-n> <c-Down>
cnoremap <c-p> <c-Up>
nnoremap <expr> <leader>ll (empty(filter(getwininfo(), 'v:val.loclist'))) ? '<cmd>lopen<cr>' : '<cmd>lclose<cr>'
nnoremap <expr> <leader>qq (empty(filter(getwininfo(), 'v:val.quickfix'))) ? '<cmd>copen<cr>' : '<cmd>cclose<cr>'
nnoremap <leader>cd <cmd>lcd %:p:h<cr>
nnoremap <leader>ee :ed **/*
nnoremap <leader>gg <cmd>G<cr>
nnoremap <leader>sp :sp **/*
nnoremap <leader>vs :vs **/*
nnoremap Y y$
nnoremap j gj
nnoremap k gk
noremap <expr> N (v:searchforward ? 'N' : 'n')
tnoremap <esc><esc> <c-\><c-n>
tnoremap <s-space> <space>

colorscheme retrobox
