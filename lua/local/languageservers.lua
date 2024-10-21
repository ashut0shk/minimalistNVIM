---
-- @file lua/languageservers.lua
--
-- @brief
-- The file to set Neovim's builtin LSP capabilities
--
-- @author Rezha Adrian Tanuharja
-- @date 2024-10-12
--

-- Utility function to detect root directory
local function get_root_dir(buf, patterns)
  return vim.fs.dirname(vim.fs.find(patterns, { upward = true, path = vim.fs.dirname(vim.api.nvim_buf_get_name(buf)) })[1])
end

-- show function signature after opening parentheses or comma

local show_signature = function()
  local char = vim.v.char
  if char == '(' or char == ',' then
    vim.defer_fn(
      function()
        vim.lsp.buf.signature_help()
      end,
      3
    )
  end
end


-- add functionalities based on language server's capabilities

vim.api.nvim_create_autocmd(
  'LspAttach', {
    callback = function(args)

      local client = vim.lsp.get_client_by_id(args.data.client_id)

      if client.supports_method('textDocument/definition') then
        vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<return>', {buffer = 0})
      end

      if client.supports_method('textDocument/references') then
        vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<return>', {buffer = 0})
      end

      if client.supports_method('textDocument/rename') then
        vim.keymap.set('n', 'gn', '<cmd>lua vim.lsp.buf.rename()<return>', {buffer = 0})
      end

      if client.supports_method('textDocument/signatureHelp') then
        vim.api.nvim_create_autocmd(
          'InsertCharPre', {
            buffer = 0,
            callback = show_signature,
          }
        )
      end

      if client.server_capabilities.hoverProvider then
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = args.buf })
      end

      if client.server_capabilities.signatureHelpProvider then
          vim.keymap.set({ 'n', 'i' }, '<c-k>', vim.lsp.buf.signature_help, { buffer = args.buf })
      end

      if client.server_capabilities.declarationProvider then
          vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = args.buf })
      end

      if client.server_capabilities.definitionProvider then
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = args.buf })
      end

      if client.server_capabilities.typeDefinitionProvider then
          vim.keymap.set('n', 'gy', vim.lsp.buf.type_definition, { buffer = args.buf })
      end

      if client.server_capabilities.implementationProvider then
          vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { buffer = args.buf })
      end

      if client.server_capabilities.referencesProvider then
          vim.keymap.set('n', 'gr', vim.lsp.buf.references, { buffer = args.buf })
      end

      if client.server_capabilities.renameProvider then
          vim.keymap.set('n', 'cr', vim.lsp.buf.rename, { buffer = args.buf })
      end

      if client.server_capabilities.codeActionProvider then
          vim.keymap.set('n', 'cx', vim.lsp.buf.code_action, { buffer = args.buf })
      end

      vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { buffer = args.buf })
      vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { buffer = args.buf })
      vim.keymap.set('n', '<space>', vim.diagnostic.open_float, { buffer = args.buf })
      vim.api.nvim_create_user_command('Dllist', vim.diagnostic.setloclist, {})
      vim.api.nvim_create_user_command('Dclist', vim.diagnostic.setqflist, {})

    end,
  }
)


-- format floating window

vim.opt['linebreak'] = true
vim.opt['whichwrap'] = 'bs<>[]hl'

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover, {
    title = 'Language Server',
    border = 'single',
    wrap = true,
    wrap_at = 80,
  }
)

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  vim.lsp.handlers.signature_help, {
    title = 'Language Server',
    border = 'single',
    focusable = false,
    wrap = true,
    wrap_at = 80,
  }
)


-- attach language servers to the right buffer

vim.api.nvim_create_autocmd(
  'FileType', {
    pattern = 'lua',
    callback = function(args)
      vim.lsp.start({
        name = 'lua-language-server',
        cmd = {'lua-language-server'},
        root_dir = vim.fs.root(args.buf, {'init.lua'}),
        settings = {
          Lua = {
            diagnostics = { globals = {'vim'} }
          },
        },
      })
    end,
  }
)

vim.api.nvim_create_autocmd(
  'FileType', {
    pattern = 'python',
    callback = function(args)
      vim.lsp.start({
        name = 'pyright',
        cmd = {'pyright-langserver', '--stdio'},
        root_dir = vim.fs.root(args.buf, {'pyproject.toml'}),
        settings = {
          python = {
            analysis = {
              typeCheckingMode = 'basic',
              autoSeachPaths = true,
            }
          },
        },
      })
    end,
  }
)

-- Attach TypeScript/JavaScript language server
vim.api.nvim_create_autocmd(
  'FileType', {
    pattern = { 'typescript', 'javascript', 'typescriptreact', 'javascriptreact' },
    callback = function(args)
      vim.lsp.start({
        name = 'tsserver',
        cmd = { 'C:\\Program Files\\nodejs\\typescript-language-server.cmd', '--stdio' },
        root_dir = get_root_dir(args.buf, { 'package.json', 'tsconfig.json', 'jsconfig.json', '.git' }),
        settings = {
          typescript = {
            format = {
              enable = true,
            },
          },
          javascript = {
            format = {
              enable = true,
            },
          },
          completions = {
            completeFunctionCalls = true,
          },
        },
      })
    end,
  }
)