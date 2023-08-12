nnoremap <silent><nowait><space> <nop>
let g:mapleader = ' '

filetype plugin indent on

" Enable built-in plugin to filter quickfix list. See :h :Cfilter
packadd cfilter

" Enable :Man built-in vim plugin
runtime ftplugin/man.vim

" Plugins
let g:polyglot_disabled = ['csv']
let g:mucomplete#chains = {'default': ['path','omni','c-n','user','tags'],'vim': ['path','cmd','c-n','tags']}

" ale
let g:ale_completion_enabled = 1
let g:ale_close_preview_on_insert = 1
let g:ale_fix_on_save = 1
let g:ale_fixers = { '*' : ['remove_trailing_lines', 'trim_whitespace'] }
let g:ale_floating_preview = 0
let g:ale_virtualtext_cursor = 0

call plug#begin()

Plug 'https://github.com/dense-analysis/ale'
Plug 'https://github.com/AndrewRadev/splitjoin.vim'
Plug 'https://github.com/dhruvasagar/vim-markify'
Plug 'https://github.com/editorconfig/editorconfig-vim'
Plug 'https://github.com/junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'https://github.com/junegunn/fzf.vim'
Plug 'https://github.com/junegunn/vader.vim'
Plug 'https://github.com/kana/vim-textobj-entire'
Plug 'https://github.com/kana/vim-textobj-user'
Plug 'https://github.com/lifepillar/vim-mucomplete'
Plug 'https://github.com/machakann/vim-highlightedyank'
Plug 'https://github.com/sheerun/vim-polyglot'
Plug 'https://github.com/tpope/vim-commentary'
Plug 'https://github.com/tpope/vim-dispatch'
Plug 'https://github.com/tpope/vim-eunuch'
Plug 'https://github.com/tpope/vim-fugitive'
Plug 'https://github.com/tpope/vim-rhubarb'
Plug 'https://github.com/tpope/vim-rsi'
Plug 'https://github.com/tpope/vim-surround'
Plug 'https://github.com/tpope/vim-unimpaired'
Plug 'https://github.com/tpope/vim-vinegar'
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/wellle/tmux-complete.vim'
Plug 'https://github.com/ludovicchabant/vim-gutentags'
Plug 'https://github.com/cocopon/iceberg.vim'

call plug#end()

if has('nvim')
	let &inccommand='split'
else
	let &lazyredraw = 1
	let &ttimeout = 1
	let &ttimeoutlen = 50
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
let &path = '.,,docs,src,cmd,.github'
let &pumheight = 50
let &secure = 1
let &shortmess = 'filnxtToOcC'
let &showmode = 0
let &signcolumn = 'number'
let &smartcase = 1
let &smarttab = 1
let &swapfile = 0
let &termguicolors = 1
let &wildignore = 'LICENSE,tags,.git,.mypy_cache,__pycache__,target,dist,node_modules,vendor,cache'
let &wildignorecase = 1
let &wildmenu = 1
let &wildmode = 'longest:full,full'
let &wildoptions = 'pum'
let &wrap = 0

let &grepprg = executable('rg')
			\ ? 'rg --vimgrep --smart-case $*'
			\ : 'grep -HIn --line-buffered --exclude={tags,.terraform\*,\*.tfstate.\*,\*.so} --exclude-dir={.git,node_modules,.terraform\*,__pycache__,debug,target} $*'

" change insert/replace cursor shape based on vim mode
if &term =~# 'xterm'
	let &t_SI = "\e[6 q"
	let &t_SR = "\e[4 q"
	let &t_EI = "\e[2 q"
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
