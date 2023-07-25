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
let &omnifunc = 'ale#completion#OmniFunc'
let g:ale_close_preview_on_insert = 1
let g:ale_fix_on_save = 1
let g:ale_fixers = { '*' : ['remove_trailing_lines', 'trim_whitespace'] }
let g:ale_floating_preview = 0
let g:ale_virtualtext_cursor = 0
nnoremap <leader>af <cmd>ALEFix<cr>
nnoremap <leader>gd <cmd>ALEGoToDefinition<cr>
nnoremap <leader>gi <cmd>ALEGoToImplementation<cr>
nnoremap <leader>gt <cmd>ALEGoToTypeDefinition<cr>
nnoremap <leader>k <cmd>ALEHover<cr>
nnoremap [d <cmd>ALEPrevious<cr>
nnoremap ]d <cmd>ALENext<cr>

" fzf
nnoremap <leader>bb <cmd>Buffers<cr>
nnoremap <leader>ff <cmd>Files<cr>
nnoremap <leader>FF <cmd>Files %:p:h<cr>
nnoremap <leader>fg <cmd>GFiles<cr>
nnoremap <leader>FG <cmd>GFiles?<cr>

call plug#begin()

Plug 'https://github.com/dense-analysis/ale'
Plug 'https://github.com/editorconfig/editorconfig-vim'
Plug 'https://github.com/junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'https://github.com/junegunn/fzf.vim'
Plug 'https://github.com/lifepillar/vim-mucomplete'
Plug 'https://github.com/kana/vim-textobj-entire'
Plug 'https://github.com/kana/vim-textobj-user'
Plug 'https://github.com/machakann/vim-highlightedyank'
Plug 'https://github.com/prabirshrestha/vim-lsp'
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
Plug 'https://github.com/wellle/tmux-complete.vim'
if executable('ctags') | Plug 'https://github.com/ludovicchabant/vim-gutentags' | endif

call plug#end()

" vim options
let &autoindent = 1
let &autoread = 1
let &background =  'dark'
let &backspace = 'indent,eol,start'
let &breakindent = 1
let &clipboard = 'unnamed,unnamedplus'
let &completeopt = 'menu,longest'
let &cursorline = 0
let &encoding = 'utf-8'
let &expandtab = 0
let &grepformat = '%f:%l:%m'
let &guioptions = ''
let &hidden = 1
let &hlsearch = 0
let &ignorecase = 1
let &incsearch = 1
let &infercase = 1
let &keywordprg = ':!ddgr'
let &laststatus = 2
let &lazyredraw = 1
let &listchars = 'tab:┊ ,trail:·'
let &modeline = 1
let &mouse = 'a'
let &number = 0
let &path = '.,,docs/**,src/**,cmd/**'
let &pumheight = 50
let &secure = 1
let &shortmess = 'filnxtToOcC'
let &showbreak = '… '
let &showmode = 1
let &signcolumn = 'no'
let &smartcase = 1
let &smarttab = 1
let &swapfile = 0
let &t_Co = 16
let &ttimeout = 1
let &ttimeoutlen = 50
let &ttyfast = 1
let &wildignore = 'LICENSE,tags,.git,.mypy_cache,__pycache__,target,dist,node_modules,vendor,cache,.terraform'
let &wildignorecase = 1
let &wildmenu = 1
let &wildmode = 'longest:full,full'
let &wildoptions = 'pum'
let &wrap = 0

let &grepprg = executable('rg')
            \ ? 'rg --vimgrep --smart-case $*'
            \ : 'grep -HIn --line-buffered --exclude={tags,.terraform\*,\*.tfstate.\*,\*.so} --exclude-dir={.git,node_modules,.terraform\*,__pycache__,debug,target} $*'

" change insert/replace cursor shape based on vim mode
if &term =~ "xterm"
    let &t_SI = "\e[6 q"
    let &t_SR = "\e[4 q"
    let &t_EI = "\e[2 q"
endif

cnoremap <c-n> <c-Down>
cnoremap <c-p> <c-Up>
nnoremap <leader>cd <cmd>lcd %:p:h<cr>
nnoremap <leader>ee :ed **/*
nnoremap <leader>gg :G<cr>
nnoremap <leader>gP :G! pull<cr>
nnoremap <leader>gp :G! push<cr>
nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>l <cmd>lopen<cr>
nnoremap <leader>q <cmd>copen<cr>
nnoremap <leader>sp :sp **/*
nnoremap <leader>TT :topleft terminal <c-r><c-l>
nnoremap <leader>tt <cmd>topleft terminal<cr>
nnoremap <leader>vs :vs **/*
nnoremap <leader>y "+y
nnoremap <leader>Y "+y$
nnoremap Q <nop>
nnoremap Y y$
noremap <expr> N (v:searchforward ? 'N' : 'n')
tnoremap <esc> <c-\><c-n>
tnoremap <s-space> <space>

colorscheme pbnj
