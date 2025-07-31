local M = {}

function M.run()
  if not pcall(require, "toggleterm") then
    vim.notify("toggleterm not available", vim.log.levels.ERROR)
    return
  end

  local pickers = require("telescope.pickers")
  local finders = require("telescope.finders")
  local actions = require("telescope.actions")
  local action_state = require("telescope.actions.state")
  local conf = require("telescope.config").values
  local Path = require("plenary.path")

  local package_json = Path:new(vim.loop.cwd(), "package.json")
  if not package_json:exists() then
    vim.notify("No package.json found", vim.log.levels.ERROR)
    return
  end

  local decoded = vim.fn.json_decode(package_json:read())
  local scripts = decoded.scripts or {}
  local items = {}

  for name, cmd in pairs(scripts) do
    table.insert(items, {
      name = name,
      cmd = cmd,
      display = name .. " → " .. cmd,
    })
  end

  if #items == 0 then
    vim.notify("No scripts found in package.json", vim.log.levels.WARN)
    return
  end

  pickers.new({}, {
    prompt_title = "Package Scripts",
    finder = finders.new_table {
      results = items,
      entry_maker = function(entry)
        return {
          value = entry,
          display = entry.display,
          ordinal = entry.name,
        }
      end,
    },
    sorter = conf.generic_sorter({}),
    attach_mappings = function(_, map)
      actions.select_default:replace(function(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        if not selection or not selection.value or not selection.value.name then
          vim.notify("No selection made", vim.log.levels.WARN)
          return
        end

        actions.close(prompt_bufnr)

        vim.notify("Running: bun run " .. selection.value.name)

        local Terminal = require("toggleterm.terminal").Terminal
        Terminal:new({
          cmd = "bun run " .. selection.value.name,
          direction = "float",
          close_on_exit = false,
        }):toggle()
      end)
      return true
    end,
  }):find()
end

return M

