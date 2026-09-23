vim.pack.add({ "https://github.com/stevearc/conform.nvim" })

local conform = require("conform")
local util = require("conform.util")

conform.setup({
  format_on_save = {
    timeout_ms = 500,
    lsp_format = "fallback",
  },

  formatters_by_ft = {
    lua = { "stylua" },
    javascript = { "biome", "deno_fmt", "oxfmt", "prettier", stop_after_first = true },
    typescript = { "biome", "deno_fmt", "oxfmt", "prettier", stop_after_first = true },
    javascriptreact = { "biome", "deno_fmt", "oxfmt", "prettier", stop_after_first = true },
    typescriptreact = { "biome", "deno_fmt", "oxfmt", "prettier", stop_after_first = true },
    json = { "biome", "deno_fmt", "prettier", stop_after_first = true },
    jsonc = { "biome", "deno_fmt", "prettier", stop_after_first = true },
    css = { "biome", "prettier", stop_after_first = true },
    scss = { "prettier" },
    html = { "prettier" },
    markdown = { "prettier" },
    yaml = { "prettier" },
    svelte = { "prettier" },
    astro = { "prettier" },
  },

  formatters = {
    stylua = {
      require_cwd = true,
      cwd = util.root_file({ "stylua.toml", ".stylua.toml" }),
    },
    prettier = {
      require_cwd = true,
    },
    biome = {
      require_cwd = true,
      cwd = util.root_file({ "biome.json", "biome.jsonc" }),
    },
    deno_fmt = {
      require_cwd = true,
      cwd = util.root_file({ "deno.json", "deno.jsonc" }),
    },
    oxfmt = {
      require_cwd = true,
      cwd = util.root_file({ ".oxfmtrc.json", ".oxfmtrc.jsonc" }),
    },
  },
})
