" Compilers command fuzzy finds & runs multiple compilers concurrently
function! RunCompilers(args) abort
  for l:c in a:args
    let l:compiler = fnamemodify(l:c, ':t:r')
    execute ':compiler ' . l:compiler
    execute ':Make'
  endfor
endfunction

function! FZFCompiler(args) abort
  if empty(a:args)
    call fzf#run( fzf#wrap( {'source': split(globpath(&rtp, 'compiler/*.vim'),"\n"), 'sinklist': function('RunCompilers'), 'options': '--multi --preview ''cat {}''' } ) )
  else
    call RunCompilers(a:args)
  endif
endfunction
function! CompilerCompletion(A,L,P) abort
  return globpath(&rtp, 'compiler/*.vim')->split('\n')->map('fnamemodify(v:val, ":t:r")')->filter('v:val =~ a:A')
endfunction

command! -nargs=* -complete=customlist,CompilerCompletion Compilers call FZFCompiler(split(<q-args>, ' '))

" URLs command fuzzy finds URLs & launches them in default browser
command! URLs call fzf#run( fzf#wrap( {'source': map(filter(uniq(split(join(getline(1,'$'),' '),' ')), 'v:val =~ "http"'), {k,v->substitute(v,'\(''\|)\|"\|,\)','','g')}), 'sink': executable('open') ? '!open' : '!xdg-open', 'options': '--multi --prompt=URLs\>\ '}))

" Projects command fuzzy finds directories containing `.git/` and opens them
" in vim
command! Projects call fzf#run( fzf#wrap( {'source': 'find "${HOME}" -type d -name .git -execdir test -d ''.git'' \; -print -prune | xargs dirname' } ) )
