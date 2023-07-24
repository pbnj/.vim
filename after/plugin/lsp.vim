nnoremap <buffer> <leader>ca <cmd>LspCodeAction<cr>
nnoremap <buffer> <leader>gD <cmd>LspPeekDeclaration<cr>
nnoremap <buffer> <leader>gd <cmd>LspPeekDefinition<cr>
nnoremap <buffer> <leader>gi <cmd>LspPeekImplementation<cr>
nnoremap <buffer> <leader>gr <cmd>LspReferences<cr>
nnoremap <buffer> <leader>gy <cmd>LspPeekTypeDefinition<cr>
nnoremap <buffer> <leader>k <cmd>LspHover<cr>
nnoremap <buffer><expr> <c-j> lsp#scroll(+4)
nnoremap <buffer><expr> <c-k> lsp#scroll(-4)
nnoremap <buffer> ]d <cmd>LspNextDiagnostic<cr>
nnoremap <buffer> [d <cmd>LspPreviousDiagnostic<cr>

let g:lsp_diagnostics_virtual_text_align = "after"
