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

  -- exproler
  { 'kyazdani42/nvim-web-devicons' },
  { 'kyazdani42/nvim-tree.lua' },

  -- fazy finder
  -- { '~/.fzf' },
  -- { 'junegunn/fzf.vim', run = "Source 'plugins/fzf.vim'" },
  { 'nvim-telescope/telescope.nvim' },
    { 'nvim-telescope/telescope-media-files.nvim' },

  -- git
  { 'tpope/vim-fugitive' },
  { 'airblade/vim-gitgutter' },

  -- lsp
  { 'dense-analysis/ale' },
  { 'maximbaz/lightline-ale' },
  { "neoclide/coc.nvim", branch = 'release' },
  { 'nvim-treesitter/nvim-treesitter'},
    { 'nvim-treesitter/nvim-treesitter-context' },
    -- { 'haringsrob/nvim_context_vt' },

  -- colorscheme
  { 'ghifarit53/tokyonight-vim' },
  { 'eraser5th/HololiveColors.vim', run = "let g:hololive_random = 1" },
  { "EdenEast/nightfox.nvim" },

  -- highlight
  { 'RRethy/vim-illuminate' },
  { 't9md/vim-quickhl' },
  { 'mvllow/modes.nvim' },

  -- layout
  { 'sidebar-nvim/sidebar.nvim' },
  { 'petertriho/nvim-scrollbar' },

  -- util
  { 'easymotion/vim-easymotion' },
  { 'skanehira/translate.vim' },
  { 'github/copilot.vim' },
  { 'skanehira/preview-markdown.vim', run = [[
      nnoremap <Leader>pm :PreviewMarkdown left<CR>
      let g:preview_markdown_auto_update = 1
      let g:preview_markdown_parser = 'glow'
    ]] },
  { 'gelguy/wilder.nvim' },
  { 'rcarriga/nvim-notify' },
  { 'tyru/open-browser.vim' },
  { 'tyru/open-browser-github.vim' },
  { 'renerocksai/telekasten.nvim' },
  { 'renerocksai/calendar-vim' },

  -- lua library
  { 'nvim-lua/plenary.nvim' },
  { 'nvim-lua/popup.nvim' },
})

local function loadSetting()
  -- if jetpack.tap('fzf.vim') == 1 then
    -- require('plugins.fzf')
  -- end
  if jetpack.tap('telescope.nvim') == 1 then
    require('plugins.telescope')
  end
  if jetpack.tap('ale') == 1 then
    require('plugins.ale')
  end
  if jetpack.tap('plugins/coc.nvim') == 1 then
    require('plugins.coc-nvim')
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
    require('plugins.nightfox')
    vim.cmd("colorscheme duskfox")
    vim.g.lightline = { colorscheme = "duskfox" }
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
  if jetpack.tap('nvim-tree.lua') == 1 then
    require('plugins.nvim-tree')
  end
  if jetpack.tap('nvim-notify') == 1 then
    vim.notify = require("notify")
  end

  -- highlight
  if jetpack.tap('vim-illuminate') == 1 then
    require('plugins.vim-illuminate')
  end
  if jetpack.tap('vim-quickhl') == 1 then
    require('plugins.vim-quickhl')
  end
  if jetpack.tap('modes.nvim') == 1 then
    require('plugins.modes')
  end

  -- layout
  if jetpack.tap('sidebar.nvim') == 1 then
    require('plugins.layout.sidebar')
  end
  if jetpack.tap('nvim-scrollbar') == 1 then
    require('plugins.layout.nvim-scrollbar')
  end

  -- util
  if jetpack.tap('telekasten.nvim') == 1 then
    require('plugins.util.telekasten')
  end
end

util.setKeymap({'n', '<Leader>ls', loadSetting})

loadSetting()
