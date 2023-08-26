local M = {}

M.config = function()

  lvim.plugins = {

    {
      "rose-pine/neovim",
      name = "rose-pine",
      config = function()
        require("turbo.theme").rose_pine()
        lvim.colorscheme = "rose-pine"
      end,
      cond = function()
        local _time = os.date "*t"
        return (_time.hour >= 1 and _time.hour < 9) and lvim.builtin.time_based_themes
      end,
    },
    {
      "catppuccin/nvim",
      name = "catppuccin",
      config = function()
        require("turbo.theme").catppuccin()
        local _time = os.date "*t"
        if (_time.hour >= 17 and _time.hour < 21) and lvim.builtin.time_based_themes then
          lvim.colorscheme = "catppuccin-mocha"
        end
      end,
    },
    {
      "rebelot/kanagawa.nvim",
      config = function()
        require("turbo.theme").kanagawa()
          lvim.colorscheme = "kanagawa"
      end,
      cond = function()
        local _time = os.date "*t"
        return ((_time.hour >= 21 and _time.hour < 24) or (_time.hour >= 0 and _time.hour < 1))
          and lvim.builtin.time_based_themes
      end,
    },
    { "MunifTanjim/nui.nvim" },
    {
      "declancm/cinnamon.nvim",
      config = function()
        require("cinnamon").setup {
          default_keymaps = true,
          default_delay = 4,
          extra_keymaps = true,
          extended_keymaps = false,
          centered = true,
          scroll_limit = 100,
        }
      end,
      event = "BufRead",
      enabled = lvim.builtin.smooth_scroll == "cinnamon",
    },
    -- {
    --   "folke/noice.nvim",
    --   event = "VeryLazy",
    --   config = function()
    --     require("turbo.noice").config()
    --   end,
    --   dependencies = {
    --     "rcarriga/nvim-notify",
    --   },
    --   enabled = lvim.builtin.noice.active,
    -- },

  }

end


return M
