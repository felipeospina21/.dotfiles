---@type LazySpec
return {
  {
    "akinsho/toggleterm.nvim",
    opts = {
      direction = "float",
    },
  },

  {
    "AstroNvim/astrotheme",
    opts = {
      style = {
        transparent = true, -- Bool value, toggles transparency.
        inactive = true, -- Bool value, toggles inactive window color.
        float = true, -- Bool value, toggles floating windows background colors.
        neotree = false, -- Bool value, toggles neo-trees background color.
        border = true, -- Bool value, toggles borders.
        title_invert = true, -- Bool value, swaps text and background colors.
        italic_comments = true, -- Bool value, toggles italic comments.
        simple_syntax_colors = true, -- Bool value, simplifies the amounts of colors used for syntax highlighting.
      },
    },
  },
  {
    "OXY2DEV/markview.nvim",
    opts = {
      preview = {
        filetypes = { "markdown", "quarto", "rmd", "markdown.mdx" },
        hybrid_modes = { "i" },
      },
    },
  },
  {
    "windwp/nvim-autopairs",
    opts = {
      -- Conflictive keymap with harpoon
      fast_wrap = false,
    },
  },
  {
    "RRethy/vim-illuminate",
    opts = {
      -- Conflictive keymap with harpoon
      disable_keymaps = false,
    },
  },
}
