-- lua/plugins/comment.lua
return {
  "numToStr/Comment.nvim",
  opts = {
    -- you can override defaults if necessary
    toggler = { line = "gcc", block = "gbc" },
    opleader = { line = "gc", block = "gb" },
  },
}
