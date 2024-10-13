---
-- @file init.lua
--
-- @brief
-- The starting point of the Neovim config
--
-- @author Rezha Adrian Tanuharja
-- @date 2024-10-12
--

vim.g.python3_host_prog = 'C:/Users/askumar/.pyenv/pyenv-win/shims/python'
local config_files = {
  'commands',
  'globals',
  'keymaps',
  'local',
  'options',
  'plugins',
  'snippets',
}

for _, file in pairs(config_files) do

  local success, _ = pcall(require, file)
  if not success then
    vim.notify('Failed to load a config file ' .. file)
    break
  end

end
