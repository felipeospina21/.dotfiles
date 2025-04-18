-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics = { virtual_text = true, virtual_lines = false }, -- diagnostic settings on startup
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- passed to `vim.filetype.add`
    filetypes = {
      -- see `:h vim.filetype.add` for usage
      extension = {
        foo = "fooscript",
      },
      filename = {
        [".foorc"] = "fooscript",
      },
      pattern = {
        [".*/etc/foo/.*"] = "fooscript",
      },
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = true, -- sets vim.opt.spell
        signcolumn = "yes", -- sets vim.opt.signcolumn to yes
        wrap = true, -- sets vim.opt.wrap

        grepprg = "rg --vimgrep --smart-case",
        showtabline = 0,
        cmdheight = 1,
        iskeyword = vim.opt.iskeyword:append "-", -- append '-' to iskeyword
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
        -- second key is the lefthand side of the map

        -- navigate buffer tabs
        ["]b"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["[b"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- mappings seen under group name "Buffer"
        ["<Leader>bd"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Close buffer from tabline",
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

        ["[["] = { "<cmd>cprev<cr>", desc = "Previous error" },
        ["]]"] = { "<cmd>cnext<cr>", desc = "Next error" },

        -- Override default mapping to use telescope
        ["grr"] = { function() require("telescope.builtin").lsp_references() end, desc = "search reference" },
      },
    },
  },
}
