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
  },

  formatters = {
    stylua = {
      require_cwd = true,
      cwd = util.root_file({ "stylua.toml", ".stylua.toml" }),
    },
    prettier = {
      require_cwd = true,
      cwd = util.root_file({
        ".prettierrc",
        ".prettierrc.json",
        ".prettierrc.yml",
        ".prettierrc.yaml",
        ".prettierrc.json5",
        ".prettierrc.js",
        ".prettierrc.cjs",
        ".prettierrc.mjs",
        ".prettierrc.toml",
        "prettier.config.js",
        "prettier.config.cjs",
        "prettier.config.mjs",
      }),
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
      cwd = util.root_file({ "oxlint.json", ".oxlintrc.json" }),
    },
  },
})
