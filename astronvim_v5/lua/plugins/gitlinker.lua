return {
  {
    "linrongbin16/gitlinker.nvim",
    cmd = "GitLink",
    opts = {
      router = {
        browse = {
          ["^gitlab%.disney%.com"] = "https://gitlab.disney.com/"
            .. "{_A.ORG}/"
            .. "{_A.REPO}/blob/"
            .. "{_A.REV}/"
            .. "{_A.FILE}"
            .. "#L{_A.LSTART}"
            .. "{(_A.LEND > _A.LSTART and ('-L' .. _A.LEND) or '')}",
        },

        file = {
          ["^gitlab%.disney%.com"] = "https://gitlab.disney.com/"
            .. "{_A.ORG}/"
            .. "{_A.REPO}/-/blob/"
            .. "{_A.DEFAULT_BRANCH}/"
            .. "{_A.FILE}",

          ["^github%.com"] = "https://github.com/"
            .. "{_A.ORG}/"
            .. "{_A.REPO}/blob/"
            .. "{_A.DEFAULT_BRANCH}/"
            .. "{_A.FILE}",
        },
      },
    },
    keys = {
      { "<leader>gy", "<cmd>GitLink<cr>", mode = { "n", "v" }, desc = "Yank git link (line)" },
      { "<leader>gY", "<cmd>GitLink file<cr>", mode = { "n", "v" }, desc = "Yank git link (file)" },
      { "<leader>go", "<cmd>GitLink!<cr>", mode = { "n", "v" }, desc = "Open git link in browser (line)" },
      { "<leader>gO", "<cmd>GitLink! file<cr>", mode = { "n", "v" }, desc = "Open git file link in browser (file)" },
    },
  },
}
