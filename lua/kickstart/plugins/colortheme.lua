return {
  'folke/tokyonight.nvim',
  priority = 1000, -- Make sure to load this before all other start plugins.
  init = function()
    -- Load the colorscheme
    vim.cmd.colorscheme 'tokyonight-night'

    -- Set initial transparency
    vim.cmd [[
          hi Normal guibg=#1a1b26
          hi NormalFloat guibg=#1a1b26
    ]]
    vim.g.transparent_enabled = true

    -- Function to toggle transparency
    local toggle_transparency = function()
      local is_transparent = vim.g.transparent_enabled

      if is_transparent then
        -- Disable transparency
        vim.cmd [[
          hi Normal guibg=#1a1b26
          hi NormalFloat guibg=#1a1b26
        ]]
        vim.g.transparent_enabled = false
      else
        -- Enable transparency
        vim.cmd [[
          hi Normal guibg=NONE
          hi NormalFloat guibg=NONE
        ]]
        vim.g.transparent_enabled = true
      end
    end

    -- Define a command for toggling transparency
    vim.api.nvim_create_user_command('ToggleTransparency', toggle_transparency, {})

    -- Bind the toggle function to <leader>bg (Space + b + g)
    vim.api.nvim_set_keymap('n', '<leader>bg', ':ToggleTransparency<CR>', { noremap = true, silent = true })
  end,
}
