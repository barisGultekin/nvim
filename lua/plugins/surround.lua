return {
  {
    "kylechui/nvim-surround",
    version = "*",
    keys = {
      { "ys", mode = "n" },
      { "yss", mode = "n" },
      { "yS", mode = "n" },
      { "ySS", mode = "n" },
      { "S", mode = "x" },
      { "gS", mode = "x" },
      { "ds", mode = "n" },
      { "cs", mode = "n" },
    },
    opts = {
      keymaps = {
        insert = "<C-g>s",
        insert_line = "<C-g>S",
        normal = "ys",
        normal_cur = "yss",
        normal_line = "yS",
        normal_cur_line = "ySS",
        visual = "S",
        visual_line = "gS",
        delete = "ds",
        change = "cs",
      },
      surrounds = {
        -- Custom tag prompt (use St then type tag name)
        ["t"] = {
          add = function()
            local tag = require("nvim-surround.config").get_input("Tag name: ")
            return { { "<" .. tag .. ">" }, { "</" .. tag .. ">" } }
          end,
        },
        -- Quick div wrapper (Sd in visual mode)
        ["d"] = { { "<div>" }, { "</div>" } },
      },
    },
  },
}
