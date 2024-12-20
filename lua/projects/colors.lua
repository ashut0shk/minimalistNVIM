---
-- @file lua/projects/colors.lua
--
-- @brief
-- The file to set highlight group's colors
--
-- @author Rezha Adrian Tanuharja
-- @date 2024-10-12
--


local M = {}

M.setup = function(opts)

  local group_styles = {}

  if opts.flavour == 'grayscale' then

    group_styles = {

      ['Normal']        = { fg = '#cccccc', bg = 'None' },
      ['Comment']       = { fg = '#777777' },
      ['String']        = { fg = '#bbbbbb' },
      ['Function']      = { fg = '#bbbbbb' },
      ['Identifier']    = { fg = '#dddddd', bold = true },
      ['Special']       = { fg = '#bbbbbb' },
      ['Question']      = { fg = '#666666' },
      ['Directory']     = { fg = '#777777' },

      ['MsgSeparator']  = { fg = '#eeeeee', bg = '#444444' },
      ['MoreMsg']       = { fg = '#eeeeee', bg = '#444444' },
      ['QuickFixLine']  = { fg = '#eeeeee', bg = '#444444' },
      ['StatusLine']  = { fg = '#888888', bg = '#222222' },
      ['NormalFloat'] = { bg = 'None' },

      ['Folded']        = { fg = '#444444' },
      ['MatchParen']    = { fg = '#ffffff', bold = true },
      ['WinSeparator']  = { fg = '#444444' },

      ['Search']        = { fg = '#000000', bg = '#777777' },
      ['CurSearch']     = { fg = '#000000', bg = '#aaaaaa' },

      ['DiagnosticUnnecessary'] = { fg = '#bbbbbb' },

    }

  end

  for group, style in pairs(group_styles) do
    vim.api.nvim_set_hl(0, group, style)
  end


end

return M
