return {
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    opts = {
      history = true,
      delete_check_events = "TextChanged",
    },
    config = function(_, opts)
      require("luasnip").setup(opts)
      -- Load friendly-snippets
      require("luasnip.loaders.from_vscode").lazy_load()
      -- Load custom snippets
      require("config.snippets")
    end,
  },
  {
    "saghen/blink.cmp",
    opts = {
      snippets = {
        preset = "luasnip",
      },
    },
  },
}
