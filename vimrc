nnoremap <silent><nowait><space> <nop>
let g:mapleader = ' '

" Enable built-in plugin to filter quickfix list. See :h :Cfilter
packadd cfilter

" Enable :Man built-in vim plugin
runtime ftplugin/man.vim

" Plugins
call plug#begin()

let g:ale_completion_enabled = 1
Plug 'https://github.com/dense-analysis/ale'

let g:polyglot_disabled = ['csv']
Plug 'https://github.com/sheerun/vim-polyglot'

Plug 'https://github.com/AndrewRadev/splitjoin.vim'
Plug 'https://github.com/cocopon/iceberg.vim'
Plug 'https://github.com/editorconfig/editorconfig-vim'
Plug 'https://github.com/junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'https://github.com/junegunn/fzf.vim'
Plug 'https://github.com/junegunn/vader.vim'
Plug 'https://github.com/kana/vim-textobj-entire'
Plug 'https://github.com/kana/vim-textobj-user'
Plug 'https://github.com/lifepillar/vim-mucomplete'
Plug 'https://github.com/ludovicchabant/vim-gutentags'
Plug 'https://github.com/machakann/vim-highlightedyank'
Plug 'https://github.com/mhinz/vim-signify'
Plug 'https://github.com/tpope/vim-commentary'
Plug 'https://github.com/tpope/vim-dispatch'
Plug 'https://github.com/tpope/vim-eunuch'
Plug 'https://github.com/tpope/vim-fugitive'
Plug 'https://github.com/tpope/vim-rhubarb'
Plug 'https://github.com/tpope/vim-rsi'
Plug 'https://github.com/tpope/vim-surround'
Plug 'https://github.com/tpope/vim-unimpaired'
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/wellle/tmux-complete.vim'

call plug#end()

filetype plugin indent on

if has('nvim')
	let &inccommand='split'
else
	let &lazyredraw = 1
	let &ttyfast = 1
endif

let &autoindent = 1
let &autoread = 1
let &background = (system("defaults read -g AppleInterfaceStyle") =~ '^Dark') ? 'dark' : 'light'
let &backspace = 'indent,eol,start'
let &breakindent = 1
let &clipboard = 'unnamed,unnamedplus'
let &completeopt = 'menu,longest'
let &cursorline = 0
let &encoding = 'utf-8'
let &expandtab = 1
let &grepformat = '%f:%l:%m'
let &hidden = 1
let &hlsearch = 1
let &ignorecase = 1
let &incsearch = 1
let &infercase = 1
let &laststatus = 2
let &listchars = 'tab:┊ ,trail:·'
let &modeline = 1
let &mouse = 'a'
let &number = 1
let &path = '.,,docs,src,cmd'
let &pumheight = 50
let &secure = 1
let &shortmess = 'filnxtToOcC'
let &showmode = 0
let &signcolumn = 'yes'
let &smartcase = 1
let &smarttab = 1
let &swapfile = 0
let &termguicolors = 1
let &ttimeout = 1
let &ttimeoutlen = 50
let &wildignore = 'LICENSE,tags,.git,.mypy_cache,__pycache__,target,dist,node_modules,vendor,cache'
let &wildignorecase = 1
let &wildmenu = 1
let &wildmode = 'longest:full,full'
let &wildoptions = 'pum'
let &wrap = 0

if executable('rg')
	let &grepprg = 'rg --vimgrep --smart-case $*'
else
	let &grepprg = 'grep -HIn --line-buffered --exclude={tags,.terraform\*,\*.tfstate.\*,\*.so} --exclude-dir={.git,node_modules,.terraform\*,__pycache__,debug,target} $*'
endif

" change insert/replace cursor shape based on vim mode
if !has('nvim')
	if &term =~# 'xterm'
		let &t_SI = "\e[6 q"
		let &t_SR = "\e[4 q"
		let &t_EI = "\e[2 q"
	endif
endif

cnoremap <c-n> <c-Down>
cnoremap <c-p> <c-Up>
nnoremap <expr> <leader>l (empty(filter(getwininfo(), 'v:val.loclist'))) ? '<cmd>lopen<cr>' : '<cmd>lclose<cr>'
nnoremap <expr> <leader>q (empty(filter(getwininfo(), 'v:val.quickfix'))) ? '<cmd>copen<cr>' : '<cmd>cclose<cr>'
nnoremap <leader>Y  "+y$
nnoremap <leader>cd <cmd>lcd %:p:h<cr>
nnoremap <leader>ee :ed **/*
nnoremap <leader>sp :sp **/*
nnoremap <leader>tt :topleft terminal
nnoremap <leader>vs :vs **/*
nnoremap <leader>y  "+y
nnoremap Q <nop>
nnoremap Y y$
noremap <expr> N (v:searchforward ? 'N' : 'n')
tnoremap <esc> <c-\><c-n>
tnoremap <s-space> <space>

iabbrev dateiso <c-r>=trim(system('date -Iseconds'))<cr>
iabbrev isodate <c-r>=trim(system('date -Iseconds'))<cr>

if &termguicolors == 1
	colorscheme iceberg
else
	colorscheme pbnj
endif
