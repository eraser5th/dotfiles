let g:ale_linters = {
\   'vim': ['vint', 'vimls'],
\   'javascript': ['eslint', 'prettier'],
\   'typescript': ['eslint', 'prettier'],
\   'typescriptreact': ['eslint', 'prettier'],
\   'json': ['prettier'],
\   'css': ['stylelint', 'prettier'],
\   'graphql': ['gqlint'],
\   'java': ['google_java_format'],
\   'lua': ['lua-format'],
\ }

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\   'typescript': ['eslint'],
\   'typescriptreact': ['prettier', 'eslint'],
\   'json': ['prettier'],
\   'css': ['stylelint', 'prettier'],
\   'graphql': ['prettier'],
\   'java': ['google_java_format'],
\   'lua': ['lua-format'],
\ }

let g:ale_fix_on_save = 1

let g:ale_javascript_prettier_use_local_config = 1
