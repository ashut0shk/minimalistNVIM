---
-- @file init.lua
--
-- @brief
-- The starting point of the Neovim config
--
-- @author Rezha Adrian Tanuharja
-- @date 2024-10-12
--


local config_files = {
  'local',
  'plugins',
  'snippets',
  'globals',
  'keymaps',
  'options',
}

for _, file in pairs(config_files) do

  local success = pcall(require, file)
  if not success then
    vim.notify('Failed to load a config file ' .. file)
    break
  end

end
