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
    nnoremap [d <cmd>LspDiagPrev<cr>
    nnoremap ]d <cmd>LspDiagNext<cr>

    call lsp#options#OptionsSet({
                \ 'omniComplete': v:true,
                \ 'outlineOnRight': v:true,
                \ })
                " \ 'autoPopulateDiags': v:true,

endif
