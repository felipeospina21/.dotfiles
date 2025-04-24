return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
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
