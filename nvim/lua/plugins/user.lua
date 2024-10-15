---@type LazySpec
return {
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
}
