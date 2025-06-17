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
              "/e2e-roxas/**",
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
              "/e2e-roxas/**",
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
