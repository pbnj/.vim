let b:ale_fixers = ['prettier']
setlocal spell

function! ALEInstall() abort
	if executable('brew')
		! brew install node prettier markdownlint
		! npm i -g doctoc
	elseif executable('apt')
		! curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && apt-get install -y nodejs
		! npm i -g doctoc prettier markdownlint-cli
	elseif executable('apk')
		! apk add --no-cache nodejs npm
		! npm i -g doctoc prettier markdownlint-cli
	else
		echoerr "brew or apt or apk not found. cannot install `doctoc`, `prettier`, and/or `markdownlint-cli`."
	endif
endfunction
command! ALEInstall call ALEInstall()

command! TOCGen ! npx doctoc %
command! TOCUpdate ! npx doctoc --update-only %
