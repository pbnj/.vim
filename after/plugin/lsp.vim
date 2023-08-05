if exists('g:loaded_lsp')

    nnoremap <leader>af <cmd>LspFormat<cr>
    nnoremap <leader>dd <cmd>LspDiagShow<cr>
    nnoremap <leader>gd <cmd>LspGotoDefinition<cr>
    nnoremap <leader>gi <cmd>LspGotoImpl<cr>
    nnoremap <leader>go <cmd>LspOutline<cr>
    nnoremap <leader>gr <cmd>LspShowReferences<cr>
    nnoremap <leader>gt <cmd>LspGotoTypeDef<cr>
    nnoremap <leader>k  <cmd>LspHover<cr>
    nnoremap <leader>K  <cmd>LspShowSignature<cr>

    call LspOptionsSet({
                \ 'aleSupport': v:true,
                \ 'omniComplete': v:true,
                \ 'outlineOnRight': v:true,
                \ })

endif
