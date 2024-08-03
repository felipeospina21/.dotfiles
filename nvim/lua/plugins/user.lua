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
}
