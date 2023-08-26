local M = {}

M.config = function()
  local kind = require "turbo.lsp_kind"

  -- Dashboard
  -- =========================================
  lvim.builtin.alpha.mode = "custom"
  local alpha_opts = require("turbo.dashboard").config()
  lvim.builtin.alpha["custom"] = { config = alpha_opts }

  -- Mason
  -- =========================================
  lvim.builtin.mason.ui.icons = kind.mason

  -- NvimTree
  -- =========================================
  lvim.builtin.nvimtree.setup.diagnostics = {
    enable = true,
    icons = {
      hint = kind.icons.hint,
      info = kind.icons.info,
      warning = kind.icons.warn,
      error = kind.icons.error,
    },
  }
  lvim.builtin.nvimtree.on_config_done = function(_)
    lvim.builtin.which_key.mappings["e"] = { "<cmd>NvimTreeToggle<CR>", " Explorer" }
  end

end

return M
