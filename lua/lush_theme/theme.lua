local lush = require("lush")

local c = {
  bg = '#1e1b16',
  bg_alt = '#2a241d',
  fg = '#e9d8c3',
  accent = '#c47f17',

  dark = '#15120e',
  light = '#f5eee6',

  red = '#a9432d',
  green = '#8a9a5b',
  yellow = '#d9a441',
  blue = '#5a6c6e',
  purple = '#755c71',
  orange = '#cb7723',

  border = '#15120e',
  text_pripary = '#e9d8c3',
  text_secondary = '#b8a89e',
  shadow = '#000000',
}

-- Theme definition
local theme = lush(function(injected_functions)
  local sym = injected_functions.sym
  return {
    -- Core UI
    Normal { fg = c.fg, bg = c.bg },
    NormalNC { fg = c.fg, bg = c.bg_alt },
    LineNr { fg = c.text_secondary, bg = c.bg },
    CursorLineNr { fg = c.accent, gui = "bold" },
    VertSplit { fg = c.border, bg = c.bg },
    StatusLine { fg = c.fg, bg = c.bg_alt },
    Pmenu { fg = c.fg, bg = c.bg_alt },
    PmenuSel { fg = c.bg, bg = c.accent },
    Visual { bg = c.accent },
    WinSeparator { fg = c.shadow },

    -- Syntax
    Keyword { fg = c.purple },
    Function { fg = c.orange },
    Identifier { fg = c.fg },
    Comment { fg = c.text_secondary, gui = "italic" },
    String { fg = c.green },
    Number { fg = c.yellow },
    Constant { fg = c.orange },
    Type { fg = c.blue },

    -- Diagnostics
    DiagnosticError { fg = c.red },
    DiagnosticWarn { fg = c.yellow },
    DiagnosticInfo { fg = c.blue },
    DiagnosticHint { fg = c.green },

    -- Telescope
    TelescopeBorder { fg = c.accent, bg = c.bg_alt },
    TelescopePromptBorder { fg = c.orange, bg = c.bg_alt },
    TelescopePromptTitle { fg = c.bg, bg = c.orange },
    TelescopeResultsTitle { fg = c.orange, bg = c.bg_alt },
    TelescopeMatching { fg = c.accent, gui = "bold" },

    -- Nvim-Cmp
    CmpItemAbbr { fg = c.fg },
    CmpItemAbbrMatch { fg = c.accent, gui = "bold" },
    CmpItemMenu { fg = c.text_secondary },

    -- LSP / Diagnostic
    LspInfoBorder { fg = c.accent },
    LspSignatureActiveParameter { fg = c.accent, gui = "bold" },

    -- Treesitter context
    TreesitterContext { bg = c.bg_alt },

    -- Mason
    MasonNormal { fg = c.fg, bg = c.bg },
    MasonHeader { fg = c.bg, bg = c.accent, gui = "bold" },
    MasonHeaderSecondary { fg = c.bg, bg = c.orange },
    MasonHighlight { fg = c.accent },
    MasonHighlightBlock { fg = c.bg, bg = c.accent },
    MasonHighlightBlockBold { fg = c.bg, bg = c.accent, gui = "bold" },
    MasonMuted { fg = c.text_secondary },
    MasonMutedBlock { fg = c.bg, bg = c.text_secondary },
    MasonError { fg = c.red },
    MasonWarning { fg = c.yellow },
    MasonInfo { fg = c.blue },

    -- Neo-tree
    NeoTreeNormal { bg = c.bg },
    NeoTreeBorder { fg = c.border },
    NeoTreeName { fg = c.text_primary, bg = c.bg },
    NeoTreeDirectoryName { fg = c.orange },
    NeoTreeDirectoryIcon { fg = c.orange },
    NeoTreeModified { fg = c.accent },
    NeoTreeGitAdded { fg = c.green },
    NeoTreeGitModified { fg = c.yellow },
    NeoTreeGitDeleted { fg = c.red },
    NeoTreeGitRenamed { fg = c.orange },
    NeoTreeGitUntracked { fg = c.purple },
    NeoTreeGitIgnored { fg = c.text_secondary },
    NeoTreeDimText { fg = c.text_secondary },

    -- LSPSaga
    LspSagaHoverBorder { fg = c.accent, bg = c.bg },
    LspSagaHover { fg = c.fg, bg = c.bg },
    LspSagaCodeActionBorder { fg = c.accent, bg = c.bg },
    LspSagaCodeActionTitle { fg = c.accent, bg = c.bg, gui = "bold" },
    LspSagaCodeActionContent { fg = c.fg, bg = c.bg },
    LspSagaRenameBorder { fg = c.accent, bg = c.bg },
    LspSagaSignatureHelpBorder { fg = c.accent, bg = c.bg },
    LspSagaFinderSelection { fg = c.bg, bg = c.accent },
    LspSagaDefPreviewBorder { fg = c.accent, bg = c.bg },
    LspSagaDefPreview { fg = c.fg, bg = c.bg },

    -- Trouble
    TroubleBasename { fg = c.orange },
    TroubleCode { fg = c.text_secondary },
    TroubleCount { fg = c.accent, bold = true },
    TroubleDirectory { fg = c.orange },
    TroubleFilename { fg = c.orange },
    TroubleIconArray { fg = c.yellow },
    TroubleIconBoolean { fg = c.purple },
    TroubleIconClass { fg = c.blue },
    TroubleIconConstant { fg = c.orange },
    TroubleIconConstructor { fg = c.green },
    TroubleIconDirectory { fg = c.orange },
    TroubleIconEnum { fg = c.blue },
    TroubleIconEnumMember { fg = c.accent },
    TroubleIconEvent { fg = c.yellow },
    TroubleIconField { fg = c.text_secondary },
    TroubleIconFile { fg = c.fg },
    TroubleIconFunction { fg = c.orange },
    TroubleIconInterface { fg = c.purple },
    TroubleIconKey { fg = c.accent },
    TroubleIconMethod { fg = c.orange },
    TroubleIconModule { fg = c.blue },
    TroubleIconNamespace { fg = c.blue },
    TroubleIconNull { fg = c.text_secondary },
    TroubleIconNumber { fg = c.yellow },
    TroubleIconObject { fg = c.orange },
    TroubleIconOperator { fg = c.accent },
    TroubleIconPackage { fg = c.blue },
    TroubleIconProperty { fg = c.green },
    TroubleIconString { fg = c.green },
    TroubleIconStruct { fg = c.blue },
    TroubleIconTypeParameter { fg = c.accent },
    TroubleIconVariable { fg = c.fg },
    TroubleIndent { fg = c.text_secondary },
    TroubleIndentFoldClosed { fg = c.accent },
    TroubleIndentFoldOpen { fg = c.text_secondary },
    TroubleNormal { fg = c.fg, bg = c.bg },
    TroubleNormalNC { fg = c.fg, bg = c.bg_alt },
    TroublePos { fg = c.text_secondary },
    TroublePreview { bg = c.accent },
    TroubleSource { fg = c.text_secondary, italic = true },
    TroubleText { fg = c.fg },
  }
end)

return theme
