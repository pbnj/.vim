let &l:keywordprg = printf(':!ddgr %s', &filetype)
let b:ale_fixers = ['prettier']

setlocal spell

command! TOCGen ! npx doctoc %
command! TOCUpdate ! npx doctoc --update-only %

function! ALEInstall() abort
	" ! curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && apt-get install -y nodejs
	" ! apk add --no-cache nodejs npm

	" prettier
	if !executable('prettier')
		if executable('brew')
			! brew install prettier
		elseif executable('npm')
			! npm install --global prettier
		endif
	endif

	" markdownlint-cli
	if !executable('markdownlint-cli')
		if executable('brew')
		! brew install markdownlint-cli
		elseif executable('npm')
			! npm install --global markdownlint-cli
		endif
	endif

	" doctoc
	if !executable('doctoc')
		if executable('npm')
			! npm i -g doctoc
		endif
	endif

	" marksman
	if !executable('marksman')
		if executable('brew')
			! brew install marksman
		endif
	endif
endfunction
command! ALEInstall call ALEInstall()

if exists('g:loaded_lsp')
	call LspAddServer([#{name: 'markdown', filetype: ['markdown'], path: '/opt/homebrew/bin/marksman', args: ['server'], syncInit: v:true}])
endif
