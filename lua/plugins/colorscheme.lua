return {
  -- { "ellisonleao/gruvbox.nvim", opts = { transparent_mode = true } },
  {
    "heflerdev/crimson-hacker-theme",
    priority = 1000,
    opts = {
      palette_overrides = {},
    },
    config = function()
      vim.cmd.colorscheme("gruvbox")
    end,
  },
  { "tanvirtin/monokai.nvim" },
  { "sainnhe/gruvbox-material" },
  { "Mofiqul/dracula.nvim" },
  { "rockerBOO/boo-colorscheme-nvim" },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
}
