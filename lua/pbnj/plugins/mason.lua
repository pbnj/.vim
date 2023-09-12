return {
  'https://github.com/williamboman/mason.nvim',
  dependencies = {
    'https://github.com/neovim/nvim-lspconfig',
    'https://github.com/hrsh7th/cmp-nvim-lsp',
    'https://github.com/folke/neodev.nvim',
    'https://github.com/williamboman/mason-lspconfig.nvim',
    { 'https://github.com/j-hui/fidget.nvim', tag = 'legacy', opts = {} },
  },
  config = function()
    require('mason').setup()
    require('neodev').setup()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
    local mason_lspconfig = require('mason-lspconfig')
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
      vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        vim.lsp.buf.format()
      end, { desc = 'Format current buffer with LSP' })
  end
  local servers = {
    lua_ls = {
      Lua = {
        diagnostics = { globals = { 'vim' } },
        workspace = { checkThirdParty = false },
        telemetry = { enable = false },
      },
    },
  }
  mason_lspconfig.setup({
      ensure_installed = vim.tbl_keys(servers),
      automatic_installation = true,
    })
  mason_lspconfig.setup_handlers({
      function(server_name)
        require('lspconfig')[server_name].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = servers[server_name],
          })
      end,
    })
  end,
}
