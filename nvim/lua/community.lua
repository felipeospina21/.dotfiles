-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.toml" },
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.tailwindcss" },
  { import = "astrocommunity.pack.mdx" },
  -- { import = "astrocommunity.pack.go" },
  -- { import = "astrocommunity.icon.mini-icons" },
  { import = "astrocommunity.motion.nvim-surround" },
  { import = "astrocommunity.test.nvim-coverage" },
  { import = "astrocommunity.git.diffview-nvim" },
  { import = "astrocommunity.editing-support.vim-move" },
  { import = "astrocommunity.recipes.picker-lsp-mappings" },
  { import = "astrocommunity.markdown-and-latex.markview-nvim" },
}
