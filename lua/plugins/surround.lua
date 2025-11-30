return {
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
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
          -- Custom surrounds for JSX/HTML
          ["t"] = {
            add = function()
              local tag = require("nvim-surround.config").get_input("Tag name: ")
              return { { "<" .. tag .. ">" }, { "</" .. tag .. ">" } }
            end,
          },
          ["T"] = {
            add = function()
              local tag = require("nvim-surround.config").get_input("Tag name: ")
              local attrs = require("nvim-surround.config").get_input("Attributes: ")
              if attrs ~= "" then
                return { { "<" .. tag .. " " .. attrs .. ">" }, { "</" .. tag .. ">" } }
              end
              return { { "<" .. tag .. ">" }, { "</" .. tag .. ">" } }
            end,
          },
          -- Quick div wrapper
          ["d"] = { "<div>", "</div>" },
          -- Quick span wrapper
          ["s"] = { "<span>", "</span>" },
        },
      })
    end,
  },
}
