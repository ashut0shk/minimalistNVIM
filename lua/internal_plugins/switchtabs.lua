---
-- @file lua/internal_plugins/statusline.lua
--
-- @brief
-- The configuration file to set a custom statusline
--
-- @author Rezha Adrian Tanuharja
-- @date 2024-10-03
--

-- Function to switch to the next buffer
local function next_buffer()
    local current_buffer = vim.fn.bufnr('%')
    local buffers = vim.fn.getbufinfo({ buflisted = 1 })

    for i, buf in ipairs(buffers) do
        if buf.bufnr == current_buffer then
            local next_buf = buffers[(i % #buffers) + 1]
            vim.cmd('buffer ' .. next_buf.bufnr)
            return
        end
    end
end

-- Function to switch to the previous buffer
local function previous_buffer()
    local current_buffer = vim.fn.bufnr('%')
    local buffers = vim.fn.getbufinfo({ buflisted = 1 })

    for i, buf in ipairs(buffers) do
        if buf.bufnr == current_buffer then
            local prev_buf = buffers[(i - 2 + #buffers) % #buffers + 1]
            vim.cmd('buffer ' .. prev_buf.bufnr)
            return
        end
    end
end