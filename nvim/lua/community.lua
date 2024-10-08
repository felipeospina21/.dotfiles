-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  { "AstroNvim/astrocommunity" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.toml" },
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.mdx" },
  -- { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.git.diffview-nvim" },
  { import = "astrocommunity.recipes.telescope-lsp-mappings" },
  { import = "astrocommunity.markdown-and-latex.markview-nvim" },
  {
    "OXY2DEV/markview.nvim",
    opts = {
      filetypes = { "markdown", "quarto", "rmd", "markdown.mdx" },
      hybrid_modes = { "i" },
    },
  },

  -- { import = "astrocommunity.colorscheme.rose-pine" },
  -- { import = "astrocommunity.lsp.ts-error-translator-nvim" },
  -- {
  -- Part of ts pack
  --   "dmmulroy/tsc.nvim",
  --   cmd = "TSC",
  --   opts = {
  --     flags = {
  --       noEmit = true,
  --       skipLibCheck = true,
  --     },
  --   },
  -- },
  -- {
  --   "rose-pine",
  --   opts = {
  --     variant = "moon",
  --     highlight_groups = {
  --       IndentBlanklineChar = { fg = "surface", nocombine = true },
  --       -- NotifyBackground = { bg = "surface" },
  --       -- IndentBlanklineSpaceChar = { fg = "surface", nocombine = true },
  --       -- IndentBlanklineSpaceCharBlankline = { fg = "surface", nocombine = true },
  --     },
  --   },
  -- },
}
