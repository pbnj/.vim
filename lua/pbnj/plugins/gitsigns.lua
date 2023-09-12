return {
  'https://github.com/lewis6991/gitsigns.nvim',
  opts = {
    on_attach = function(bufnr)
      vim.keymap.set('n', '[g', require('gitsigns').prev_hunk, { buffer = bufnr })
      vim.keymap.set('n', ']g', require('gitsigns').next_hunk, { buffer = bufnr })
      vim.keymap.set('n', '<leader>gh', require('gitsigns').preview_hunk, { buffer = bufnr })
    end,
  },
}
