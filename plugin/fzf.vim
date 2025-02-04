if !executable('fzf') || exists('g:loaded_fzf_custom') | finish | endif
let g:loaded_fzf_custom = 1

let g:fzf_layout = { 'down': '40%' }
nnoremap <leader>/       <cmd>Rg<cr>
nnoremap <leader>:       <cmd>Commands<cr>
nnoremap <leader>;       <cmd>History:<cr>
nnoremap <leader><space> <cmd>History<cr>
nnoremap <leader>bb      <cmd>Buffers<cr>
nnoremap <leader>ff      <cmd>Files<cr>
nnoremap <leader>fF      <cmd>Files!<cr>
nnoremap <leader>fw      :Rg <c-r><c-w><cr>
nnoremap <leader>gg      <cmd>GFiles<cr>
nnoremap <leader>gs      <cmd>GFiles?<cr>
nnoremap <leader>gS      <cmd>GFiles!?<cr>
nnoremap <leader>hh      <cmd>Helptags<cr>
nnoremap <leader>tt      <cmd>BTags<cr>
nnoremap <leader>tT      <cmd>Tags<cr>
vnoremap <leader>fw      y:Rg <c-r>0<cr>

" FURLs fuzzy finder & launcher for URLs in any vim buffer
"
" Test data
" http://www.one.com " should match http
" https://www.two.com " should match https
" https://three@three:three.com " should match connection strings
" (https://four.com) " should extract url from parens
" [https://five.com] " should extract url from brackets
" {https://six.com} " should extract url from braces
" <https://six.com> " should extract url from angle brackets
" 'https://seven.com' " should extract url from single quotes
" "https://eight.com" " should extract url from double quotes
" https://nine.com?foo=bar&baz=qux " should match query parameters
command! FURLs
      \ call fzf#run(
      \   fzf#wrap({
      \     'source': getline(1,'$')->map({_,v -> matchstr(v,'\chttp\(s\)\?:\/\/[0-9a-z.@:?=&/\-\_$#%]\+')})->filter('!empty(v:val)')->sort()->uniq(),
      \     'sink': executable('open') ? '!open' : '!xdg-open',
      \     'options': '--multi --prompt=URLs\>\ ',
      \   })
      \ )

" FProjects fuzzy finds local projects & opens them in a new vim buffer
command! -nargs=? FProjects Files ~/Projects
nnoremap <leader>fp <cmd>Projects<cr>

" FNotes fuzzy finds and opens notes in Vim
command! FNotes
      \ call fzf#run(
      \   fzf#wrap({
      \     'source': readdir(expand('~/.notes'))->map('expand("~/.notes/")..v:val'),
      \     'sink': 'edit',
      \     'options': printf('--preview="%s"', executable('bat') ? 'bat {}' : 'cat -n {}'),
      \   })
      \ )
nnoremap <leader>fn <cmd>Notes<cr>

" FNotesLines fuzzy finds contents within notes and opens them in Vim
command! FNotesLines call fzf#vim#grep('rg --vimgrep . ~/.notes', {'options': printf('--preview="%s"', executable('bat') ? 'bat {1}' : 'cat -n {1}')})

" FAWSConsole fuzzy finds and opens AWS accounts in web browser.
" Arguments:
"   `profile` is the aws config profile string that must be in either pattern:
"       <account-id>/<account-alias>/<permission-set>
"       <account-alias>/<account-id>/<permission-set>
function! s:aws_console(profile) abort
  " extract accound id (1st or 2nd element) from profile
  let l:account_id = matchstr(a:profile, '\d\{12\}')
  " extract permission set (3rd element) from profile
  let l:permission_set = split(a:profile, '/')[2]
  " construct url
  let l:aws_sso_shortcut_url = printf('%s/console?account_id=%s&role_name=%s', $AWS_SSO_ACCESS_PORTAL_URL, l:account_id, l:permission_set)
  let l:cmd = 'open'
  echom l:aws_sso_shortcut_url
  call system(printf('%s %s', l:cmd, shellescape(l:aws_sso_shortcut_url)))
endfunction
command! -nargs=? FAWSConsole
      \ call fzf#run(
      \   fzf#wrap({
      \     'source': 'aws configure list-profiles',
      \     'sink': function('s:aws_console'),
      \     'options': ['--prompt=AWS Console> ', printf('--query=%s', <q-args>)],
      \   })
      \ )
nnoremap <leader>fa <cmd>FAWSConsole<cr>
vnoremap <leader>fa      y:FAWSConsole <c-r>0<cr>
