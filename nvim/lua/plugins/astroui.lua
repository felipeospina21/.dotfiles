-- AstroUI provides the basis for configuring the AstroNvim User Interface
-- Configuration documentation can be found with `:h astroui`

local C = require "astrotheme.palettes.astrodark"

local colors = {
  dark = "#111317",
  light = "#777777",
  neutral = "#8094B4",
  backdrop = "#61afef",
  ignored = "#3f4145",
}

---@type LazySpec
return {
  "AstroNvim/astroui",
  ---@type AstroUIOpts
  opts = {
    -- change colorscheme
    colorscheme = "astrodark",
    -- AstroUI allows you to easily modify highlight groups easily for any and all colorschemes
    highlights = {
      init = { -- this table overrides highlights in all themes
        -- Normal = { bg = "#000000" },
      },
      astrotheme = { -- a table of overrides/changes when applying the astrotheme theme
        -- Normal = { bg = "#000000" },
      },
      astrodark = {
        SpellBad = { sp = C.ui.purple, undercurl = false, underdashed = true },
        SpellCap = { sp = C.ui.yellow, undercurl = true, underdashed = true },
        SpellLocal = { sp = C.ui.blue, undercurl = true, underdashed = true },
        SpellRare = { sp = C.ui.green, undercurl = true, underdashed = true },

        NeoTreeGitIgnored = { fg = colors.ignored, italic = true, bold = true },

        -- info messages
        NeoTreeMessage = { link = "NeoTreeDotfile" },

        -- dotfiles
        NeoTreeDotfile = { fg = colors.light },
        NeoTreeDotfiles = { link = "NeoTreeDotfile" },
      },
    },
    -- Icons can be configured throughout the interface
    icons = {
      -- configure the loading of the lsp in the status line
      LSPLoading1 = "⠋",
      LSPLoading2 = "⠙",
      LSPLoading3 = "⠹",
      LSPLoading4 = "⠸",
      LSPLoading5 = "⠼",
      LSPLoading6 = "⠴",
      LSPLoading7 = "⠦",
      LSPLoading8 = "⠧",
      LSPLoading9 = "⠇",
      LSPLoading10 = "⠏",
    },
  },
}
