---
-- @file lua/options.lua
--
-- @brief
-- The configuration file to set the general nvim behaviour
--
-- @author Rezha Adrian Tanuharja
-- @date 2024-08-31
--


local options = {
  inccommand = 'split',                     -- shows the effect of substitute-like operations in a split window
  virtualedit = 'block',                    -- enable highlighting empty spaces
  foldlevelstart = 99,                      -- start with everything unfolded
  backup = false,                           -- creates a backup file
  clipboard = 'unnamedplus',                -- allows neovim to access the system clipboard
  cmdheight = 1,                            -- more spaces in the command line for displaying messages
  conceallevel = 2,                         -- so that `` is visible in markdown files
  fileencoding = 'utf-8',                   -- the encoding written to a file
  hlsearch = true,                          -- highlight all matches on previous search pattern
  ignorecase = true,                        -- ignore case in search pattern
  mouse = '',                               -- disable the mouse in neovim
  pumheight = 10,                           -- pop up menu height
  showmode = false,                         -- we don't need to see things like -- INSERT -- anymore
  showtabline = 2,                          -- always show tabs
  smartcase = true,                         -- smart case
  smartindent = true,                       -- make indenting smart again
  splitbelow = true,                        -- force all horizontal splits to go below current window
  splitright = true,                        -- force all vertical splits to go to the right of current window
  swapfile = false,                         -- creates a swapfile
  termguicolors = true,                     -- set term gui colors (most terminals support this)
  timeoutlen = 300,                         -- time to wait a mapped sequence to complete
  undofile = true,                          -- enable persistent undo
  updatetime = 200,                         -- faster completion
  writebackup = false,                      -- if a file is being edited in another program
  expandtab = true,                         -- convert tabs to spaces
  shiftwidth = 2,                           -- the number of spaces for each indentation
  tabstop = 2,                              -- the number of spaces for each tab
  cursorline = true,                        -- highlight the current line
  number = true,                            -- display line number
  relativenumber = true,                    -- display relative line number
  numberwidth = 4,                          -- set the width of number column
  signcolumn = 'yes',                       -- always show the sign column
  wrap = false,                             -- no text wrapping (ugly)
  linebreak = true,                         -- companion to wrap, don't split words
  scrolloff = 0,                            -- minimal number of screen lines above and below the cursor
  sidescrolloff = 6,                        -- minimal number of screen columns to the left and right of the cursor
  guifont = 'monospace:h16',                -- the font used in graphical neovim application
  whichwrap = 'bs<>[]hl',                   -- which "horizontal" keys are allowed to travel to prev/next line
}

-- set all options to their respective value
for parameter, value in pairs(options) do
  vim.opt[parameter] = value
end
