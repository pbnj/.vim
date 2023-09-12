return {
  'https://github.com/junegunn/fzf.vim',
  dependencies = {
    'https://github.com/junegunn/fzf',
    dir = '~/.fzf',
    build = './install --all',
  },
  config = function()
    vim.keymap.set('n', '<leader>/', '<cmd>Rg<cr>', { noremap = true })
    vim.keymap.set('n', '<leader><space>', '<cmd>History<cr>', { noremap = true })
    vim.keymap.set('n', '<leader>?', '<cmd>Helptags<cr>', { noremap = true })
    vim.keymap.set('n', '<leader>bb', '<cmd>Buffers<cr>', { noremap = true })
    vim.keymap.set('n', '<leader>cc', '<cmd>Quickfix<cr>', { noremap = true })
    vim.keymap.set('n', '<leader>fb', '<cmd>BCommits<cr>', { noremap = true })
    vim.keymap.set('n', '<leader>fc', '<cmd>Commits<cr>', { noremap = true })
    vim.keymap.set('n', '<leader>ff', '<cmd>Files<cr>', { noremap = true })
    vim.keymap.set('n', '<leader>fg', '<cmd>GFiles<cr>', { noremap = true })
    vim.keymap.set('n', '<leader>fs', '<cmd>GFiles?<cr>', { noremap = true })
    vim.keymap.set('n', '<leader>ll', '<cmd>Loclist<cr>', { noremap = true })
  end,
}
