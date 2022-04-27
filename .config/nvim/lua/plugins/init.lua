local jetpack = require('jetpack')
local util = require('util')
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

jetpack.setup({
  { 'vim-denops/denops.vim' },
    { 'vim-denops/denops-helloworld.vim' },
  { 'itchyny/lightline.vim' },
  { 'Yggdroot/indentLine' },

  -- fern
  { 'lambdalisue/fern.vim', run = "Source 'plugins/fern.vim'" },
    { 'lambdalisue/fern-git-status.vim' },
    { 'lambdalisue/nerdfont.vim' },
    { 'lambdalisue/glyph-palette.vim' },
    { 'lambdalisue/fern-renderer-nerdfont.vim' },
    { 'lambdalisue/fern-hijack.vim' },
    { 'yuki-yano/fern-preview.vim' },

  -- fazy finder
  { '~/.fzf' },
  { 'junegunn/fzf.vim', run = "Source 'plugins/fzf.vim'" },

  -- git
  { 'tpope/vim-fugitive' },
  { 'airblade/vim-gitgutter' },

  -- lsp
  { 'dense-analysis/ale', run = "Source 'plugins/ale.vim'" },
  { 'maximbaz/lightline-ale' },
  { "neoclide/coc.nvim", branch = 'release', run = "Source 'plugins/coc.nvim.vim'" },
  { 'nvim-treesitter/nvim-treesitter', run = "Source 'plugins/nvim-treesitter.vim'"},

  -- colorscheme
  { 'ghifarit53/tokyonight-vim', run = "Source 'plugins/tokyonight-vim.vim'" },
  { 'eraser5th/HololiveColors.vim', run = "let g:hololive_random = 1" },
  { "EdenEast/nightfox.nvim" },

  -- util
  { 'easymotion/vim-easymotion', run = "Source 'plugins/vim-easymotion.vim'" },
  { 'skanehira/translate.vim' },
  { 'github/copilot.vim' },
  { 'skanehira/preview-markdown.vim', run = [[
      nnoremap <Leader>pm :PreviewMarkdown left<CR>
      let g:preview_markdown_auto_update = 1
      let g:preview_markdown_parser = 'glow'
    ]] },
  { 'gelguy/wilder.nvim', run = "Source 'plugins/wilder.nvim'" },
})

local function loadSetting()
  if jetpack.tap('fern.vim') == 1 then
    vim.cmd('Source "plugins/fern.vim"')
  end
  if jetpack.tap('fzf.vim') == 1 then
    require('plugins.fzf')
  end
  if jetpack.tap('ale') == 1 then
    require('plugins.ale')
  end
  if jetpack.tap('plugins/coc.nvim') == 1 then
    vim.cmd('Source "plugins/coc.nvim.vim"')
    require('plugins.coc.nvim')
  end
  if jetpack.tap('nvim-treesitter') == 1 then
    require('plugins.nvim-treesitter')
  end
  if jetpack.tap('tokyonight-vim') == 1 then
    require('plugins.tokyonight-vim')
  end
  if jetpack.tap('vim-easymotion') == 1 then
    require('plugins.vim-easymotion')
  end
  -- if jetpack.tap('HololiveColors.vim') == 1 then
    -- vim.g.hololive_random = 1
  -- end
  if jetpack.tap('nightfox.nvim') == 1 then
    vim.cmd("colorscheme nightfox")
    vim.g.lightline = { colorscheme = "nightfox" }
  end
  if jetpack.tap('preview-markdown.vim') == 1 then
    vim.cmd([[
      nnoremap <Leader>pm :PreviewMarkdown left<CR>
      let g:preview_markdown_auto_update = 1
      let g:preview_markdown_parser = 'glow'
    ]])
  end
  if jetpack.tap('wilder.nvim') == 1 then
    require('plugins.wilder-nvim')
  end
end

util.setKeymap({'n', '<Leader>ls', loadSetting})

loadSetting()
