---
-- @file lua/external_plugins/bufferline.lua
--
-- @brief
-- The configuration file for the plugin autopairs
--
-- @author Rezha Adrian Tanuharja
-- @date 2024-08-31
--


return {

  'akinsho/bufferline.nvim',

  event = 'InsertEnter',

  config = function()

    local success, bufferline = pcall(require, 'bufferline')
    if not success then
      vim.notify('Failed to load plugin: bufferline')
      return
    end

    bufferline.setup {
      options = {
        show_buffer_close_icons = false,     -- Hide close icons on tabs
        show_close_icon = false,             -- Hide global close icon
        separator_style = 'thin',            -- Use thin separators
        diagnostics = "nvim_lsp",            -- Optional: show LSP diagnostics
        offsets = { { filetype = "NvimTree", text = "", padding = 1 } },

        -- Format buffer's name to show only the filename
        name_formatter = function(buf)
          -- Strip out the directory and show only the filename
          return vim.fn.fnamemodify(buf.name, ':t')
        end,

        -- This function will ensure filenames are unique by prepending the folder name if needed
        custom_filter = function(buf, _)
          local file_name = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(buf), ':t')
          local parent_dir = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(buf), ':h:t')

          -- Prepend the parent folder if filenames would be duplicated
          if file_name == '' then
            return parent_dir .. '/' .. file_name
          else
            return file_name
          end
        end,

        -- Ensure the unique part of the filename path is shown if there are duplicates
        diagnostics_indicator = function(_, _, diagnostics)
          local result = {}
          for name, count in pairs(diagnostics) do
            table.insert(result, name .. ": " .. count)
          end
          return table.concat(result, " ")
        end,
      }
    }
  end,
}
