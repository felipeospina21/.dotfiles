return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        preset = "ivy",
        layout = { position = "top" },
        sources = {
          grep = {
            exclude = {
              "/roxas-e2e/**",
              "/helm/**",
              "/danger/**",
              "/dist/**",
              "/package-lock.json",
              "/junit.xml",
              "meta.json",
            },
          },
          files = {
            exclude = {
              "/roxas-e2e/**",
              "/helm/**",
              "/danger/**",
              "/dist/**",
            },
          },
        },
      },
    },
  },
}
