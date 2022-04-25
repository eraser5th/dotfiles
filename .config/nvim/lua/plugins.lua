local jetpack = require('jetpack')
local vim = vim

--- @class Plugin
  -- @fields 1 plugin_name
  -- @fields branch | tag | commit : Branch/ tag/ commit of the repository to use
  -- @fields rtp : Subdirectory that contains Vim plugin
  -- @fields dir : Custom directory for the plugin
  -- @fields as : Use different name for plugin
  -- @fields do : Post-update hook
  -- @fields on : On-demand loading: Commands, <Plug>, Events
  -- @fields for : On-demand loading: File types
  -- @fields frpzen : Do not update

jetpack.startup(function(use)
  use { 'itchyny/lightline.vim' }
  use { 'Yggdroot/indentLine' }

  -- fern
  use { 'lambdalisue/fern.vim', run = "Source 'plugins/fern.vim'" }
  use   'lambdalisue/fern-git-status.vim'
  use   'lambdalisue/nerdfont.vim'
  use   'lambdalisue/glyph-palette.vim'
  use   'lambdalisue/fern-renderer-nerdfont.vim'
  use   'lambdalisue/fern-hijack.vim'
  use   'yuki-yano/fern-preview.vim'

  -- fazy finder
  use { '~/.fzf' }
  use { 'junegunn/fzf.vim', run = "Source 'plugins/fzf.vim'" }

  -- git
  use { 'tpope/vim-fugitive' }
  use { 'airblade/vim-gitgutter' }

  -- lsp
  use { 'dense-analysis/ale', run = "Source 'plugins/ale.vim'" }
  use { 'maximbaz/lightline-ale' }
  use { "neoclide/coc.nvim", branch = 'release', run = "Source 'plugins/coc.nvim.vim'" }
  use { 'nvim-treesitter/nvim-treesitter', run = "Source 'plugins/nvim-treesitter.vim'"}

  -- colorscheme
  use { 'ghifarit53/tokyonight-vim', run = "Source 'plugins/tokyonight-vim.vim'" }
  use { 'eraser5th/HololiveColors.vim', run = "let g:hololive_random = 1" }

  -- util
  use { 'easymotion/vim-easymotion', run = "Source 'plugins/vim-easymotion.vim'" }
  use { 'skanehira/translate.vim', run = "Source 'plugins/translate.vim'" }
  use { 'github/copilot.vim' }
  use { 'skanehira/preview-markdown.vim', run = [[
      nnoremap <Leader>pm :PreviewMarkdown left<CR>
      let g:preview_markdown_auto_update = 1
      let g:preview_markdown_parser = 'glow'
    ]] }
end)

local function loadSetting()
  if jetpack.tap('fern.vim') == 1 then
    vim.cmd('Source "plugins/fern.vim"')
  end
  if jetpack.tap('fzf.vim') == 1 then
    vim.cmd('Source "plugins/fzf.vim"')
  end
  if jetpack.tap('ale.vim') == 1 then
    vim.cmd('Source "plugins/ale.vim"')
  end
  if jetpack.tap('plugins/coc.nvim.vim') == 1 then
    vim.cmd('Source "plugins/coc.nvim.vim"')
  end
  if jetpack.tap('nvim-treesitter.vim') == 1 then
    vim.cmd('Source "plugins/nvim-treesitter.vim"')
  end
  if jetpack.tap('tokyonight-vim.vim') == 1 then
    vim.cmd('Source "plugins/tokyonight-vim.vim"')
  end
  if jetpack.tap('tokyonight-vim.vim') == 1 then
    vim.cmd('Source "plugins/tokyonight-vim.vim"')
  end
  if jetpack.tap('vim-easymotion.vim') == 1 then
    vim.cmd('Source "plugins/vim-easymotion.vim"')
  end
  if jetpack.tap('plugins/translate.vim') == 1 then
    vim.cmd('Source "plugins/translate.vim"')
  end
  if jetpack.tap('preview-markdown.vim') == 1 then
    vim.cmd([[
      nnoremap <Leader>pm :PreviewMarkdown left<CR>
      let g:preview_markdown_auto_update = 1
      let g:preview_markdown_parser = 'glow'
    ]])
  end
end

loadSetting()
