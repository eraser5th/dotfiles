local vim = vim
local set = vim.opt

-- git などの更新がデフォルトで4000msと遅いので早める
set.updatetime = 250

-- Search
set.hlsearch = true
set.ignorecase = true
set.smartcase = true
set.wrapscan = true
set.gdefault = true

-- Edit
set.tabstop = 2
set.softtabstop = 2
set.shiftwidth = 2
set.smarttab = true
set.expandtab = true
set.autoindent = true
set.backspace = 'indent,eol,start'
set.showmatch = true
set.matchtime = 1
set.matchpairs:append('<:>')
set.wildmenu = true
set.wildignorecase = true
-- set.formatoptions+=mM          " テキスト挿入中の自動折り返しを日本語に対応させる
set.nrformats = 'alpha'

-- Display
set.number = true
set.cursorline = true
set.ruler = true
set.list = true
set.wrap = true
set.breakindent = true
set.linebreak = true
set.pumheight = 5
set.fillchars = 'eob: '
-- set.ambiwidth = 'double'
-- set.term = 'xterm-256color'

-- Cursor
set.whichwrap = 'b,s,h,l'
set.scrolloff = 8

-- Mouse
set.mouse = 'a'

-- swap backup undo {{{
set.swapfile = false
-- set.directory = '~/.vim/swap'
set.backup = false
-- set.backupdir = '~/.vim/backup'
set.undofile = false
-- set.undodir = '~/.vim/undo'

-- Clipboard
set.clipboard = 'unnamed'

-- time out
set.timeout = true
set.timeoutlen = 800
vim.cmd('AutoCmd InsertLeave * set timeout timeoutlen=800')
vim.cmd('AutoCmd InsertLeave * set timeout timeoutlen=300')
