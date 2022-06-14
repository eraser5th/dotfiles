vim = vim

local hop = require('hop')

hop.setup()

local function hopWord()
  hop.hint_words()
end

local function hopLine()
  hop.hint_lines()
end

vim.keymap.set({'n', 'o', 'v', 'x'}, 'f', hopWord, {})
vim.keymap.set({'n', 'o', 'v', 'x'}, '<Leader>hl', hopLine, {})
vim.keymap.set({'n', 'o', 'v', 'x'}, '<Leader>hf', ":HopChar1<cr>", {})
vim.keymap.set({'n', 'o', 'v', 'x'}, '<Leader>hh', ":HopChar2<cr>", {})
vim.keymap.set({'n', 'o', 'v', 'x'}, '<Leader>hp', ":HopPattern<cr>", {})
