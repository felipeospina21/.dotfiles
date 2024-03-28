-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  -- TODO: Remove branch v4 on release
  { "AstroNvim/astrocommunity", branch = "v4" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.typescript" },
  -- { import = "astrocommunity.colorscheme.rose-pine" },
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
