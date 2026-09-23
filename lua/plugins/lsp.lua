vim.pack.add({
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/mason-org/mason.nvim",
})

require("mason").setup({})

local capabilities = vim.lsp.protocol.make_client_capabilities()

vim.lsp.config("lua_ls", {
  capabilities = capabilities,
  root_markers = { ".luarc.json", ".luarc.jsonc", "init.lua", ".git" },
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
    },
  },
  format = { enable = true },
})

vim.lsp.config("tsc", {
  capabilities = capabilities,
  cmd = { "tsc", "--lsp", "--stdio" },
  root_markers = { "package.json" },
})

vim.lsp.config("denols", {
  capabilities = capabilities,
  root_markers = { "deno.json", "deno.jsonc" },
})

vim.lsp.config("astro", {
  capabilities = capabilities,
  root_markers = { "astro.config.mjs", "astro.config.js", "astro.config.ts", "package.json" },
})

vim.lsp.config("svelte", {
  capabilities = capabilities,
  root_markers = { "svelte.config.js", "package.json" },
})

vim.lsp.config("eslint", {
  capabilities = capabilities,
  root_markers = { ".eslintrc", ".eslintrc.json", "eslint.config.js", "package.json" },
  settings = {
    workingDirectories = { mode = "auto" },
  },
})

local servers = {
  "lua_ls",
  "denols",
  "tsc",
  "tailwindcss",
  "astro",
  "svelte",
  "html",
  "cssls",
  "jsonls",
}

for _, server in ipairs(servers) do
  vim.lsp.enable(server)
end
