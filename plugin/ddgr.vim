if !executable('ddgr') || exists('g:loaded_ddgr') | finish | endif
let g:loaded_ddgr = 1

function! s:ddgr_bang_completion(A,L,P) abort
  return filter(
        \ [ 'bangs'
        \ , 'archiveweb', 'archiveis'
        \ , 'aws', 'cloudformation', 'gcp', 'azure'
        \ , 'devdocs'
        \ , 'dictionary', 'mw', 'mwd', 'dmw', 'd'
        \ , 'dockerhub','dhdocs', 'kubernetes'
        \ , 'gh', 'ghcode', 'ghio', 'ghrepo', 'ght', 'ghtopic', 'ghuser', 'gist'
        \ , 'godoc', 'gopkg'
        \ , 'google', 'g', 'gdocs', 'gsheets', 'gslides', 'gmaps', 'amaps', 'gmail', 'gdefine', 'translate'
        \ , 'ker'
        \ , 'man', 'tldr', 'chtsh'
        \ , 'mysql', 'postgres'
        \ , 'node', 'npm', 'typescript', 'mdn'
        \ , 'python', 'py3'
        \ , 'rust', 'rustdoc', 'rce', 'rclippy', 'crates', 'docs.rs'
        \ , 'stackoverflow'
        \ , 'tmg'
        \ , 'vimw'
        \ , 'yt', 'reddit', 'twitch', 'devto', 'spotify'
        \ ], 'v:val =~ a:A')
endfunction

command! -nargs=* -complete=customlist,s:ddgr_bang_completion DDGR
      \ ! ddgr --expand <args>
