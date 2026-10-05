vim.pack.add({
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/mason-org/mason.nvim",
})

require("mason").setup({})

vim.diagnostic.config({ virtual_text = true })

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

local eslint_root_dir = vim.lsp.config.eslint.root_dir

vim.lsp.config("eslint", {
  root_dir = function(bufnr, on_dir)
    if not vim.api.nvim_buf_get_name(bufnr):find("/node_modules/", 1, true) then
      eslint_root_dir(bufnr, on_dir)
    end
  end,
  settings = {
    workingDirectories = { mode = "auto" },
  },
})

local tailwind_root_dir = vim.lsp.config.tailwindcss.root_dir

vim.lsp.config("tailwindcss", {
  root_dir = function(bufnr, on_dir)
    local fname = vim.api.nvim_buf_get_name(bufnr)
    local markers = require("lspconfig.util").insert_package_json({
      "tailwind.config.js",
      "tailwind.config.cjs",
      "tailwind.config.mjs",
      "tailwind.config.ts",
    }, "tailwindcss", fname)
    if vim.fs.find(markers, { path = fname, upward = true })[1] then
      tailwind_root_dir(bufnr, on_dir)
    end
  end,
})

vim.lsp.config("gleam", {
  cmd = { "gleam", "lsp" },
  root_markers = { "gleam.toml" },
})

local servers = {
  "lua_ls",
  "denols",
  "gleam",
  "tsc",
  "tailwindcss",
  "astro",
  "svelte",
  "html",
  "cssls",
  "jsonls",
  "eslint",
  "gopls",
}

for _, server in ipairs(servers) do
  vim.lsp.enable(server)
end
