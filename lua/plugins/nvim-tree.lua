---
-- @file lua/plugins/nvim-tree.lua
--
-- @brief
-- The configuration file for the plugin nvim-tree
--
-- @author Rezha Adrian Tanuharja
-- @date 2024-08-31
--


return {

  -- github repository for nvim-tree
  'kyazdani42/nvim-tree.lua',

  -- load when entering nvim
  keys = {
    { '<leader>e', ':NvimTreeToggle<CR>'},
    { '<leader>1', '<C-w>w' },
  },

  config = function()

    -- use protected call to attempt to load plugin
    local success, nvim_tree = pcall(require, 'nvim-tree')
    if not success then
      vim.notify('Failed to load plugin: nvim-tree')
      return
    end

    nvim_tree.setup {

      update_focused_file = {
        enable = true,
        update_cwd = false,  --make it true to go into selected file's dir only
      },

      renderer = {

        root_folder_modifier = ':t',

        icons = {

          diagnostics_placement = 'signcolumn',
          git_placement = 'after',

          -- use the simplest possible symbols
          glyphs = {

            default = 'x',
            symlink = 's',

            folder = {
              arrow_open = '',
              arrow_closed = '',
              default = '[x]',
              open = ']x[',
              empty = '[ ]',
              empty_open = '] [',
              symlink = '[s]',
              symlink_open = ']s[',
            },

            git = {
              unstaged = '*',
              staged = '',
              deleted = '',
              unmerged = '',
              renamed = '',
              untracked = '',
              ignored = '',
            },

          },

        },

      },

      diagnostics = {

        enable = true,
        show_on_dirs = true,

        icons = {
          hint = '?',
          info = '*',
          warning = '!',
          error = '!',
        },

      },

      git = {

        enable = true,
        show_on_dirs = true,
        show_on_open_dirs = false,

      },

      -- adjust the window size
      view = {
        width = 32,
        side = 'left',
      },

      -- do not show hidden files
      filters = {
        dotfiles = true,
      },

    }

    -- keymap to open the project tree
    vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>')
    vim.keymap.set('n', '<leader>`', ':NvimTreeFocus<CR>')
    -- vim.keymap.set('n', '<leader>1', '<C-w>w')

    -- open nvimtree
    -- vim.api.nvim_create_autocmd("BufEnter", {
    --   callback = function()
    --     if vim.fn.isdirectory(vim.fn.expand('%:p:h')) == 1 then
    --       vim.cmd("NvimTreeOpen")
    --     end
    --   end
    -- })

    vim.api.nvim_set_hl(0, 'NvimTreeFolderIcon', { fg = '#777777'})

  end,
}
