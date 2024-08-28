nnoremap <silent><nowait><space> <nop>
let g:mapleader = ' '
let g:maplocalleader = ' '

" sane defaults
source $VIMRUNTIME/defaults.vim

" Plugins
" Enable built-in plugin to filter quickfix list. See :h :Cfilter
packadd! cfilter
" Enable built-in plugin to auto-turn-off hlsearch
" packadd! nohlsearch

" vim-only plugins
runtime ftplugin/man.vim

" enable built-in editorconfig
packadd! editorconfig

" netrw
" let g:netrw_keepdir = 0
let g:netrw_hide = 0

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
Plug 'https://github.com/airblade/vim-rooter'
Plug 'https://github.com/dstein64/vim-startuptime', { 'on': ['StartupTime'] }
Plug 'https://github.com/godlygeek/tabular', { 'on': ['Tabularize'] }
Plug 'https://github.com/habamax/vim-shout', { 'on': ['Sh'] }
Plug 'https://github.com/kana/vim-textobj-entire'
Plug 'https://github.com/kana/vim-textobj-user'
Plug 'https://github.com/machakann/vim-highlightedyank'
Plug 'https://github.com/markonm/traces.vim'
Plug 'https://github.com/michaeljsmith/vim-indent-object'
Plug 'https://github.com/pbnj/vim-ddgr', { 'on': ['DDGR'] }
Plug 'https://github.com/romainl/vim-qf'
Plug 'https://github.com/wellle/targets.vim'

" tpope plugins
Plug 'https://github.com/tpope/vim-commentary'
Plug 'https://github.com/tpope/vim-dadbod', { 'on': ['DB'] }
Plug 'https://github.com/tpope/vim-dispatch'
Plug 'https://github.com/tpope/vim-dotenv'
Plug 'https://github.com/tpope/vim-endwise'
Plug 'https://github.com/tpope/vim-eunuch'
Plug 'https://github.com/tpope/vim-fugitive' | nnoremap <leader>gg <cmd>G<cr>
Plug 'https://github.com/tpope/vim-rhubarb'
Plug 'https://github.com/tpope/vim-rsi'
Plug 'https://github.com/tpope/vim-sleuth'
Plug 'https://github.com/tpope/vim-surround'
Plug 'https://github.com/tpope/vim-unimpaired'
Plug 'https://github.com/tpope/vim-vinegar'

" junegunn plugins
Plug 'https://github.com/junegunn/vim-peekaboo'
Plug 'https://github.com/junegunn/fzf', { 'dir': '~/.fzf', 'do': { -> fzf#install() } }
let g:fzf_layout = { 'down': '30%' }
Plug 'https://github.com/junegunn/fzf.vim'
nnoremap <leader>/       <cmd>Rg<cr>
nnoremap <leader>:       <cmd>Commands<cr>
nnoremap <leader>;       <cmd>History:<cr>
nnoremap <leader><space> <cmd>History<cr>
nnoremap <leader>?       <cmd>Helptags<cr>
nnoremap <leader>fb      <cmd>Buffers<cr>
nnoremap <leader>ff      <cmd>Files<cr>
nnoremap <leader>fs      <cmd>GFiles?<cr>
nnoremap <leader>fw      :Rg <c-r><c-w><cr>
vnoremap <leader>fw      y:Rg <c-r>0<cr>
nnoremap <leader>gf      <cmd>GFiles<cr>

Plug 'https://github.com/sheerun/vim-polyglot'
let g:polyglot_disabled = ['modula2']

" completion
Plug 'https://github.com/wellle/tmux-complete.vim'
Plug 'https://github.com/lifepillar/vim-mucomplete'
let g:mucomplete#chains = {
      \ 'default' : ['path', 'omni', 'c-n', 'user'],
      \ 'vim'     : ['path', 'cmd', 'c-n', 'keyn']
      \ }

call plug#end()

filetype plugin indent on

" :help searchcount()
function! LastSearchCount() abort
  let result = searchcount(#{recompute: 1})
  if empty(result)
    return ''
  endif
  if result.incomplete ==# 1     " timed out
    return printf(' /%s [?/??]', @/)
  elseif result.incomplete ==# 2 " max count exceeded
    if result.total > result.maxcount && result.current > result.maxcount
      return printf(' /%s [>%d/>%d]', @/, result.current, result.total)
    elseif result.total > result.maxcount
      return printf(' /%s [%d/>%d]', @/, result.current, result.total)
    endif
  endif
  return printf(' /%s [%d/%d]', @/, result.current, result.total)
endfunction

" Options
let &autoindent = 1
let &autoread = 1
let &backspace = 'indent,eol,start'
let &belloff = 'all'
let &breakindent = 1
let &clipboard = 'unnamed'
let &complete = '.,w,b,u,t'
let &completeopt = 'menuone'
let &cursorline = 0
let &expandtab = 1
let &fillchars = 'vert:│,fold:-,eob:~,lastline:@'
let &hidden = 1
let &hlsearch = 1
let &ignorecase = 1
let &incsearch = 1
let &infercase = 1
let &laststatus = 2
let &lazyredraw = 1
let &list = 1
let &listchars = 'tab:» ,trail:·,lead:·'
let &modeline = 1
let &modelines = 5
let &mouse = 'a'
let &number = 0
let &path = '.,,'
let &pumheight = 50
let &ruler = 0
let &shortmess = 'filnxtocTOCIS'
let &showmode = 1
let &signcolumn = 'no'
let &smartcase = 1
let &smarttab = 1
let &statusline = '%f:%l:%c %m%r%h%w%q %y %{v:hlsearch ? LastSearchCount() : ""}'
let &swapfile = 0
let &termguicolors = 0
let &ttimeout = 1
let &ttimeoutlen = 50
let &ttyfast = 1
let &undodir = expand('~/.vim/undo/')
let &undofile = 1
let &viminfofile = '$HOME/.vim/.viminfo'
let &wildignorecase = 1
let &wildmenu = 1
let &wildoptions = 'pum'
let &wrap = 0

if has('patch-9.1.0500')
  let &completeopt .= ',fuzzy'
  let &wildoptions .= ',fuzzy'
endif

let &wildignore = 'LICENSE,tags,*/.git/*'
let &wildignore .= '*/.mypy_cache/*,*/__pycache__/*'
let &wildignore .= '*/target/*'
let &wildignore .= '*/dist/*,*/node_modules/*,*/vendor/*,*/cache/*'

if executable('rg')
  let &grepprg = 'rg --vimgrep --smart-case $*'
  let &grepformat = '%f:%l:%m'
endif

" https://gist.github.com/romainl/7e2b425a1706cd85f04a0bd8b3898805
augroup PATH
  autocmd!
  autocmd BufReadPost,BufNewFile * if isdirectory('.git') | let &path .= join(systemlist('git ls-tree -d --name-only -r HEAD'), ',') | endif
augroup END

" disable syntax if file is larger than 10MB (performance improvement)
augroup LARGEFILE
  autocmd!
  autocmd BufReadPost * if line2byte(line("$") + 1) > 1000000 | syntax clear | echo 'Syntax disabled on large files' | endif
augroup END

" automatically re-balance window sizes
augroup RESIZE
  autocmd!
  autocmd VimResized * wincmd =
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
nnoremap <leader>bb <cmd>b#<cr>
nnoremap <leader>cd <cmd>lcd %:p:h<cr>
nnoremap <leader>ee :ed **/*
nnoremap <leader>sp :sp **/*
nnoremap <leader>vs :vs **/*
nnoremap Y y$
nnoremap j gj
nnoremap k gk
noremap <expr> N (v:searchforward ? 'N' : 'n')
tnoremap <esc><esc> <c-\><c-n>
tnoremap <s-space> <space>

colorscheme habamax
