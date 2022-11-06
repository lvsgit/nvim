local M = {}

M.disabled = {
  n = {
    ["<A-i>"] = "",
    ["<A-h>"] = "",
    ["<A-v>"] = "",
    ["<leader>b"] = "",
    ["<leader>c"] = "",
    ["<leader>ca"] = "",
    ["<leader>cc"] = "",
    ["<leader>cm"] = "",
    ["<leader>D"] = "",
    ["<leader>e"] = "",
    ["<leader>f"] = "",
    ["<leader>fa"] = "",
    ["<leader>fb"] = "",
    ["<leader>ff"] = "",
    ["<leader>fh"] = "",
    ["<leader>fm"] = "",
    ["<leader>fo"] = "",
    ["<leader>fw"] = "",
    ["<leader>g"] = "",
    ["<leader>gt"] = "",
    ["<leader>h"] = "",
    ["<leader>l"] = "",
    ["<leader>ls"] = "",
    ["<leader>n"] = "",
    ["<leader>p"] = "",
    ["<leader>pt"] = "",
    ["<leader>q"] = "",
    ["<leader>r"] = "",
    ["<leader>ra"] = "",
    ["<leader>rn"] = "",
    ["<leader>t"] = "",
    ["<leader>th"] = "",
    ["<leader>tk"] = "",
    ["<leader>tt"] = "",
    ["<leader>u"] = "",
    ["<leader>uu"] = "",
    ["<leader>v"] = "",
    ["<leader>x"] = "",
    ["<leader>w"] = "",
    ["<leader>wa"] = "",
    ["<leader>wk"] = "",
    ["<leader>wK"] = "",
    ["<leader>wl"] = "",
    ["<leader>wr"] = "",
  },
  t = {
    ["<A-i>"] = "",
    ["<A-h>"] = "",
    ["<A-v>"] = "",
  }
}

M.basic = {
  n = {
    ["<"] = { "V<", "toggle tabword" },
    [">"] = { "V>", "toggle tabword" },
    ["<C-a>"] = { "ggVG", "select all" },
    ["<C-Up>"] = { "<cmd>resize -2<cr>", "Resize up"},
    ["<C-Down>"] = { "<cmd>resize +2<cr>", "Resize down"},
    ["<C-Left>"] = { "<cmd>vertical resize -2<cr>", "Resize up"},
    ["<C-Right>"] = { "<cmd>vertical resize +2<cr>", "Resize down"},
    ["<leader>b"] = { "Basic" },
    ["<leader>ba"] = { "<cmd>e C:/Users/lvsan/AppData/Roaming/alacritty/alacritty.yml<cr>", "Alacritty"},
    ["<leader>bb"] = { "<cmd>bdelete!<cr>", "Close buffer" },
    ["<leader>bc"] = { ":e $MYVIMRC<cr> | :cd %:p:h<cr>", "Neovim"},
    ["<leader>bn"] = { "<cmd>set nu!<cr>", "Toggle number" },
    ["<leader>bq"] = { "<cmd>qall!<cr>", "Quit all!" },
    ["<leader>bw"] = { "<cmd>set wrap!<cr>", "Wrap line" },
  },
  v = {
    ["<"] = { "<gv", "Resize tabword"},
    [">"] = { ">gv", "Resize tabword"},
  },
  t = {
    ["jk"] = { [[<C-\><C-n>]], "Return Normal"},
  }
}

M.lspconfig = {
  n = {
    ["<leader>l"] = { "Lsp" },
    ["<leader>lf"] = {
      function()
        vim.lsp.buf.formatting{}
      end,
    },
    ["<leader>lm"] = { "<cmd>Mason<cr>", "Mason" },
    ["<leader>ln"] = {
      function()
        vim.diagnostic.goto_next()
      end,
      "Next error",
    },
    ["<leader>lo"] = {
      function()
        vim.diagnostic.open_float()
      end,
      "floating diagnostic",
    },
    ["<leader>lp"] = {
      function()
        vim.diagnostic.goto_prev()
      end,
      "Previous error",
    },
    ["<leader>lr"] = {
      function()
        require("nvchad_ui.renamer").open()
      end,
      "lsp rename",
    }
  }
}
M.nvimtree = {
  n = {
    ["<leader>e"] = { "<cmd>NvimTreeToggle<cr>", "File explorer" },
  }
}

M.nvchad = {
  n = {
    ["<leader>n"] = { "Nvchad" },
    ["<leader>nu"] = { "<cmd>NvChadUpdate<cr>", "Update" },
  }
}

M.telescope = {
  n = {
    ["<leader>f"] = { "Find" },
    ["<leader>fb"] = { "<cmd>Telescope buffers<cr>", "Buffers" },
    ["<leader>fc"] = { "<cmd>Telescope commands<cr>", "Commands" },
    ["<leader>ff"] = { "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<cr>", "Files" },
    ["<leader>fh"] = { "<cmd>Telescope help_tags<cr>", "Helps" },
    ["<leader>fk"] = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
    ["<leader>fo"] = { "<cmd>Telescope vim_options<cr>", "Vim options"},
    ["<leader>fr"] = { "<cmd>Telescope oldfiles<cr>", "Recent files"},
    ["<leader>fw"] = { "<cmd>Telescope live_grep<cr>", "Word" },
  }
}

M.terminal = {
  n = {
    ["<leader>t"] = { "Terminal" },
    ["<leader>tf"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "Floating term",
    },
    ["<leader>th"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "Horizontal term",
    },
    ["<leader>tn"] = {
      function()
        require("nvterm.terminal").new "horizontal"
      end,
      "New"
    },
    ["<leader>tv"] = {
      function()
        require("nvterm.terminal").toggle "vertical"
      end,
      "Vertical term",
    }
  },
  t = {
    ["<leader>tf"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "Floating term",
    },
    ["<leader>th"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "Horizontal term",
    },
    ["<leader>tv"] = {
      function()
        require("nvterm.terminal").toogle "vertical"
      end,
      "Vertical term",
    }
  }
}

return M
