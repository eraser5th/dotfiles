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
  -- exproler
  { 'kyazdani42/nvim-tree.lua' },

  -- fazy finder
  { 'nvim-telescope/telescope.nvim' },
    { 'nvim-telescope/telescope-media-files.nvim' },

  -- git
  { 'tpope/vim-fugitive' },
  -- { 'airblade/vim-gitgutter' },
  { 'pwntester/octo.nvim' },
  { 'lewis6991/gitsigns.nvim' },

  -- lsp
  { 'dense-analysis/ale' },
  -- { 'maximbaz/lightline-ale' }, -- this require lightline
  { "neoclide/coc.nvim", branch = 'release' },
  { 'nvim-treesitter/nvim-treesitter'},
    { 'nvim-treesitter/nvim-treesitter-context' },
    -- { 'haringsrob/nvim_context_vt' },

  -- colorscheme
  { 'ghifarit53/tokyonight-vim' },
  { 'eraser5th/HololiveColors.vim' },
  { "EdenEast/nightfox.nvim" },

  -- highlight
  { 'RRethy/vim-illuminate' },
  { 't9md/vim-quickhl' },
  { 'mvllow/modes.nvim' },
  -- { 'Yggdroot/indentLine' },
  -- { "lukas-reineke/indent-blankline.nvim" },
  { 'rrethy/vim-hexokinase', run = 'make hexokinase' },

  -- layout
  { 'sidebar-nvim/sidebar.nvim' },
  { 'petertriho/nvim-scrollbar' },
  { 'glepnir/galaxyline.nvim' },
  { 'sunjon/stylish.nvim' },
  { 'akinsho/bufferline.nvim' },
  { 'romgrk/barbar.nvim' },

  -- misc
  { 'phaazon/hop.nvim' },
  { 'skanehira/translate.vim' },
  { 'github/copilot.vim' },
  { 'skanehira/preview-markdown.vim', },
  { 'gelguy/wilder.nvim' },
  { 'rcarriga/nvim-notify' },
  { 'tyru/open-browser.vim' },
  { 'tyru/open-browser-github.vim' },
  { 'renerocksai/telekasten.nvim' },
  { 'renerocksai/calendar-vim' },
  { 'anuvyklack/hydra.nvim' },
    { 'anuvyklack/keymap-layer.nvim' },
  -- { 'jubnzv/virtual-types.nvim' },

  -- library and environment
  { 'nvim-lua/plenary.nvim' },
  { 'nvim-lua/popup.nvim' },
  { 'kyazdani42/nvim-web-devicons' },
  { 'vim-denops/denops.vim' },
    { 'vim-denops/denops-helloworld.vim' },
})

local function installAndLoadSetting()
  local isExistNotInstalledPlugin = false

  util.forEach(jetpack.names(), function(plugin, _)
    if not jetpack.tap(plugin) then
      isExistNotInstalledPlugin = true
      jetpack.sync()
    end
  end)

  -- exproler
  util.loadPluginConfigFile('nvim-tree.lua', 'plugins.nvim-tree')

  -- fazy finder
  util.loadPluginConfigFile('telescope.nvim', 'plugins.telescope')

  -- git
  util.loadPluginConfigFile('octo.nvim', 'plugins.git.octo')
  -- util.loadPluginConfigFile('vim-gitgutter', 'plugins.git.vim-gitgutter')

  -- lsp
  util.loadPluginConfigFile('ale', 'plugins.lsp.ale')
  util.loadPluginConfigFile('coc.nvim', 'plugins.lsp.coc')
  util.loadPluginConfigFile('nvim-treesitter', 'plugins.lsp.nvim-treesitter')

  -- colorscheme
  util.loadPluginConfigFile('tokyonight-vim', 'plugins.colorscheme.tokyonight-vim')
  util.loadPluginConfigFile('nightfox.nvim', 'plugins.colorscheme.nightfox')
  vim.cmd("colorscheme duskfox")

  -- highlight
  util.loadPluginConfigFile('illuminate', 'plugins.highlight.vim-illuminate')
  util.loadPluginConfigFile('quickhl', 'plugins.highlight.vim-quickhl')
  -- util.loadPluginConfigFile('modes.nvim', 'plugins.highlight.modes')
  util.loadPluginConfigFile('indent-blankline.nvim', 'plugins.highlight.indent-blankline')

  -- layout
  util.loadPluginConfigFile('stylish.nvim', 'plugins.layout.stylish')
  -- util.loadPluginConfigFile('lualine.nvim', 'plugins.layout.lualine')
  util.loadPluginConfigFile('galaxyline.nvim', 'plugins.layout.galaxyline')
  if not isExistNotInstalledPlugin then
    util.loadPluginConfigFile('nvim-scrollbar', 'plugins.layout.nvim-scrollbar')
    util.loadPluginConfigFile('sidebar.nvim', 'plugins.layout.sidebar')
  end
  util.loadPluginConfigFile('bufferline.nvim', 'plugins.layout.bufferline')
  util.loadPluginConfigFile('barbar.nvim', 'plugins.layout.barbar')

  -- misc
  util.loadPluginConfigFile('hop.nvim', 'plugins.misc.hop')
  util.loadPluginConfigFile('translate.vim', 'plugins.misc.translate')
  util.loadPluginConfigFile('wilder.nvim', 'plugins.misc.wilder')
  util.loadPluginConfigFile('telekasten.nvim', 'plugins.misc.telekasten')
  util.loadPluginConfigFile('preview_markdown.vim', 'plugins.misc.preview-markdown')
  if jetpack.tap('nvim-notify') == 1 then
    vim.notify = require("notify")
  end
  util.loadPluginConfigFile('hydra.nvim', 'plugins.misc.hydra')
  util.loadPluginConfigFile('gitsigns.nvim', 'plugins.misc.gitsigns')
end

installAndLoadSetting()
