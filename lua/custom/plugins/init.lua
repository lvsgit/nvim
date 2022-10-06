return {
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },
  ["folke/which-key.nvim"] = {
    disable = false,
    cmd = "Whichkey",
  },
  ["NvChad/ui"] = {
    override_options = {
      statusline = {
        overriden_modules = function()
          return require "custom.ui.statusline"
        end,
      },
    }
  },
  ["rcarriga/nvim-notify"] = {
    function()
      require "custom.plugins.config.notify"
    end,
  }
  --[] = false
}
