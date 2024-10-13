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

    ['<leader>t'] = { action = '<cmd>terminal<return>', desc = 'open a terminal in the current window' },
    ['<leader>j'] = { action = '<cmd>botright new | resize 12 | terminal<return>', desc = 'open a terminal in VS Code style' },

    ['<leader>a'] = { action = 'za', desc = 'fold the scope under cursor' },
    ['<leader>r'] = { action = 'zR', desc = 'expand all folds in the current buffer' },

    ['gb'] = { action = '<C-t>', desc = 'go back after jump, e.g., goto definition' },

    ['<C-f>'] = { action = ':Telescope current_buffer_fuzzy_find<CR>', desc = 'Find in the current buffer using Telescope' },
    ['<C-S-f>'] = { action = ':Telescope live_grep<CR>', desc = 'Find in files using Telescope' },
    ['<C-p>'] = { action = ':Telescope find_files<CR>', desc = 'Find files' },

    ['<C-b>'] = { action = ':NvimTreeToggle<CR>', desc = 'Toggle sidebar' },

    ['<Tab>'] = { action = ':bnext<CR>', desc = 'Next file in buffer' },
    ['<S-Tab>'] = { action = ':bprevious<CR>', desc = 'Previous file in buffer' },
    ['<C-Tab>'] = { action = ':bnext<CR>', desc = 'Next file in buffer' },
    ['<C-S-Tab>'] = { action = ':bprevious<CR>', desc = 'Previous file in buffer' },
    ['<C-PageUp>'] = { action = ':bnext<CR>', desc = 'Next file in buffer' },
    ['<C-PageDown>'] = { action = ':bprevious<CR>', desc = 'Previous file in buffer' },

  },

  visual = {

    ['H'] = { action = '<gv', desc = 'move highlighted part to the left' },
    ['J'] = { action = ":move '>+1<return>gv", desc = 'move highlighted part to the left' },
    ['K'] = { action = ":move '<-2<return>gv", desc = 'move highlighted part to the left' },
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

    ['<Tab>'] = { action = 'copilot#Accept("<Tab>")', desc = 'Select the highlighted choice' },

  },

}

for mode, keymaps in pairs(mode_keymaps) do

  local mode_initial = mode:sub(1, 1)

  for key, maps in pairs(keymaps) do
    vim.keymap.set( mode_initial, key, maps.action, { noremap = true, silent = true, desc = maps.desc } )
  end
end
