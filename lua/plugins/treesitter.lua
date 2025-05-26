return {
  "nvim-treesitter/nvim-treesitter",
  version = false, -- last release is way too old and doesn't work on Windows
  build = ":TSUpdate",
  event = { "LazyFile", "VeryLazy" },
  lazy = vim.fn.argc(-1) == 0, -- load treesitter early when opening a file from the cmdline
  init = function(plugin)
    -- PERF: add nvim-treesitter queries to the rtp and it's custom query predicates early
    -- This is needed because a bunch of plugins no longer `require("nvim-treesitter")`, which
    -- no longer trigger the **nvim-treesitter** module to be loaded in time.
    -- Luckily, the only things that those plugins need are the custom queries, which we make available
    -- during startup.
    require("lazy.core.loader").add_to_rtp(plugin)
    require("nvim-treesitter.query_predicates")
  end,
  cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
  keys = {
    { "<c-space>", desc = "Increment Selection" },
    { "<bs>", desc = "Decrement Selection", mode = "x" },
  },
  opts_extend = { "ensure_installed" },
  ---@type TSConfig
  ---@diagnostic disable-next-line: missing-fields
  opts = {
    highlight = { enable = true },
    indent = { enable = true },
    ensure_installed = {
      "bash",
      "c",
      "diff",
      "html",
      "javascript",
      "jsdoc",
      "json",
      "jsonc",
      "lua",
      "luadoc",
      "luap",
      "markdown",
      "markdown_inline",
      "printf",
      "python",
      "query",
      "regex",
      "toml",
      "tsx",
      "typescript",
      "vim",
      "vimdoc",
      "xml",
      "yaml",
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<C-space>",
        node_incremental = "<C-space>",
        scope_incremental = false,
        node_decremental = "<bs>",
      },
    },
    textobjects = {
      move = {
        enable = true,
        goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer", ["]a"] = "@parameter.inner" },
        goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer", ["]A"] = "@parameter.inner" },
        goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer", ["[a"] = "@parameter.inner" },
        goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer", ["[A"] = "@parameter.inner" },
      },
    },
  },
  ---@param opts TSConfig
  config = function(_, opts)
    if type(opts.ensure_installed) == "table" then
      opts.ensure_installed = LazyVim.dedup(opts.ensure_installed)
    end

    require("nvim-treesitter.configs").setup(opts)

    -- 💡 Seus highlights personalizados aqui:
    local hl = vim.api.nvim_set_hl
    hl(0, "@comment", { fg = "#775555", italic = true })
    hl(0, "@string", { fg = "#ff5e7a", bold = true })
    hl(0, "@number", { fg = "#ff3c6c" })
    hl(0, "@function", { fg = "#ff9999", bold = true })
    hl(0, "@function.call", { fg = "#ff7777", bold = true })
    hl(0, "@keyword", { fg = "#ff0055", italic = true })
    hl(0, "@keyword.return", { fg = "#dd0033", italic = true })
    hl(0, "@keyword.import", { fg = "#cc00aa", italic = true })
    hl(0, "@type", { fg = "#ff6666", bold = true })
    hl(0, "@namespace", { fg = "#ff4444", bold = true })
    hl(0, "@variable", { fg = "#ffffff" })
    hl(0, "@parameter", { fg = "#ffaaaa", italic = true })
    hl(0, "@punctuation", { fg = "#ff3333" })
    hl(0, "@operator", { fg = "#ff2222" })

    -- Diagnósticos
    hl(0, "DiagnosticError", { fg = "#ff00ff", underline = true })
    hl(0, "DiagnosticWarn", { fg = "#ffaa00", underline = true })
    hl(0, "DiagnosticInfo", { fg = "#00ccff", underline = true })
    hl(0, "DiagnosticHint", { fg = "#bbbbbb", italic = true })
  end,
}
