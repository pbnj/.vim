if exists('g:loaded_ale')
    function! LinterStatus() abort
        let l:counts = ale#statusline#Count(bufnr(''))
        let l:all_errors = l:counts.error + l:counts.style_error
        let l:all_non_errors = l:counts.total - l:all_errors
        return l:counts.total == 0 ? '' : printf(' W:%d E:%d ', all_non_errors, all_errors)
    endfunction

    " https://github.com/dense-analysis/ale/issues/4569
    let &omnifunc = 'ale#completion#OmniFunc'
    let &statusline ..= '%#ALEError#%{LinterStatus()}%*'

    nnoremap <leader>af <cmd>ALEFix<cr>
    nnoremap <leader>ca <cmd>ALECodeAction<cr>
    nnoremap <leader>gd <cmd>ALEGoToDefinition<cr>
    nnoremap <leader>gi <cmd>ALEGoToImplementation<cr>
    nnoremap <leader>gr <cmd>ALEFindReferences<cr>
    nnoremap <leader>gt <cmd>ALEGoToTypeDefinition<cr>
    nnoremap <leader>k <cmd>ALEHover<cr>
    nnoremap [d <cmd>ALEPrevious<cr>
    nnoremap ]d <cmd>ALENext<cr>

endif
