---
-- @file lua/diagnostics.lua
--
-- @brief
-- The file to set Neovim's builtin diagnostic capabilities
--
-- @author Rezha Adrian Tanuharja
-- @date 2024-10-12
--


vim.diagnostic.config {

  virtual_text = true,
  severity_sort = true,

  signs = {

    text = {
      [vim.diagnostic.severity.ERROR] = '',
      [vim.diagnostic.severity.WARN] = '',
      [vim.diagnostic.severity.HINT] = '',
      [vim.diagnostic.severity.INFO] = '',
    },

    linehl = {
      [vim.diagnostic.severity.ERROR] = 'ErrorMsg',
      [vim.diagnostic.severity.WARN] = 'None',
      [vim.diagnostic.severity.HINT] = 'None',
      [vim.diagnostic.severity.INFO] = 'None',
    },

    numhl = {
      [vim.diagnostic.severity.ERROR] = 'ErrorMsg',
      [vim.diagnostic.severity.WARN] = 'WarningMsg',
      [vim.diagnostic.severity.HINT] = 'DiagnosticHint',
      [vim.diagnostic.severity.INFO] = 'DiagnosticHint',
    },

  },

  float = {
    title = 'Diagnostic',
    header = '',
    border = 'single',
    scope = 'line',
  },

}

vim.opt['signcolumn'] = 'yes'

vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<return>')
vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<return>')
vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<return>')

-- removes underline
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineError', { sp = 'None'} )
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineWarn', { sp = 'None'} )
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineHint', { sp = 'None'} )
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineInfo', { sp = 'None'} )
