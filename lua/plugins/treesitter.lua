---
-- @file lua/plugins/treesitter.lua
--
-- @brief
-- The configuration file for the plugin treesitter
--
-- @author Rezha Adrian Tanuharja
-- @date 2024-08-31
--


return {

  'nvim-treesitter/nvim-treesitter',

  event = {'BufReadPost', 'BufNewFile'},

  build = ':TSUpdate',
  main = 'nvim-treesitter.configs',

  config = function()

    local success, treesitter = pcall(require, 'nvim-treesitter.configs')
    if not success then
      vim.notify('Failed to load plugin: treesitter')
      return
    end

    treesitter.setup {
      ensure_installed = { 'python', 'typescript', 'javascript', 'lua', 'html', 'css', 'bicep', 'yaml' },
      sync_install = false,
      ignore_install = {},
      incremental_selection = { enable = true },
      textobjects = { enable = true },
      highlight = {
        enable = true,
        disable = function(_, bufnr)
          return vim.api.nvim_buf_line_count(bufnr) > 1500
        end,
      },
      indent = { enable = true },
      fold = { enable = true },
    }

    vim.opt['foldmethod'] = 'expr'
    vim.opt['foldexpr'] = 'nvim_treesitter#foldexpr()'
    vim.opt['foldlevel'] = 99 -- Start unfolded

  end,

}
