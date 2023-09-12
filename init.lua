vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup('pbnj.plugins', {})

-- options
vim.g.netrw_keepdir = false
vim.opt.breakindent = true
vim.opt.clipboard = 'unnamedplus'
vim.opt.completeopt = { 'menuone', 'noselect' }
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.inccommand = 'split'
vim.opt.list = true
vim.opt.listchars = { tab = '| ', trail = '·', nbsp = '·', precedes = '<', extends = '>' }
vim.opt.mouse = 'a'
vim.opt.number = true
vim.opt.path = '.,,'
vim.opt.signcolumn = 'yes'
vim.opt.smartcase = true
vim.opt.smarttab = true
vim.opt.swapfile = false
vim.opt.timeout = true
vim.opt.timeoutlen = 300
vim.opt.undofile = true
vim.opt.updatetime = 250
vim.opt.wildignorecase = true
vim.opt.wrap = false

vim.opt.wildignore = {
  'LICENSE', 'tags', '.git', '.mypy_cache', '__pycache__', 'target', 'dist', 'node_modules', 'vendor', 'cache',
  '.terraform'
}

-- mappings
vim.keymap.set('c', '<c-n>', '<c-Down>', { noremap = true })
vim.keymap.set('c', '<c-p>', '<c-Up>', { noremap = true })
vim.keymap.set('n', '<leader>cd', '<cmd>lcd %:p:h<cr>', { noremap = true })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, {})
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, {})
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true, noremap = true })
vim.keymap.set({ 'n', 'v' }, 'Q', '<Nop>', { silent = true, noremap = true })

local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

vim.cmd.colorscheme('tokyonight')
-- vim: ts=2 sts=2 sw=2 et:
