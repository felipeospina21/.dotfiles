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
  {
    "saghen/blink.cmp",
    dependencies = { "onsails/lspkind.nvim", "nvim-tree/nvim-web-devicons" },
    opts = {
      completion = {
        menu = {
          draw = {
            components = {
              kind_icon = {
                text = function(ctx)
                  local icon = ctx.kind_icon
                  if vim.tbl_contains({ "Path" }, ctx.source_name) then
                    local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
                    if dev_icon then icon = dev_icon end
                  else
                    icon = require("lspkind").symbolic(ctx.kind, {
                      mode = "symbol",
                    })
                  end

                  return icon .. ctx.icon_gap
                end,

                -- Optionally, use the highlight groups from nvim-web-devicons
                -- You can also add the same function for `kind.highlight` if you want to
                -- keep the highlight groups in sync with the icons.
                highlight = function(ctx)
                  local hl = ctx.kind_hl
                  if vim.tbl_contains({ "Path" }, ctx.source_name) then
                    local dev_icon, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
                    if dev_icon then hl = dev_hl end
                  end
                  return hl
                end,
              },
            },
          },
        },
      },
    },
  },
}
