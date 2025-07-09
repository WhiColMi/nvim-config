local colors = require("theme")

-- Apply basic UI highlights
vim.api.nvim_set_hl(0, "Normal",         { fg = colors.fg, bg = colors.bg })
vim.api.nvim_set_hl(0, "NormalNC",       { fg = colors.fg, bg = colors.bg_alt })
vim.api.nvim_set_hl(0, "LineNr",         { fg = colors.text_secondary, bg = colors.bg })
vim.api.nvim_set_hl(0, "CursorLineNr",   { fg = colors.accent, bold = true })
vim.api.nvim_set_hl(0, "VertSplit",      { fg = colors.border, bg = colors.bg })
vim.api.nvim_set_hl(0, "StatusLine",     { fg = colors.fg, bg = colors.bg_alt })
vim.api.nvim_set_hl(0, "Pmenu",          { fg = colors.fg, bg = colors.bg_alt })
vim.api.nvim_set_hl(0, "PmenuSel",       { fg = colors.bg, bg = colors.accent })
vim.api.nvim_set_hl(0, "Visual",         { bg = colors.accent })

-- Diagnostics
vim.api.nvim_set_hl(0, "DiagnosticError", { fg = colors.red })
vim.api.nvim_set_hl(0, "DiagnosticWarn",  { fg = colors.yellow })
vim.api.nvim_set_hl(0, "DiagnosticInfo",  { fg = colors.blue })
vim.api.nvim_set_hl(0, "DiagnosticHint",  { fg = colors.green })

-- Syntax highlights (basic)
vim.api.nvim_set_hl(0, "Keyword",      { fg = colors.purple })
vim.api.nvim_set_hl(0, "Function",     { fg = colors.orange })
vim.api.nvim_set_hl(0, "Identifier",   { fg = colors.fg })
vim.api.nvim_set_hl(0, "Comment",      { fg = colors.text_secondary, italic = true })
vim.api.nvim_set_hl(0, "String",       { fg = colors.green })
vim.api.nvim_set_hl(0, "Number",       { fg = colors.yellow })
vim.api.nvim_set_hl(0, "Constant",     { fg = colors.orange })
vim.api.nvim_set_hl(0, "Type",         { fg = colors.blue })

-- Optional: blend in that nice shadow
vim.api.nvim_set_hl(0, "WinSeparator", { fg = colors.shadow })

-- Telescope
vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = colors.accent, bg = colors.bg_alt })
vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = colors.orange, bg = colors.bg_alt })
vim.api.nvim_set_hl(0, "TelescopePromptTitle", { fg = colors.bg, bg = colors.orange })
vim.api.nvim_set_hl(0, "TelescopeResultsTitle", { fg = colors.orange, bg = colors.bg_alt })
vim.api.nvim_set_hl(0, "TelescopeMatching", { fg = colors.accent, bold = true })

-- Nvim-Cmp
vim.api.nvim_set_hl(0, "CmpItemAbbr", { fg = colors.fg })
vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = colors.accent, bold = true })
vim.api.nvim_set_hl(0, "CmpItemMenu", { fg = colors.text_secondary })

-- LSP / Diagnostic
vim.api.nvim_set_hl(0, "LspInfoBorder", { fg = colors.accent })
vim.api.nvim_set_hl(0, "LspSignatureActiveParameter", { fg = colors.accent, bold = true })

-- Treesitter context
vim.api.nvim_set_hl(0, "TreesitterContext", { bg = colors.bg_alt })

-- Mason
vim.api.nvim_set_hl(0, "MasonNormal", { fg = colors.fg, bg = colors.bg })
vim.api.nvim_set_hl(0, "MasonHeader", { fg = colors.bg, bg = colors.accent, bold = true })
vim.api.nvim_set_hl(0, "MasonHeaderSecondary", { fg = colors.bg, bg = colors.orange })
vim.api.nvim_set_hl(0, "MasonHighlight", { fg = colors.accent })
vim.api.nvim_set_hl(0, "MasonHighlightBlock", { fg = colors.bg, bg = colors.accent })
vim.api.nvim_set_hl(0, "MasonHighlightBlockBold", { fg = colors.bg, bg = colors.accent, bold = true })
vim.api.nvim_set_hl(0, "MasonMuted", { fg = colors.text_secondary })
vim.api.nvim_set_hl(0, "MasonMutedBlock", { fg = colors.bg, bg = colors.text_secondary })
vim.api.nvim_set_hl(0, "MasonError", { fg = colors.red })
vim.api.nvim_set_hl(0, "MasonWarning", { fg = colors.yellow })
vim.api.nvim_set_hl(0, "MasonInfo", { fg = colors.blue })

-- Neo-tree window bg & border
vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = colors.bg })
vim.api.nvim_set_hl(0, "NeoTreeBorder", { fg = colors.border })
vim.api.nvim_set_hl(0, "NeoTreeName", { fg = colors.text_primary, bg = colors.bg })
vim.api.nvim_set_hl(0, "NeoTreeDirectoryName", { fg = colors.orange })
vim.api.nvim_set_hl(0, "NeoTreeDirectoryIcon", { fg = colors.orange })
vim.api.nvim_set_hl(0, "NeoTreeModified", { fg = colors.accent })
vim.api.nvim_set_hl(0, "NeoTreeGitAdded", { fg = colors.green })
vim.api.nvim_set_hl(0, "NeoTreeGitModified", { fg = colors.yellow })
vim.api.nvim_set_hl(0, "NeoTreeGitDeleted", { fg = colors.red })
vim.api.nvim_set_hl(0, "NeoTreeGitRenamed", { fg = colors.orange })
vim.api.nvim_set_hl(0, "NeoTreeGitUntracked", { fg = colors.purple })
vim.api.nvim_set_hl(0, "NeoTreeGitIgnored", { fg = colors.text_secondary })
vim.api.nvim_set_hl(0, "NeoTreeDimText", { fg = colors.text_secondary })
vim.api.nvim_set_hl(0, "WinSeparator", { fg = colors.shadow })
