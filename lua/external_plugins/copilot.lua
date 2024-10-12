---
-- @file lua/external_plugins/copilot.lua
--
-- @brief
-- The configuration file for the plugin autopairs
--
-- @author Rezha Adrian Tanuharja
-- @date 2024-08-31
--


return {

  'github/copilot.vim',

  event = 'InsertEnter',

  config = function()

    -- local success, copilot = pcall(require, 'copilot')
    -- if not success then
    --   vim.notify('Failed to load plugin: copilot')
    --   return
    -- end

    vim.g.copilot_no_tab_map = true
    vim.g.copilot_filetypes = {
                                ["*"] = true,
                                ["markdown"] = false,
                                ["text"] = false,
                                ["json"] = false
                              }
  end,
}
