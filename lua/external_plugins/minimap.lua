---
-- @file lua/external_plugins/treesitter.lua
--
-- @brief
-- The configuration file for the plugin treesitter
--
-- @author Rezha Adrian Tanuharja
-- @date 2024-08-31
--


return {

  -- Minimap
  {
    'wfxr/minimap.vim',
    run = 'cargo install --locked code-minimap',
    cmd = { 'Minimap', 'MinimapClose', 'MinimapToggle', 'MinimapRefresh' },
    keys = {
      { '<leader>m', ':MinimapToggle<CR>'},
    },

    config = function()
      local success, minimap = pcall(require, 'minimap')
      -- if not success then
      --   vim.notify('Failed to load plugin: minimap')
      --   return
      -- end

      -- minimap.setup {}

      vim.keymap.set('n', '<leader>m', ':MinimapToggle<CR>')

    end,
  },

  -- Code Minimap (Required for minimap.vim)
  {
    'wfxr/code-minimap',
    event = {'BufReadPost', 'BufNewFile'},
  },

}
