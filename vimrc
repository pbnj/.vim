nnoremap <silent><nowait><space> <nop>
let g:mapleader = ' '

""" Plugins
" Enable built-in plugin to filter quickfix list. See :h :Cfilter
packadd cfilter

" vim-only plugins
runtime ftplugin/man.vim

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif

function! Install_Ctags() abort
  if executable('apt')
    ! apt update && apt install -y universal-ctags
  elseif executable('brew')
    ! brew install universal-ctags
  elseif executable('apk')
    ! apk add --no-cache ctags
  endif
endfunction

call plug#begin()

" linters, formatters, lsp
let g:ale_sign_error = '●'
let g:ale_sign_warning = '●'
let g:ale_completion_enabled = 1
let g:ale_fix_on_save = 1
let g:ale_fixers = { '*' : ['remove_trailing_lines', 'trim_whitespace'] }
let g:ale_pattern_options_enabled = 1
let g:ale_pattern_options = {
      \   '.github/workflows/.*.yaml$': {
      \     'ale_linters': { 'yaml': ['actionlint', 'yamllint'] },
      \   },
      \ }
let g:ale_floating_preview = 0
let g:ale_virtualtext_cursor = 0
command! ALEDisableFixers       let g:ale_fix_on_save=0
command! ALEEnableFixers        let g:ale_fix_on_save=1
command! ALEDisableFixersBuffer let b:ale_fix_on_save=0
command! ALEEnableFixersBuffer  let b:ale_fix_on_save=1
function! LinterStatus() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf(' W:%d E:%d ', all_non_errors, all_errors)
endfunction
nnoremap <leader>af <cmd>ALEFix<cr>
nnoremap <leader>ai <cmd>ALEInfo<cr>
nnoremap <leader>ca <cmd>ALECodeAction<cr>
nnoremap <leader>gd <cmd>ALEGoToDefinition<cr>
nnoremap <leader>gi <cmd>ALEGoToImplementation<cr>
nnoremap <leader>gr <cmd>ALEFindReferences<cr>
nnoremap <leader>gt <cmd>ALEGoToTypeDefinition<cr>
nnoremap <leader>k <cmd>ALEHover<cr>
nnoremap [d <cmd>ALEPrevious<cr>
nnoremap ]d <cmd>ALENext<cr>
nnoremap [D <cmd>ALEFirst<cr>
nnoremap ]D <cmd>ALELast<cr>
Plug 'https://github.com/dense-analysis/ale'
Plug 'https://github.com/junegunn/vader.vim'

" fzf
Plug 'https://github.com/junegunn/fzf.vim'
Plug 'https://github.com/junegunn/fzf', {
      \ 'dir': '~/.fzf',
      \ 'do': { -> fzf#install() } }
let $FZF_DEFAULT_COMMAND = 'find . -type f \( -not -path ''*.git/*'' \) -prune'
command! URLs call fzf#run( fzf#wrap( {'source': map(filter(uniq(split(join(getline(1,'$'),' '),' ')), 'v:val =~ "http"'), {k,v->substitute(v,'\(''\|)\|"\|,\)','','g')}), 'sink': executable('open') ? '!open' : '!xdg-open', 'options': '--multi --prompt=URLs\>\ '}))
nnoremap <leader>/ <cmd>Rg<cr>
nnoremap <leader><space> <cmd>History<cr>
nnoremap <leader>? <cmd>Helptags<cr>
nnoremap <leader>bb <cmd>Buffers<cr>
nnoremap <leader>ff <cmd>Files<cr>
nnoremap <leader>fg <cmd>GFiles<cr>
nnoremap <leader>fs <cmd>GFiles?<cr>
nnoremap <leader>fw :Rg <c-r><c-w><cr>
nnoremap <leader>tt <cmd>Tags<cr>
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)
imap <expr> <c-x><c-i> fzf#vim#complete('gh issue list --json number --jq .[].number; gh pr list --json number --jq .[].number')

" language support
let g:polyglot_disabled = ['csv']
Plug 'https://github.com/sheerun/vim-polyglot'

" tags
Plug 'https://github.com/ludovicchabant/vim-gutentags', {
      \ 'do': { -> Install_Ctags() } }

" db
Plug 'https://github.com/tpope/vim-dadbod'
Plug 'https://github.com/kristijanhusak/vim-dadbod-ui'
Plug 'https://github.com/kristijanhusak/vim-dadbod-completion'

" git
Plug 'https://github.com/tpope/vim-fugitive'
Plug 'https://github.com/tpope/vim-rhubarb'

" completion
let g:SuperTabContextDefaultCompletionType = '<c-n>'
let g:SuperTabDefaultCompletionType = 'context'
Plug 'https://github.com/ervandew/supertab'
Plug 'https://github.com/garbas/vim-snipmate' | let g:snipMate = { 'snippet_version' : 1 }
Plug 'https://github.com/marcweber/vim-addon-mw-utils'
Plug 'https://github.com/tomtom/tlib_vim'
Plug 'https://github.com/honza/vim-snippets'

" misc
Plug 'https://github.com/AndrewRadev/splitjoin.vim'
Plug 'https://github.com/editorconfig/editorconfig-vim'
Plug 'https://github.com/kana/vim-textobj-entire'
Plug 'https://github.com/kana/vim-textobj-user'
Plug 'https://github.com/machakann/vim-highlightedyank'
Plug 'https://github.com/michaeljsmith/vim-indent-object'
Plug 'https://github.com/pbnj/vim-ddgr'
Plug 'https://github.com/romainl/vim-qf'
Plug 'https://github.com/tpope/vim-commentary'
Plug 'https://github.com/tpope/vim-dispatch'
Plug 'https://github.com/tpope/vim-dotenv'
Plug 'https://github.com/tpope/vim-eunuch'
Plug 'https://github.com/tpope/vim-rsi'
Plug 'https://github.com/tpope/vim-surround'
Plug 'https://github.com/tpope/vim-unimpaired'
Plug 'https://github.com/tpope/vim-vinegar'
Plug 'https://github.com/wellle/targets.vim'
Plug 'https://github.com/wellle/tmux-complete.vim'

call plug#end()

filetype plugin indent on

" let &background = 'dark'
" let &background = ( trim(system("defaults read -g AppleInterfaceStyle")) is# 'Dark' ) ? 'dark' : 'light'
" let &t_Co = 16
""" Options
let &autoindent = 1
let &autoread = 1
let &backspace = 'indent,eol,start'
let &breakindent = 1
let &clipboard = 'unnamed,unnamedplus'
let &completeopt = 'menuone,noselect'
let &cursorline = 0
let &encoding = 'utf-8'
let &expandtab = 1
let &grepformat = '%f:%l:%m'
let &hidden = 1
let &ignorecase = 1
let &incsearch = 1
let &infercase = 1
let &laststatus = 2
let &lazyredraw = 1
let &list = 1
let &listchars = 'tab:⋮ ,trail:·,nbsp:·,precedes:<,extends:>'
let &modeline = 1
let &mouse = 'a'
let &number = 1
let &omnifunc = 'ale#completion#OmniFunc'
let &path = '.,,doc,docs,src,cmd,terraform'
let &pumheight = 50
let &secure = 1
let &shortmess = 'filnxtToOcC'
let &showmode = 1
let &signcolumn = 'number'
let &smartcase = 1
let &smarttab = 1
let &statusline = '%f %m%r%h%w%y%q %l/%c %p%% %{FugitiveStatusline()} %#ALEError#%{LinterStatus()}%*'
let &swapfile = 0
let &termguicolors = 0
let &ttimeout = 1
let &ttimeoutlen = 50
let &ttyfast = 1
let &wildcharm = 26
let &wildignore = 'LICENSE,tags,.git,.mypy_cache,__pycache__,target,dist,node_modules,vendor,cache'
let &wildignorecase = 1
let &wildmenu = 1
let &wildmode = 'longest:full,full'
let &wildoptions = 'pum'
let &wrap = 0
let g:netrw_keepdir = 0

if executable('rg') | let &grepprg = 'rg --vimgrep --smart-case $*' | endif

" change insert/replace cursor shape based on vim mode, similar to neovim
if &term =~# 'xterm'
  let &t_SI = "\e[6 q"
  let &t_SR = "\e[4 q"
  let &t_EI = "\e[2 q"
endif

""" Mappings
cnoremap <c-n> <c-Down>
cnoremap <c-p> <c-Up>
nnoremap <expr> <leader>l (empty(filter(getwininfo(), 'v:val.loclist'))) ? '<cmd>lopen<cr>' : '<cmd>lclose<cr>'
nnoremap <expr> <leader>q (empty(filter(getwininfo(), 'v:val.quickfix'))) ? '<cmd>copen<cr>' : '<cmd>cclose<cr>'
nnoremap <leader>cd <cmd>lcd %:p:h<cr>
nnoremap <leader>ee :ed **/*
nnoremap <leader>gg <cmd>G<cr>
nnoremap <leader>sp :sp **/*
nnoremap <leader>vs :vs **/*
nnoremap Q <nop>
nnoremap Y y$
nnoremap j gj
nnoremap k gk
noremap <expr> N (v:searchforward ? 'N' : 'n')
tnoremap <s-space> <space>

""" Colors
colorscheme pbnj
