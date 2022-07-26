local vim = vim

vim.g.ale_linters = {
  vim             = { 'vint',      'vimls'    },
  javascript      = { 'eslint',    'prettier' },
  typescript      = { 'eslint',    'prettier' },
  javascriptreact = { 'eslint',    'prettier' },
  typescriptreact = { 'eslint',    'prettier' },
  json            = { 'prettier'              },
  css             = { 'stylelint', 'prettier' },
  graphql         = { 'gqlint'                },
  java            = { 'google_java_format'    },
  lua             = { 'lua-format'            },
}

vim.g.ale_fixers = {
  ['*']           = { 'remove_trailing_lines', 'trim_whitespace' },
  javascript      = { 'prettier', 'eslint' },
  typescript      = { 'prettier', 'eslint' },
  javascriptreact = { 'prettier', 'eslint' },
  typescriptreact = { 'prettier', 'eslint' },
  json            = { 'prettier' },
  css             = { 'stylelint', 'prettier' },
  graphql         = { 'prettier' },
  java            = { 'google_java_format' },
  lua             = { 'lua-format' },
}

vim.g.ale_fix_on_save = 1

vim.g.ale_javascript_prettier_use_local_config = 1
