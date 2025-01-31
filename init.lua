_G.vim = vim
require 'core.keymaps'
require 'core.options'
-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true
-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--   :Lazy update
--
-- NOTE: Here is where you install your plugins.
require('lazy').setup({

  require 'kickstart.plugins.neo-tree',
  require 'kickstart.plugins.colortheme',
  require 'kickstart.plugins.debug',
  require 'kickstart.plugins.telescope',
  require 'kickstart.plugins.indent_line',
  require 'kickstart.plugins.lint',
  require 'kickstart.plugins.bufferline',
  require 'kickstart.plugins.autopairs',
  require 'kickstart.plugins.treesitter',
  require 'kickstart.plugins.gitsigns',
  require 'kickstart.plugins.lualine',
  require 'kickstart.plugins.lsp',
  require 'kickstart.plugins.autocompletion',
  require 'kickstart.plugins.autoformatter',
  require 'kickstart.plugins.whichkey',
  require 'kickstart.plugins.miscellenous',
  require 'kickstart.plugins.alpha',
  require 'kickstart.plugins.trouble',
  require 'kickstart.plugins.markdown-preview',
  require 'kickstart.plugins.obsidian',
  require 'kickstart.plugins.oil',
  require 'kickstart.plugins.supermaven',
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})
