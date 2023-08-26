require("indent_blankline").setup({ show_current_context = true, show_current_context_start = true })
require("toggleterm").setup({ open_mapping = [[<c-\>]] })
require('Comment').setup()
require('gitsigns').setup()
require('lualine').setup({ options = { icons_enabled = false, component_separators = '|', section_separators = '' } })
require('mason').setup()

require('nvim-treesitter.configs').setup({
        ensure_installed = {
                'awk',
                'bash',
                'dockerfile',
                'gitcommit',
                'git_config',
                'git_rebase',
                'gitignore',
                'go',
                'gomod',
                'gosum',
                'gowork',
                'hcl',
                'html',
                'http',
                'ini',
                'jq',
                'json',
                'lua',
                'make',
                'markdown',
                'markdown_inline',
                'mermaid',
                'python',
                'rust',
                'terraform',
                'toml',
                'vimdoc',
                'vim',
                'vhs',
                'yaml',
        },
        auto_install = false,
        highlight = { enable = true },
        indent = { enable = true },
        incremental_selection = {
                enable = true,
                keymaps = {
                        init_selection = '<c-space>',
                        node_incremental = '<c-space>',
                        scope_incremental = '<c-s>',
                        node_decremental = '<M-space>',
                },
        },
        textobjects = {
                select = {
                        enable = true,
                        lookahead = true,
                        keymaps = {
                                ['aa'] = '@parameter.outer',
                                ['ia'] = '@parameter.inner',
                                ['af'] = '@function.outer',
                                ['if'] = '@function.inner',
                                ['ac'] = '@class.outer',
                                ['ic'] = '@class.inner',
                        },
                },
                move = {
                        enable = true,
                        set_jumps = true,
                        goto_next_start = {
                                [']m'] = '@function.outer',
                                [']]'] = '@class.outer',
                        },
                        goto_next_end = {
                                [']M'] = '@function.outer',
                                [']['] = '@class.outer',
                        },
                        goto_previous_start = {
                                ['[m'] = '@function.outer',
                                ['[['] = '@class.outer',
                        },
                        goto_previous_end = {
                                ['[M'] = '@function.outer',
                                ['[]'] = '@class.outer',
                        },
                },
                swap = {
                        enable = true,
                        swap_next = {
                                ['<leader>a'] = '@parameter.inner',
                        },
                        swap_previous = {
                                ['<leader>A'] = '@parameter.inner',
                        },
                },
        },
})

local on_attach = function(_, bufnr)
        local nmap = function(keys, func, desc)
                if desc then
                        desc = 'LSP: ' .. desc
                end
                vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
        end
        nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
        nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
        nmap('<leader>gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
        nmap('<leader>gr', vim.lsp.buf.references, '[G]oto [R]eferences')
        nmap('<leader>gi', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
        nmap('<leader>gy', vim.lsp.buf.type_definition, '[G]oto T[y]pe Definition')
        nmap('<leader>k', vim.lsp.buf.hover, 'Hover Documentation')
        nmap('<leader>gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
        nmap('[d', vim.diagnostic.goto_prev, 'Goto Previous Diagnostic')
        nmap(']d', vim.diagnostic.goto_next, 'Goto Next Diagnostic')
        vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
                vim.lsp.buf.format()
        end, { desc = 'Format current buffer with LSP' })
end

local servers = {
        lua_ls = {
                Lua = {
                        workspace = { checkThirdParty = false },
                        telemetry = { enable = false },
                },
        },
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local mason_lspconfig = require('mason-lspconfig')
mason_lspconfig.setup({ ensure_installed = vim.tbl_keys(servers) })
mason_lspconfig.setup_handlers({
        function(server_name)
                require('lspconfig')[server_name].setup {
                        capabilities = capabilities,
                        on_attach = on_attach,
                        settings = servers[server_name],
                }
        end,
})

local cmp = require('cmp')
local luasnip = require('luasnip')
require('luasnip.loaders.from_vscode').lazy_load()
luasnip.config.setup({})

cmp.setup({
        snippet = {
                expand = function(args)
                        luasnip.lsp_expand(args.body)
                end,
        },
        mapping = cmp.mapping.preset.insert {
                ['<C-n>'] = cmp.mapping.select_next_item(),
                ['<C-p>'] = cmp.mapping.select_prev_item(),
                ['<C-k>'] = cmp.mapping.scroll_docs(-4),
                ['<C-j>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete {},
                ['<CR>'] = cmp.mapping.confirm {
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = false,
                },
                ['<Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                                cmp.select_next_item()
                        elseif luasnip.expand_or_locally_jumpable() then
                                luasnip.expand_or_jump()
                        else
                                fallback()
                        end
                end, { 'i', 's' }),
                ['<S-Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                                cmp.select_prev_item()
                        elseif luasnip.locally_jumpable(-1) then
                                luasnip.jump(-1)
                        else
                                fallback()
                        end
                end, { 'i', 's' }),
        },
        sources = {
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
                { name = 'buffer' },
                { name = 'path' },
        },
})
