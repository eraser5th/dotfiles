local util = require('my_lua_modules.util')
local jetpack = require('jetpack')

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

local plugins = {
  { 'itchyny/lightline.vim' },
  { 'Yggdroot/indentLine' },
  -- fern
  { 'lambdalisue/fern.vim', run = "Source 'plugins/fern.vim'" },
    'lambdalisue/fern-git-status.vim',
    'lambdalisue/nerdfont.vim',
    'lambdalisue/glyph-palette.vim',
    'lambdalisue/fern-renderer-nerdfont.vim',
    'lambdalisue/fern-hijack.vim',
    'yuki-yano/fern-preview.vim',

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

  -- util
  { 'easymotion/vim-easymotion', run = "Source 'plugins/vim-easymotion.vim'" },
  { 'skanehira/translate.vim', run = "Source 'plugins/translate.vim'" },
  { 'github/copilot.vim' },
  { 'skanehira/preview-markdown.vim', run = [[
      nnoremap <Leader>pm :PreviewMarkdown left<CR>
      let g:preview_markdown_auto_update = 1
      let g:preview_markdown_parser = 'glow'
    ]] },
}

jetpack.startup(function(use)
  util.forEach(plugins, function(plugin) use(plugin) end)
end)
