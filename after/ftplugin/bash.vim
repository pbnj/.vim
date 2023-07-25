let &l:keywordprg = printf(':!ddgr %s', &filetype)

let b:ale_fixers = ['shfmt']
