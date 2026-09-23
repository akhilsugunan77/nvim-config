vim.pack.add({
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/mason-org/mason.nvim",
})

require("mason").setup({})

vim.lsp.config("lua_ls", {
  root_markers = { ".luarc.json", ".luarc.jsonc", "init.lua", ".git" },
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = { vim.env.VIMRUNTIME },
      },
      format = { enable = true },
    },
  },
})

vim.lsp.config("astro", {
  root_markers = { "astro.config.mjs", "astro.config.js", "astro.config.ts", "package.json" },
})

vim.lsp.config("eslint", {
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
  "eslint",
}

for _, server in ipairs(servers) do
  vim.lsp.enable(server)
end
