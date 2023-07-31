let &l:keywordprg = ':!ddgr golang'

let b:ale_fixers = ['goimports', 'gopls']
let b:ale_linters = ['gofmt', 'gopls', 'govet', 'golangci-lint']

if exists('g:loaded_ale')
	function! ALEInstall() abort
		if executable('brew')
			! brew install go gopls golangci-lint gotests
			! go install golang.org/x/tools/cmd/goimports@latest
		elseif executable('go')
			! go install golang.org/x/tools/gopls@latest golang.org/x/tools/cmd/goimports@latest github.com/cweill/gotests/...@latest
			! curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $(go env GOPATH)/bin v1.53.2
		else
			echoerr "brew and go not found. cannot install go tools."
		endif
	endfunction
	command! ALEInstall call ALEInstall()
endif

if exists('g:loaded_lsp')
	call LspAddServer([#{ name: 'golang', filetype: ['go', 'gomod'], path: 'gopls', args: ['serve'], syncInit: v:true }])
endif
