return {
    'https://github.com/dense-analysis/ale',
    dependencies = { 'https://github.com/junegunn/vader.vim' },
    config = function()
      vim.g.ale_completion_enabled = 0
      vim.g.ale_disable_lsp = 1
      vim.g.ale_fix_on_save = 1
      vim.g.ale_set_signs = 0
      vim.g.ale_virtualtext_cursor = 0
      vim.g.ale_fixers = {
        ['*'] = { 'trim_whitespace', 'remove_trailing_lines' },
        bash = { 'shfmt' },
        go = { 'goimports', 'gopls' },
        json = { 'prettier' },
        markdown = { 'prettier' },
        python = { 'ruff' },
        rust = { 'rustfmt' },
        terraform = { 'terraform', 'remove_trailing_lines', 'trim_whitespace' },
        yaml = { 'prettier' },
      }
      vim.g.ale_linters = {
        ['github-workflows'] = { 'actionlint', 'yamllint' },
        go = { 'gofmt', 'gopls', 'govet', 'golangci-lint' },
        rust = { 'cargo' },
        terraform = { 'terraform', 'tflint', 'snyk', 'gitleaks' },
      }
    end,
  }
