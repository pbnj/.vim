let &l:keywordprg = printf(':!ddgr %s', &filetype)
let b:ale_fixers = ['prettier']

setlocal spell

command! TOCGen ! npx doctoc %
command! TOCUpdate ! npx doctoc --update-only %

if exists('g:loaded_ale')
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
	command! ALEInstall call ALEInstall()
endif
