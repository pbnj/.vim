setlocal spell

function! ALEInstall() abort
	if executable('brew')
		! brew install node
		terminal npm i -g doctoc prettier markdownlint-cli
	elseif executable('apt')
		! curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && apt-get install -y nodejs
		terminal npm i -g doctoc prettier markdownlint-cli
	elseif executable('apk')
		! apk add --no-cache nodejs npm
		terminal npm i -g doctoc prettier markdownlint-cli
	endif
endfunction
command! ALEInstall call ALEInstall()

command! -nargs=* Doctoc ! npx doctoc --update-only <args>
