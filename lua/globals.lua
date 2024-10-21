---
-- @file lua/globals.lua
--
-- @brief
-- The configuration file to define global variables
--
-- @author Rezha Adrian Tanuharja
-- @date 2024-10-21
--

-- list of all global variables
local variables = {
  loaded_perl_provider = 0,         -- this configuration does not use perl
  mapleader = ' ',                  -- space is a global leader key
  maplocalleader = ' ',             -- space is a local leader key as well
  python3_host_prog = 'C:/Users/askumar/.pyenv/pyenv-win/shims/python'
}

-- set all global variables
for variable, value in pairs(variables) do
  vim.g[variable] = value
end

-- Auto-save the session when exiting Neovim
vim.cmd([[
  autocmd VimLeavePre * mksession! ~/.config/nvim/session.vim
]])

-- Automatically load the session on startup if it exists
if vim.fn.filereadable(vim.fn.expand("~/.config/nvim/session.vim")) == 1 then
  vim.cmd("source ~/.config/nvim/session.vim")
end
