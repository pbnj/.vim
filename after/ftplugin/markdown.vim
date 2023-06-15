setlocal spell

function! ALEInstall() abort
	if executable('brew')
		! brew install node
		! npm i -g doctoc prettier markdownlint-cli
	elseif executable('apt')
		! curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && apt-get install -y nodejs
		! npm i -g doctoc prettier markdownlint-cli
	elseif executable('apk')
		! apk add --no-cache nodejs npm
		! npm i -g doctoc prettier markdownlint-cli
	endif
endfunction
command! ALEInstall call ALEInstall()
