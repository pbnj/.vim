if exists('g:loaded_mucomplete')

  " function! GHIssuesCompletion() abort
  "   call complete(col('.'), extend(systemlist('gh issue list --json number --jq .[].number'), systemlist('gh pr list --json number --jq .[].number')))
  "   return ''
  " endfunction
  " function! GHUsersCompletion() abort
  "   call complete(col('.'), systemlist('gh api repos/{owner}/{repo}/contributors --jq .[].login'))
  "   return ''
  " endfunction

  " let g:mucomplete#can_complete = {}
  " let g:mucomplete#can_complete.default = {}
  " let g:mucomplete#can_complete.default.ghi = { t -> t is# '#' }
  " let g:mucomplete#can_complete.default.ghu = { t -> t is# '@' }

  " let g:mucomplete#user_mappings = {}
  " let g:mucomplete#user_mappings.ghi = "\<c-r>=GHIssuesCompletion()\<cr>"
  " let g:mucomplete#user_mappings.ghu = "\<c-r>=GHUsersCompletion()\<cr>"

endif
