---
-- @file lua/plugins/copilot.lua
--
-- @brief
-- The configuration file for the plugin autopairs
--
-- @author Rezha Adrian Tanuharja
-- @date 2024-10-21
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

    vim.g.copilot_no_tab_map = false
    -- vim.api.nvim_set_keymap("i", "<Tab>", 'copilot#Accept("<Tab>")', { silent = true, expr = true })

    vim.g.copilot_filetypes = {
                                ["*"] = true,
                                ["markdown"] = false,
                                ["text"] = false,
                                ["json"] = false
                              }
  end,
}