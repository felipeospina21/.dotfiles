---@type LazySpec
return {
  {
    "tpope/vim-surround",
    dependencies = { "tpope/vim-repeat" },
    event = { "BufEnter" },
  },
  {
    -- Move lines <A-j> <A-k> ...
    "matze/vim-move",
    event = "BufEnter",
  },
  {
    "gerazov/toggle-bool.nvim",
    event = { "BufEnter" },
    keys = {
      { "<C-t>", "<cmd>lua require('toggle-bool').toggle_bool()<cr>", desc = "Toggle boolean value" },
    },
  },
  {
    -- Graphql syntax highlihgt
    "jparise/vim-graphql",
    event = "BufEnter",
  },
  {
    -- Tag auto rename
    "AndrewRadev/tagalong.vim",
    event = { "BufEnter" },
  },
  {
    "heavenshell/vim-jsdoc",
    ft = {
      "typescript",
      "typescriptreact",
      "javascript",
      "javascriptreact",
    },
  },
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
}
