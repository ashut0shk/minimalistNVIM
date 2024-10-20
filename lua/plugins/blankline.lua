---
-- @file lua/plugins/blankline.lua
--
-- @brief
-- The configuration file for the plugin blankline
--
-- @author Rezha Adrian Tanuharja
-- @date 2024-08-31
--


return {

  'lukas-reineke/indent-blankline.nvim',

  ft = { 'python', 'lua', 'typescript', 'javascript' },

  config = function()

    local success, blankline = pcall(require, 'ibl')
    if not success then
      vim.notify('Failed to load plugin: blankline')
      return
    end

    blankline.setup {
      indent = {char = '│'},
      exclude = {},
    }

  end,

}
