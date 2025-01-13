function! s:docker_tag_completion(findstart, base) abort
  if a:findstart
    let s:startcol = col('.') - 1
    while s:startcol > 0 && getline('.')[s:startcol - 1] =~ '\a'
      let s:startcol -= 1
    endwhile
    return s:startcol
  endif
  let l:from = getline(1, '$')->filter('v:val =~ "^FROM"')[0]
  let l:image_name = l:from->split(' ')[1]->split(':')[0]
  if l:image_name !~# '/'
    let l:image_name = 'library/'.l:image_name
  endif
  let l:tags = json_decode(system(printf('curl --silent https://hub.docker.com/v2/repositories/%s/tags', l:image_name)))
  let s:matches = l:tags.results->map('v:val.name')
  if a:base->len() == 0
    return s:matches
  endif
  return s:matches->matchfuzzy(a:base)
endfunction

let &l:completefunc = 's:docker_tag_completion'
