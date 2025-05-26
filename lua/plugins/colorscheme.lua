return {
  -- { "ellisonleao/gruvbox.nvim", opts = { transparent_mode = true } },
  {
    "heflerdev/rubr0",
    priority = 1000,
    opts = {
      palette_overrides = {},
    },
    -- config = function()
    --   vim.cmd.colorscheme("gruvbox")
    -- end,
  },
  { "tanvirtin/monokai.nvim" },
  -- { "sainnhe/gruvbox-material" },
  { "Mofiqul/dracula.nvim" },
  { "rockerBOO/boo-colorscheme-nvim" },
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
}
