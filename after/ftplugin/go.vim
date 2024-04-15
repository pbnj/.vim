" go install golang.org/x/tools/cmd/goimports@latest
if executable('goimports')
  let &l:formatprg = 'goimports'
else
  let &l:formatprg = 'gofmt'
endif

" TODO: command to generate go tests
