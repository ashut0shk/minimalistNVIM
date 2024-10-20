---
-- @file lua/statusline.lua
--
-- @brief
-- The configuration file to set a custom statusline
--
-- @author Rezha Adrian Tanuharja
-- @date 2024-10-03
--


-- a function to obtain and format the current git branch

local function git_branch()

  local branch = vim.b.gitsigns_head

  if branch == nil then
    return ' -- '
  end

  local added = vim.b.gitsigns_status_dict.added or 0
  local changed = vim.b.gitsigns_status_dict.changed or 0
  local removed = vim.b.gitsigns_status_dict.removed or 0

  return '%#statusline_branch# ' .. branch .. ' +' .. added .. ' -' .. removed .. ' ~' .. changed .. ' '

end


-- a function to obtain and format the file name

local function file_name()

  local filename = vim.fn.expand('%:t')
  if filename == '' then
    filename = '[no name]'
  end

  if string.match(filename, 'NvimTree') then
    filename = 'NvimTree'
  end

  -- change highlight group based on if the file has been modified
  local highlight_group = vim.bo.modified and filename ~= '[no name]' and 'statusline_modifiedfile' or 'statusline_file'

  return '%#' .. highlight_group .. '# ' .. filename .. ' '

end


-- a function to obtain and format the current mode

local function current_mode()

  local mode = vim.fn.mode()

  local mode_aliases = {
    n = 'n',
    i = 'i',
    v = 'v',
    V = 'v',
    t = 't',
    c = 'c',
    s = 's',
    [''] = 'v',
  }

  mode = mode and mode_aliases[mode] and mode_aliases[mode]:upper() or '?'

  return '%#statusline_mode# ' .. mode .. ' '

end


-- a function to obtain and format the diagnostics

local function diagnostics()

  local num_warning = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN  })
  local num_error   = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
  local num_hint    = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT  })

  return '%#statusline_diagnostics# ' .. 'E' .. num_error .. ' W' .. num_warning .. ' H' .. num_hint .. ' '

end


-- a function to assign highlight group to the separator

local function separator()

  -- the highlight group changes based on current mode

  local highlight_group = 'statusline_separator'
  local mode = vim.fn.mode()

  if mode == 'i' then
    return '%#' .. highlight_group .. '_insert#%='
  end

  if mode == 'v' or mode == 'V' or mode == '' then
    return '%#' .. highlight_group .. '_visual#%='
  end

  return '%#' .. highlight_group .. '#%='

end


-- a function to call and place the statusline components

function Status_line()

  return table.concat({

    file_name(),
    diagnostics(),

    separator(),

    git_branch(),
    current_mode(),

  })

end


-- only display one statusline and only display cursorline in the active window

vim.opt['laststatus'] = 3
vim.cmd('set statusline=%!v:lua.Status_line()')

vim.cmd([[
  augroup Statusline
    au!
    au WinEnter,BufEnter * setlocal cursorline
    au WinLeave,BufLeave * setlocal nocursorline
]])


-- set colors for each statusline components

local group_styles = {

  ['statusline_file']         = { fg = '#eeeeee', bg = '#444444', bold = true },
  ['statusline_modifiedfile'] = { fg = '#000000', bg = '#cccccc', bold = true },
  ['statusline_diagnostics']  = { fg = '#eeeeee', bg = '#222222' },

  ['statusline_separator']          = { fg = '#333333', bg = 'None' },
  ['statusline_separator_insert']   = { fg = '#444444', bg = 'None' },
  ['statusline_separator_visual']   = { fg = '#555555', bg = 'None' },

  ['statusline_branch'] = { fg = '#eeeeee', bg = '#222222' },
  ['statusline_mode']   = { fg = '#eeeeee', bg = '#444444', bold = true },

}

for group, style in pairs(group_styles) do
  vim.api.nvim_set_hl(0, group, style)
end
