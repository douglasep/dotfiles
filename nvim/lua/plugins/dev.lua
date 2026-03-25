local set = vim.api.nvim_set_hl

-- Ruby Variables
set(0, "@variable.ruby", { fg = "#FFCC80", italic = true })

-- Ruby Strings
set(0, "@string.ruby", { fg = "#B3E5FC", italic = true })

-- Ruby Symbols
set(0, "@symbol.ruby", { fg = "#C5E1A5", bold = true })

-- Rails Keywords
set(0, "@keyword.ruby", { fg = "#FFE082", bold = true })

-- Ruby Comments
set(0, "@comment.ruby", { fg = "#D1C4E9", italic = true })

-- Ruby Constants
set(0, "@constant.ruby", { fg = "#FFAB91", bold = true })

-- Numbers
set(0, "@number.ruby", { fg = "#B2EBF2", bold = true })

-- Methods
set(0, "@function.ruby", { fg = "#C8E6C9", bold = true })

-- Class Names
set(0, "@type.ruby", { fg = "#FFCC80", bold = true })

-- Function Parameters
set(0, "@parameter.ruby", { fg = "#FFCCBC", italic = true })

-- Block keywords (do/end/if etc)
set(0, "@keyword.control.ruby", { fg = "#C5E1A5", bold = true })

return {

  { "tpope/vim-surround" },

  { "numToStr/Comment.nvim", opts = {} },

  { "windwp/nvim-autopairs", event = "InsertEnter", opts = {} },

  { "folke/trouble.nvim", opts = {} },

  {
    "Shatur/neovim-ayu",
    lazy = false,
    priority = 1000,
    config = function()
      require("ayu").setup({
        mirage = true,
      })
      -- vim.cmd("colorscheme ayu")
    end,
  },
  {
    "sainnhe/everforest",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.everforest_background = "medium"
      vim.g.everforest_enable_italic = 1
      vim.cmd("colorscheme everforest")
    end,
  },
}
