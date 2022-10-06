local fn = vim.fn
local sep_style = vim.g.statusline_sep_style
local separators = (type(sep_style) == "table" and sep_style)
  or require("nvchad_ui.icons").statusline_separators[sep_style]
local sep_l = separators["left"]
local sep_r = separators["right"]

local modes = {
  ["n"] = { "N", "St_NormalMode" },
  ["niI"] = { "N i", "St_NormalMode" },
  ["niR"] = { "N r", "St_NormalMode" },
  ["niV"] = { "N v", "St_NormalMode" },
  ["no"] = { "N-P", "St_NormalMode" },
  ["i"] = { "I", "St_InsertMode" },
  ["ic"] = { "I(c)", "St_InsertMode" },
  ["ix"] = { "Ic", "St_InsertMode" },
  ["t"] = { "T", "St_TerminalMode" },
  ["nt"] = { "NT", "St_NTerminalMode" },
  ["v"] = { "V", "St_VisualMode" },
  ["V"] = { "V-L", "St_VisualMode" },
  ["Vs"] = { "V-L(Ctrl O)", "St_VisualMode" },
  [""] = { "V-B", "St_VisualMode" },
  ["R"] = { "R", "St_ReplaceMode" },
  ["Rv"] = { "V-R", "St_ReplaceMode" },
  ["s"] = { "S", "St_SelectMode" },
  ["S"] = { "S-L", "St_SelectMode" },
  [""] = { "S-B", "St_SelectMode" },
  ["c"] = { "C", "St_CommandMode" },
  ["cv"] = { "COMMAND", "St_CommandMode" },
  ["ce"] = { "COMMAND", "St_CommandMode" },
  ["r"] = { "PROMPT", "St_ConfirmMode" },
  ["rm"] = { "MORE", "St_ConfirmMode" },
  ["r?"] = { "CONFIRM", "St_ConfirmMode" },
  ["!"] = { "SHELL", "St_TerminalMode" },
}

local M = {}

M.mode = function()
  local m = vim.api.nvim_get_mode().mode
  local current_mode = "%#" .. modes[m][2] .. "#" .. " " .. modes[m][1]
  local mode_sep1 = "%#" .. modes[m][2] .. "Sep" .. "#" .. sep_r

  return current_mode .. mode_sep1 .. "%#ST_EmptySpace#" .. sep_r
end

M.fileInfo = function()
  local icon = "  "
  local filename = (fn.expand "%" == "" and "Empty ") or fn.expand "%:t"

  if filename ~= "Empty " then
    local devicons_present, devicons = pcall(require, "nvim-web-devicons")

    if devicons_present then
      local ft_icon = devicons.get_icon(filename)
      icon = (ft_icon ~= nil and " " .. ft_icon) or ""
    end

    filename = " " .. filename .. " "
  end

  return "%#St_file_info#" .. icon .. filename .. "%#St_file_sep#" .. sep_r
end

M.git = function()
  if not vim.b.gitsigns_head or vim.b.gitsigns_git_status then
    return ""
  end

  local git_status = vim.b.gitsigns_status_dict

  local added = (git_status.added and git_status.added ~= 0) and ("  " .. git_status.added) or ""
  local changed = (git_status.changed and git_status.changed ~= 0) and ("  " .. git_status.changed) or ""
  local removed = (git_status.removed and git_status.removed ~= 0) and ("  " .. git_status.removed) or ""
  local branch_name = "   " .. git_status.head .. " "

  return "%#St_gitIcons#" .. branch_name .. added .. changed .. removed
end

-- LSP STUFF
M.LSP_progress = function()
  if not rawget(vim, "lsp") then
    return ""
  end

  local Lsp = vim.lsp.util.get_progress_messages()[1]

  if vim.o.columns < 120 or not Lsp then
    return ""
  end

  local msg = Lsp.message or ""
  local percentage = Lsp.percentage or 0
  local title = Lsp.title or ""
  local spinners = { "", "" }
  local ms = vim.loop.hrtime() / 1000000
  local frame = math.floor(ms / 120) % #spinners
  local content = string.format(" %%<%s %s %s (%s%%%%) ", spinners[frame + 1], title, msg, percentage)

  return ("%#St_LspProgress#" .. content) or ""
end

M.LSP_Diagnostics = function()
  if not rawget(vim, "lsp") then
    return ""
  end

  local error = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
  local warning = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
  local hint = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
  local info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })

  local errors = (error and error > 0) and ("%#St_lspError#" .. " " .. error .. " ") or ""
  local warnings = (warning and warning > 0) and ("%#St_lspWarning#" .. "  " .. warning .. " ") or ""
  local hints = (hint and hint > 0) and ("%#St_lspHints#" .. "ﯧ " .. hint .. " ") or ""
  local infos = (info and info > 0) and ("%#St_lspInfo#" .. " " .. info .. " ") or ""

  return errors .. warnings .. hints .. infos
end

M.LSP_status = function()
  local left_sep = "%#St_cwd_sep#" .. sep_l .. "%#St_cwd_icon#" .. " "
  if rawget(vim, "lsp") then
    for _, client in ipairs(vim.lsp.get_active_clients()) do
      if client.attached_buffers[vim.api.nvim_get_current_buf()] then
        return (vim.o.columns > 60 and left_sep.."%#St_LspStatus#" .. client.name .. " ") or " LSP "
      end
    end
  end
end

M.cwd = function()
  local dir_icon = "%#St_pos_icon#" .. " "
  local dir_name = "%#St_cwd_text#" .. " " .. fn.fnamemodify(fn.getcwd(), ":t") .. " "
  return (vim.o.columns > 85 and ("%#St_pos_sep#" .. sep_l .. dir_icon .. dir_name)) or ""
end

M.cursor_position = function()
end

return M
