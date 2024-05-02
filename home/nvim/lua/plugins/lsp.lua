local lsp = require("lsp-zero").preset({})
local lspconfig = require("lspconfig")

lspconfig.lua_ls.setup {
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      diagnostics = {
        globals = {
          "vim",
          "require"
        },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = {
        enable = false,
      },
    },
  },
}

lspconfig.nil_ls.setup({})
lspconfig.clangd.setup({
  cmd = {
    "clangd",
    "--background-index",
    "--offset-encoding=utf-16",
    "--header-insertion=never",
    "--clang-tidy",
    "--cross-file-rename",
  }
})
lspconfig.pyright.setup({})
lspconfig.zls.setup({})

lsp.on_attach(function(_, bufnr)
  lsp.default_keymaps { buffer = bufnr }
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

  lsp.default_keymaps({buffer = bufnr})
end)

lsp.setup()

lsp.format_on_save({
  format_opts = {
    async = true,
    timeout_ms = 10000,
  },
  servers = {
    ['clangd'] = { 'cpp', 'c' },
  }
})
