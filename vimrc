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
let g:ale_echo_cursor = 0
let g:ale_fix_on_save = 1
let g:ale_fixers = {
			\ '*' : ['remove_trailing_lines', 'trim_whitespace'],
			\ 'go': ['goimports', 'gopls'],
			\ 'json': ['jq'],
			\ 'markdown': ['prettier'],
			\ 'python': ['isort', 'black'],
			\ 'rust': ['rustfmt'],
			\ 'sh': ['shfmt'],
			\ 'terraform': ['terraform', 'remove_trailing_lines', 'trim_whitespace'],
			\ 'yaml': ['prettier'],
			\ }
let g:ale_linters = {
			\ 'rust': ['cargo', 'analyzer'],
			\ 'terraform': ['terraform', 'tflint', 'terraform_ls'],
			\ }
let g:ale_hover_cursor = 0
let g:ale_virtualtext_cursor = 2
nnoremap <leader>gd <cmd>ALEGoToDefinition<cr>
nnoremap <leader>k <cmd>ALEHover<cr>
nnoremap [d <cmd>ALEPrevious<cr>
nnoremap ]d <cmd>ALENext<cr>

" fzf
let project_finder = executable('fd') ? 'fd . ~/Projects --type d' : 'find ~/Projects -type d -not \( -path *.git -prune \) -not \( -path *.terraform -prune \)'
command! -bang Projects call fzf#run(fzf#wrap({'source': project_finder, 'options': '--prompt=Projects\>\ '}, <bang>0))
command! URLs call fzf#run(fzf#wrap({'source': map(filter(uniq(split(join(getline(1,'$'),' '),' ')), 'v:val =~ "http"'), {k,v->substitute(v,'\(''\|)\|"\|,\)','','g')}), 'sink': executable('open') ? '!open' : '!xdg-open', 'options': '--multi --prompt=URLs\>\ '}))
command! F Files
command! FF Files %:p:h
nnoremap <leader>bb <cmd>Buffers<cr>
nnoremap <leader>ff <cmd>GFiles<cr>
nnoremap <leader>FF <cmd>Files %:p:h<cr>
nnoremap <leader>uu <cmd>URLs<cr>

packadd minpac

call minpac#init()
call minpac#add('https://github.com/vim/colorschemes')
call minpac#add('https://github.com/dense-analysis/ale')
call minpac#add('https://github.com/editorconfig/editorconfig-vim')
call minpac#add('https://github.com/junegunn/fzf', {'do': './install --all'})
call minpac#add('https://github.com/junegunn/fzf.vim')
call minpac#add('https://github.com/lifepillar/vim-mucomplete')
call minpac#add('https://github.com/machakann/vim-highlightedyank')
call minpac#add('https://github.com/tpope/vim-commentary')
call minpac#add('https://github.com/tpope/vim-dispatch')
call minpac#add('https://github.com/tpope/vim-eunuch')
call minpac#add('https://github.com/tpope/vim-fugitive')
call minpac#add('https://github.com/tpope/vim-rhubarb')
call minpac#add('https://github.com/tpope/vim-rsi')
call minpac#add('https://github.com/tpope/vim-surround')
call minpac#add('https://github.com/tpope/vim-unimpaired')
call minpac#add('https://github.com/tpope/vim-vinegar')
call minpac#add('https://github.com/vim-airline/vim-airline')
call minpac#add('https://github.com/sheerun/vim-polyglot')
if executable('ctags') | call minpac#add('https://github.com/ludovicchabant/vim-gutentags') | endif

packloadall

command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()
command! PackStatus call minpac#status()

" vim options
let &autoindent = 1
let &autoread = 1
let &background = (system('defaults read -g AppleInterfaceStyle') =~ '^Dark') ? 'dark' : 'light'
let &backspace = 'indent,eol,start'
let &breakindent = 1
let &clipboard = 'unnamed,unnamedplus'
let &completeopt = 'menu,longest'
let &cursorline = 0
let &encoding = 'utf-8'
let &errorformat = '%f:%l:%m,%f:%l:%c:%m'
let &expandtab = 0
let &grepformat = '%f:%l:%m'
let &grepprg = executable('rg') ? 'rg --vimgrep --smart-case $*' : 'grep -HIn --line-buffered --exclude={tags,.terraform\*,\*.tfstate.\*,\*.so} --exclude-dir={.git,node_modules,.terraform\*,__pycache__,debug,target} $*'
let &guioptions = ''
let &hidden = 1
let &hlsearch = 0
let &ignorecase = 1
let &incsearch = 1
let &infercase = 1
let &keywordprg = ':!ddgr'
let &laststatus = 2
let &lazyredraw = 1
let &list = 1
let &listchars = 'tab:┊ ,trail:·'
let &modeline = 1
let &number = 1
let &signcolumn = 'number'
let &path = '.,,src/**,cmd/**'
let &pumheight = 50
let &secure = 1
let &shortmess = 'filnxtToOcC'
let &showbreak = '… '
let &showmode = 1
let &smartcase = 1
let &smarttab = 1
let &swapfile = 0
let &ttimeout = 1
let &ttimeoutlen = 50
let &ttyfast = 1
let &wildignore = 'LICENSE,tags,.git,.mypy_cache,__pycache__,target,dist,node_modules,vendor,cache,.terraform'
let &wildignorecase = 1
let &wildmenu = 1
let &wildmode = 'longest:full,full'
let &wildoptions = 'pum'
let &wrap = 0

if &term =~ "xterm"
	let &t_SI = "\e[6 q"
	let &t_SR = "\e[4 q"
	let &t_EI = "\e[2 q"
endif

" netrw options
let g:netrw_keepdir = 0
let g:netrw_fastbrowse = 0
let g:netrw_localrmdir = 'rm -rf'

" [B]uffer [D]elete all buffers. To re-open most recent buffer: `:e#`
command! BD %bd

" Re-open nested vim-in-vim in outer vim
command! Unwrap let g:file = expand('%') | bdelete | exec 'silent !echo -e "\033]51;[\"drop\", \"'..g:file..'\"]\007"' | q

cnoremap <c-n> <c-Down>
cnoremap <c-p> <c-Up>
nnoremap <leader>cd <cmd>lcd %:p:h<cr>
nnoremap <leader>ee :ed **/*
nnoremap <leader>gg :G<cr>
nnoremap <leader>gP :G! pull<cr>
nnoremap <leader>gp :G! push<cr>
nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>sp :sp **/*
nnoremap <leader>TT :topleft terminal <c-r><c-l>
nnoremap <leader>tt <cmd>topleft terminal<cr>
nnoremap <leader>vs :vs **/*
nnoremap Y y$
noremap <expr> N (v:searchforward ? 'N' : 'n')
noremap <expr> n (v:searchforward ? 'n' : 'N')
tnoremap <esc> <c-\><c-n>
tnoremap <s-space> <space>

" Custom Functionality

" Custom command for `aws` with completion for profile names
function! AWSProfileCompletion(A,L,P) abort
	return filter(systemlist("awk -F '[][]' '{print $2}' ~/.aws/config | awk 'NF > 0 {print $2}'"),'v:val =~ a:A')
endfunction
command! -nargs=* -complete=customlist,AWSProfileCompletion AWS
			\ <mods> terminal aws --output text --profile <args>
command! -nargs=1 -complete=customlist,AWSProfileCompletion AWSConsole
			\ ! aws-console -p <args>
command! -nargs=1 -complete=customlist,AWSProfileCompletion AWSLogin
			\ ! aws sso login --profile <args>

" GitBrowse takes a dictionary and opens files on remote git repo websites.
function! GitBrowse(args) abort
	let l:branch = len(a:args.branch) ? a:args.branch : 'origin'
	let l:remote = trim(system('git config branch.'..l:branch..'.remote'))
	let l:cmd = 'git browse ' .. ((a:args.range) ? printf("%s %s %s %s",l:remote, a:args.filename, a:args.line1, a:args.line2) : printf("%s %s", l:remote, a:args.filename))
	echom l:cmd
	execute 'silent ! '..l:cmd | redraw!
endfunction
" [G]it [B]rowse to launch repo, branch, & file in the browser
command! -range GB
			\ call GitBrowse({
			\   'branch': trim(system('git rev-parse --abbrev-ref HEAD 2>/dev/null')),
			\   'filename': trim(system('git ls-files --full-name ' .. expand('%'))),
			\   'range': <range>,
			\   'line1': <line1>,
			\   'line2': <line2>,
			\ })
command! GR execute 'lcd '..finddir('.git/..', expand('%:p:h')..';')

" Jira command opens Jira issues in the browser
command! -nargs=? Jira silent ! open $JIRA_URL/<args>

" Custom cmmand for `op` (aka 1password cli) with completion for item names
function! OnePasswordItemCompletion(A,L,P) abort
	return filter(systemlist("op item list --format=json | jq -rc '.[].title'"), 'v:val =~ a:A')
endfunction
command! -nargs=* -complete=customlist,OnePasswordItemCompletion OP <mods> terminal op item get <q-args>

colorscheme pbnj
