let &l:keywordprg = printf(':!ddgr %s', &filetype)

let b:ale_fixers = ['jq']

function! ALEInstall() abort
	if executable('brew')
		! brew install jq
	elseif executable('apt')
		! apt update && apt install -y jq
	elseif executable('apk')
		! apk add --no-cache jq
	else
		echoerr "brew, apt, and apk not found. cannot install `jq`."
	endif
endfunction
command! ALEInstall call ALEInstall()
