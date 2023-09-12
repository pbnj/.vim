return {
  'https://github.com/tpope/vim-fugitive',
  dependencies = { 'https://github.com/tpope/vim-rhubarb' },
  config = function()
    vim.keymap.set('n', '<leader>gg', '<cmd>Git<cr>', { noremap = true })
    vim.keymap.set('n', '<leader>gw', '<cmd>Gwrite<cr>', { noremap = true })
  end,
}
