-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 500, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = true, -- sets vim.opt.spell
        signcolumn = "auto", -- sets vim.opt.signcolumn to auto
        wrap = true, -- sets vim.opt.wrap
        showtabline = 0,
        cmdheight = 1,
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        ["<Leader>b"] = { desc = "Buffers" },
        -- navigate buffer tabs with `H` and `L`
        L = {
          function() require("astrocore.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
          desc = "Next buffer",
        },
        H = {
          function() require("astrocore.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
          desc = "Previous buffer",
        },

        -- mappings seen under group name "Buffer"
        ["<Leader>bD"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Pick to close",
        },
        ["<A-t>"] = { "<cmd>bnext<cr>", desc = "Next Buffer" },
        ["<AS-t>"] = { "<cmd>bprevious<cr>", desc = "Prev Buffer" },
        ["<A-b>"] = { "<cmd>Telescope buffers<cr>", desc = "Buffers list" },

        ["<C-s>"] = { ":w!<cr>", desc = "Save File" },

        ["<A-Up>"] = { "<cmd>m .-2<CR>", desc = "Move line up" },
        ["<A-Down>"] = { "<cmd>m .+1<CR>", desc = "Move line down" },
        ["<AS-Up>"] = { "VyP", desc = "Copy/Paste line up" },
        ["<AS-Down>"] = { "Vyp", desc = "Copy/Paste line down" },

        ["<Leader>r"] = { "<cmd>e<cr>", desc = "Refresh file" },

        ["<Leader>fj"] = { "<cmd>Telescope jumplist<cr>", desc = "Find jumplist" },
        ["<Leader>fs"] = { "<cmd>Telescope spell_suggest<cr>", desc = "Spell suggestion" },
        ["<Leader>fq"] = { "<cmd>Telescope quickfix<cr>", desc = "Quickfix list" },
        ["<Leader>f/"] = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Current buffer fzf" },

        ["<Leader>j"] = { "<cmd>JsDoc<cr>", desc = "Add JsDoc comment" },
        ["<Leader>,"] = { "*:%s/<C-r><C-w>/", desc = "Substitute word under cursor" },

        ["[q"] = { "<cmd>cprev<cr>", desc = "Previous error" },
        ["]q"] = { "<cmd>cnext<cr>", desc = "Next error" },

        -- ["<Leader>N"] = { name = " Neotest" },
        -- ["<Leader>H"] = { name = " Http" },
        -- ["<Leader>P"] = { name = " Package.json" },
      },
      t = {
        -- setting a mapping to false will disable it
        -- ["<esc>"] = false,
      },
    },
  },
}
