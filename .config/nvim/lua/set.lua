local vim = vim
local set = vim.opt

-- git などの更新がデフォルトで4000msと遅いので早める
set.updatetime = 250

-- Search {{{
set.hlsearch = true -- 検索文字列に色を付ける
set.ignorecase = true -- 検索時に大文字小文字を区別しない (noignorecase:区別する)
set.smartcase = true -- 大文字小文字の両方が含まれている場合は大文字小文字を区別
set.wrapscan = true -- 検索時にファイルの最後まで行ったら最初に戻る (nowrapscan:戻らない)
--set.gdefault = true -- 置換時に「/g」をデフォルトで有効にする
-- }}}

-- Edit {{{
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
-- Edit }}}

-- Display {{{
set.number = true
set.cursorline = true
set.ruler = true
set.list = true
set.wrap = true
set.breakindent = true
set.linebreak = true
set.pumheight = 10    -- 補完メニューの高さ(デフォルト：0(無制限))
-- Display }}}

-- Cursor {{{
set.whichwrap = 'b,s,h,l' -- hやlによるカーソル移動で行をまたぐようにする 初期値：b,s
set.scrolloff = 8
-- Cursor }}}

-- Mouse {{{
set.mouse = 'a'
-- Mouse }}}

-- set.term = 'xterm-256color'


-- swap backup undo {{{
set.swapfile = false
-- set.directory = '~/.vim/swap'
set.backup = false
-- set.backupdir = '~/.vim/backup'
set.undofile = false
-- set.undodir = '~/.vim/undo'
-- swap backup undo }}}

-- Clipboard {{{
set.clipboard = 'unnamed'
-- Clipboard }}}

-- time out {{{
set.timeout = true
set.timeoutlen = 800
vim.cmd('AutoCmd InsertLeave * set timeout timeoutlen=800')
vim.cmd('AutoCmd InsertLeave * set timeout timeoutlen=300')
-- time out }}}

-- foldmethod {{{
-- AutoCmd FileType * setlocal foldmethod=marker foldlevel=100
-- AutoCmd FileType * setlocal foldmethod=syntax foldlevel=100
--set.foldcolumn=4
-- }}}

set.guifont = 'VictorMono Nerd Font:h13'
