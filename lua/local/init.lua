---
-- @file lua/local/init.lua
--
-- @brief
-- The initialization file to load internal plugins
--
-- @author Rezha Adrian Tanuharja
-- @date 2024-10-12
--


local local_plugins = {
  'colors',
  'diagnostics',
  'languageservers',
  'statusline',
}

for _, plugin in pairs(local_plugins) do

  local success, _ = pcall(require, 'local/' .. plugin)
  if not success then
    vim.notify('Failed to load the local plugin ' .. plugin)
  end

end