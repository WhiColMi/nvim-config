local M = {}

local utils = require("lsp-splits.utils")

function M.hover()
  local responses = vim.lsp.buf_request_sync(0, "textDocument/hover", vim.lsp.util.make_position_params(), 500)
  if not responses then return end

  local all_lines = {}

  for client_id, res in pairs(responses) do
    if res.result and res.result.contents then
      local client_name = vim.lsp.get_client_by_id(client_id).name
      table.insert(all_lines, ("--- %s ---"):format(client_name))

      local contents = res.result.contents
      local markdown_lines = {}

      if type(contents) == "string" then
        markdown_lines = vim.split(contents, "\n")
      elseif type(contents) == "table" then
        if contents.kind and contents.value then
          markdown_lines = vim.split(contents.value, "\n")
        else
          for _, item in ipairs(contents) do
            if type(item) == "string" then
              vim.list_extend(markdown_lines, vim.split(item, "\n"))
            elseif type(item) == "table" and item.value then
              vim.list_extend(markdown_lines, vim.split(item.value, "\n"))
            end
          end
        end
      end

      vim.list_extend(all_lines, vim.lsp.util.trim_empty_lines(markdown_lines))
      table.insert(all_lines, "") -- empty line after each client
    end
  end

  utils.open_in_split(all_lines)
end

function M.definition()
  local resp = vim.lsp.buf_request_sync(
    0,
    "textDocument/definition",
    vim.lsp.util.make_position_params(),
    500
  )
  if not resp then
    print("No response from LSP")
    return
  end

  -- Find first valid result
  local def
  for _, v in pairs(resp) do
    if v.result then
      def = v.result
      break
    end
  end

  if not def then
    print("No definition results")
    return
  end

  -- Normalize: def may be a single object or list
  if def.targetUri or def.uri then
    def = { def }
  end

  local item = def[1]
  if not item then
    print("Empty definition list")
    return
  end

  -- Support both LSP formats
  local uri = item.targetUri or item.uri
  if not uri then
    print("Definition missing uri/targetUri")
    return
  end

  local fname = vim.uri_to_fname(uri)

  vim.cmd("rightbelow vsplit " .. vim.fn.fnameescape(fname))

  -- Prefer targetSelectionRange for LocationLink
  local range = item.targetSelectionRange or item.range
  if range then
    vim.api.nvim_win_set_cursor(
      0,
      { range.start.line + 1, range.start.character }
    )
  end
end

function M.references()
  local params = vim.lsp.util.make_position_params()
  params.context = { includeDeclaration = true }

  local resp = vim.lsp.buf_request_sync(
    0,
    "textDocument/references",
    params,
    800
  )

  if not resp or vim.tbl_isempty(resp) then
    print("No references or request failed")
    return
  end

  -- Locate the first valid result table
  local results
  for _, item in pairs(resp) do
    if item.error or item.err then
      print("LSP error:", item.err and item.err.message or item.error.message)
      return
    end

    if item.result then
      results = item.result
      break
    end
  end

  if not results or vim.tbl_isempty(results) then
    print("No references found")
    return
  end

  local lines = {}

  for _, ref in ipairs(results) do
    local uri = ref.uri or ref.targetUri
    local range = ref.range or ref.targetRange
    if uri and range then
      table.insert(lines, string.format(
        "%s:%d:%d",
        vim.uri_to_fname(uri),
        range.start.line + 1,
        range.start.character + 1
      ))
    end
  end

  utils.open_in_split(lines)
end

function M.code_actions()
  local params = vim.lsp.util.make_range_params()
  params.context = { diagnostics = vim.diagnostic.get_line_diagnostics() }
  local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 500)
  if not result or vim.tbl_isempty(result) then return end

  local lines = {}
  for _, res in pairs(result) do
    for _, action in ipairs(res.result or {}) do
      table.insert(lines, action.title)
    end
  end

  utils.open_in_split(lines)
end

function M.signature_help()
  local params = vim.lsp.util.make_position_params()
  local result = vim.lsp.buf_request_sync(0, "textDocument/signatureHelp", params, 500)
  if not result or not next(result) then return end

  local sigs = result[1].result.signatures
  local lines = {}
  for _, sig in ipairs(sigs or {}) do
    table.insert(lines, sig.label)
  end

  utils.open_in_split(lines)
end

local function split_lines(str)
  local t = {}
  for line in str:gmatch("[^\r\n]+") do
    table.insert(t, line)
  end
  return t
end

function M.error()
  local lines = {}
  for _, diag in ipairs(vim.diagnostic.get()) do
    local prefix = string.format(
      "%s:%d:%d [%s]",
      vim.api.nvim_buf_get_name(diag.bufnr),
      diag.lnum + 1,
      diag.col + 1,
      diag.severity
    )
    for _, l in ipairs(split_lines(diag.message)) do
      table.insert(lines, prefix .. " " .. l)
    end
  end

  utils.open_in_split(lines)
end

return M
