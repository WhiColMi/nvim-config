-- init.lua or lua/plugins/autopairs.lua
return {
  "windwp/nvim-autopairs",
  event = "InsertEnter", -- load only when you start typing
  config = function()
    local npairs = require("nvim-autopairs")
    npairs.setup({
      check_ts = true, -- use treesitter for smarter pairing
      fast_wrap = {},  -- optional: wrap with shortcut
      enable_check_bracket_line = false,
    })

    -- integrate with nvim-cmp if you use it
    local cmp_autopairs = require('nvim-autopairs.completion.cmp')
    local cmp = require('cmp')
    cmp.event:on(
      'confirm_done',
      cmp_autopairs.on_confirm_done()
    )
  end
}
