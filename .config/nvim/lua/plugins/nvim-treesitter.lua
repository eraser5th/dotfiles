require('nvim-treesitter.configs').setup {
  ensure_installed = {
    "typescript",
    "tsx",
    "javascript",
    "graphql",
    "jsdoc",
    "rust",
    "lua",
    "json",
    "yaml",
    "markdown",
    "dockerfile",
    "html",
    "css",
    "comment",
  },
  highlight = {
    enable = true,
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
}

