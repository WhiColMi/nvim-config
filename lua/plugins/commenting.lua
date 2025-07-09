return {
  'numToStr/Comment.nvim',
  lazy = false,
  config = function()
    require("Comment").setup()
    require("Comment.ft").set("lf", "#%s")
  end
}

