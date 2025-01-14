function! s:docker_image_tag_completion(findstart, base) abort
  let l:line = getline('.')->strpart(0, col('.') - 1)
  let l:context = l:line->matchstrpos('FROM\s\+[0-9a-zA-Z-_/:]\+')
  if a:findstart == 1
    if l:context[0]->empty() || !executable('curl')
      return -2
    endif
    if l:context[0] =~ ':'
      return l:line->matchstrpos(':')[1] + 1
    else
      return l:line->matchstrpos('[0-9a-zA-Z-_/]\+$')[1]
    endif
  endif
  let l:items = []
  let l:image_name = l:context[0]->matchstr('\v([a-zA-Z0-9-_/:])+$')
  if empty(l:image_name)
    let l:image_name = a:base
  endif
  if l:image_name !~# '/'
    let l:image_name = 'library/'.l:image_name
  endif
  if l:image_name =~ ':'
    let l:image_parts = l:image_name->split(':')
    let l:image_name = l:image_parts[0]
    let l:image_version = ""
    if len(l:image_parts) == 2
      let l:image_version = l:image_parts[1]
    endif
    let l:tags = printf('curl --silent https://hub.docker.com/v2/repositories/%s/tags?page_size=100', l:image_name)->system()->json_decode()
    for l:tag in l:tags.results->map('v:val.name')
      call add(l:items, #{abbr: l:tag, word: l:tag, kind: '[docker tag]'})
    endfor
    if empty(l:image_version)
      return l:items
    else
      return l:items->filter('v:val.word =~ l:image_version')
    endif
  else
    let l:images = printf('docker search --format=''{{.Name}}'' %s', l:image_name)->systemlist()
    for l:image in l:images
      call add(l:items, #{abbr: l:image, word: l:image, kind: '[docker image]'})
    endfor
    return l:items->filter('v:val.word =~ split(l:image_name,"library/")[0]')
  endif
  if !empty(l:image_name)
  else
    return l:items
  endif
endfunction

let &l:completefunc = 's:docker_image_tag_completion'
