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

  local group_styles = {

    ['Comment']       = { fg = '#777777' },
    ['Identifier']    = { fg = '#DDDDDD', bold = true },
    ['Statement']     = { fg = '#EEEEEE', bold = true },

    ['Question']      = { fg = '#666666' },
    ['Directory']     = { fg = '#777777' },

    ['MsgSeparator']  = { fg = '#EEEEEE', bg = '#444444' },
    ['MoreMsg']       = { fg = '#EEEEEE', bg = '#444444' },
    ['QuickFixLine']  = { fg = '#EEEEEE', bg = '#444444' },
    ['StatusLine']    = { fg = '#888888', bg = '#222222' },
    ['NormalFloat']   = { bg = 'None' },

    ['Folded']        = { fg = '#444444' },
    ['MatchParen']    = { fg = '#FFFFFF', bold = true },
    ['WinSeparator']  = { fg = '#444444' },

    ['Search']        = { fg = '#000000', bg = '#777777' },
    ['CurSearch']     = { fg = '#000000', bg = '#AAAAAA' },

    ['DiagnosticUnnecessary'] = { fg = '#BBBBBB' },

  }

  if opts.flavour == 'color' then

    group_styles['Normal']          = { fg = '#CCCCCC', bg = 'None' }
    group_styles['String']          = { fg = '#849994' }
    group_styles['Type']            = { fg = '#7A7E82', bold = true }
    group_styles['Special']         = { fg = '#7A7E82', bold = true }
    group_styles['Function']        = { fg = '#FCE8D7' }

    group_styles['@variable']       = { fg = '#B9B9B9' }

    group_styles['DiagnosticWarn']  = { fg = '#000000', bg = 'NvimLightYellow', bold = true }
    group_styles['DiagnosticError'] = { fg = '#000000', bg = 'NvimLightRed', bold = true }
    group_styles['DiagnosticInfo']  = { fg = '#000000', bg = '#D3EDE7', bold = true }

  else

    group_styles['Normal']          = { fg = '#CCCCCC', bg = 'None' }
    group_styles['String']          = { fg = '#BBBBBB' }
    group_styles['Function']        = { fg = '#BBBBBB' }
    group_styles['Special']         = { fg = '#BBBBBB', bold = true }

  end

  for group, style in pairs(group_styles) do
    vim.api.nvim_set_hl(0, group, style)
  end


end

return M
