local util = require('util')

util.setKeymap({'n', '<Leader>ls', '<Plug>(quickhl-manual-this-whole-word)', { remap = true }})
util.setKeymap({'x', '<Leader>ls', '<Plug>(quickhl-manual-this-whole-word)', { remap = true }})

util.setKeymap({'n', '<Leader>m', '<Plub>(quickhl-manual-this)', { remap = true }})
util.setKeymap({'x', '<Leader>m', '<Plub>(quickhl-manual-this)', { remap = true }})

util.setKeymap({'n', '<Leader>M', '<Plub>(quickhl-manual-reset)', { remap = true }})
util.setKeymap({'x', '<Leader>M', '<Plub>(quickhl-manual-reset)', { remap = true }})

util.setKeymap({'n', '<Leader>c', '<Plub>(quickhl-manual-clear)', { remap = true }})
util.setKeymap({'x', '<Leader>c', '<Plub>(quickhl-manual-clear)', { remap = true }})
