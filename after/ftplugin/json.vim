function! ALEInstall() abort
	if executable('brew')
		! brew install jq yq
	elseif executable('apt')
		! apt update && apt install -y jq
	elseif executable('go')
		! go install github.com/mikefarah/yq/v4@latest
	elseif executable('apk')
		! apk add --no-cache yq
	elseif executable('wget')
		! wget https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 -O /usr/bin/yq && chmod +x /usr/bin/yq
	endif
endfunction
command! ALEInstall call ALEInstall()
