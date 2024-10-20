---
-- @file lua/keymaps.lua
--
-- @brief
-- The file to set general keymaps
--
-- @author Rezha Adrian Tanuharja
-- @date 2024-10-12
--


vim.keymap.set('', '<space>', '<nop>', { noremap = true, silent = true, desc = 'space is only a leader key now' } )
local mode_keymaps = {

  normal = {

    ['q'] = { action = '<nop>', desc = 'do not record macro, ever' },

    ['x'] = { action = '"_x', desc = 'delete a character without storing it in the clipboard' },

    ['<leader>q'] = { action = '<cmd>quit<return>', desc = 'close the current window' },
    ['<leader>w'] = { action = '<cmd>write<return>', desc = 'save changes in the current buffer' },

    ['<C-h>'] = { action = '<C-w>h', desc = 'move focus to the pane on the left' },
    ['<C-j>'] = { action = '<C-w>j', desc = 'move focus to the pane below' },
    ['<C-k>'] = { action = '<C-w>k', desc = 'move focus to the pane above' },
    ['<C-l>'] = { action = '<C-w>l', desc = 'move focus to the pane on the right' },

    ['<S-h>'] = { action = '<cmd>bprev<return>', desc = 'switch to the prev buffer' },
    ['<S-l>'] = { action = '<cmd>bnext<return>', desc = 'switch to the next buffer' },

    ['<leader>v'] = { action = '<cmd>split<return>', desc = 'horizontal split' },
    ['<leader>h'] = { action = '<cmd>vsplit<return>', desc = 'vertical split' },

    ['<C-b>'] = { action = '<cmd>vertical resize -2<return>', desc = 'decrease rows in the current window' },
    ['<C-n>'] = { action = '<cmd>vertical resize +2<return>', desc = 'increase rows in the current window' },
    ['<C-,>'] = { action = '<cmd>horizontal resize -2<return>', desc = 'decrease columns in the current window' },
    ['<C-.>'] = { action = '<cmd>horizontal resize +2<return>', desc = 'increase columns in the current window' },

    ['<S-m>'] = { action = '<cmd>nohlsearch<return>', desc = 'remove highlight from search results' },

    ['<leader>a'] = { action = 'za', desc = 'fold the scope under the cursor' },
    ['<leader>r'] = { action = 'zR', desc = 'expand all folds in the current window'},

    ['<C-S-j>'] = {
      action = function()
        local success = pcall(vim.cmd, 'cnext')
        if not success then
          vim.cmd('cfirst')
        end
      end,
      desc = 'navigate to the next quickfix item'
    },

    ['<C-S-k>'] = {
      action = function()
        local success = pcall(vim.cmd, 'cprev')
        if not success then
          vim.cmd('clast')
        end
      end,
      desc = 'navigate to the prev quickfix item'
    },

    ['<C-S-l>'] = {
      action = function()
        local _ = pcall(vim.cmd, 'cnewer')
      end,
      desc = 'navigate to the next quickfix list'
    },

    ['<C-S-h>'] = {
      action = function()
        local _ = pcall(vim.cmd, 'colder')
      end,
      desc = 'navigate to the prev quickfix list'
    },

    ['<leader><PageUp>'] = { action = '<cmd>bprev<return>', desc = 'Next file in buffer' },
    ['<leader><PageDown>'] = { action = '<cmd>bnext<return>', desc = 'Previous file in buffer' },

    ['<C-p>'] = { action = '<cmd>Telescope find_files<return>', desc = 'Find files' },
    ['<leader>1'] = { action = '<C-w>w', desc = 'Switch between panels' },
    ['<leader>`'] = { action = '<cmd>NvimTreeFocus<return>', desc = 'Switch between panels' },

    ['<leader>t'] = { action = '<cmd>terminal<return>', desc = 'open a terminal in the current window' },
    ['<leader>j'] = { action = '<cmd>botright new | resize 12 | terminal<return>', desc = 'open a terminal in VS Code style' },

    ['<leader>a'] = { action = 'za', desc = 'fold the scope under cursor' },
    ['<leader>r'] = { action = 'zR', desc = 'expand all folds in the current buffer' },

    ['gb'] = { action = '<C-t>', desc = 'go back after jump, e.g., goto definition' },
    ['<C-r>'] = { action = '<cmd>Telescope treesitter<return>', desc = 'treesitter lookup' },
    ['<leader>1'] = { action = '<C-w>w', desc = 'switch panes' },
    ['<leader>`'] = { action = '<cmd>NvimTreeFocus<return>', desc = 'focus sidebar' },


  },

  visual = {

    ['H'] = { action = '<gv', desc = 'move highlighted part to the left' },
    ['L'] = { action = '>gv', desc = 'move highlighted part to the right' },

    ['<leader>i'] = { action = ':s/^/', desc = 'spawn multiple cursors at the start of highlighted lines' },
    ['<leader>a'] = { action = ':s/$/', desc = 'spawn multiple cursors at the end of highlighted lines' },

    ['<leader>s'] = {
      action = "<cmd>lua vim.api.nvim_feedkeys(':ExactReplace ', 'c', false)<return>",
      desc = 'search and replace exact words in highlighted text'
    },

    ['<leader>p'] = {
      action = "<cmd>lua vim.api.nvim_feedkeys(':AppendTo ', 'c', false)<return>",
      desc = 'search and add text following the search results'
    },

  },

  command = {

    ['<C-y>'] = { action = '/g | nohlsearch<return>', desc = 'confirm substitutions' },

  },

  terminal = {

    ['qq'] = { action = '<C-\\><C-n>', desc = 'exit terminal mode without closing the terminal' },

  },

  insert = {

    ['<C-s>'] = { action = '<Esc>:w<CR>a', desc = 'Save file' },
    ['<C-v>'] = { action = '<C-o>:set paste<CR><C-r>+<C-o>:set nopaste<CR>', desc = 'Paste here' },
  },

}

for mode, keymaps in pairs(mode_keymaps) do

  local mode_initial = mode:sub(1, 1)

  for key, maps in pairs(keymaps) do
    vim.keymap.set( mode_initial, key, maps.action, { noremap = true, silent = true, desc = maps.desc } )
  end

end
