local M = {}

M.plugins = require "custom.plugins"
M.mappings = require "custom.mappings"
M.ui = {
  theme = "gatekeeper",
  hl_override = require "custom.highlights"
}

return M
