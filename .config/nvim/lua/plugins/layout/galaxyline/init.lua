local galaxyline = require('galaxyline')
local condition = require("galaxyline.condition")
local colors = require('plugins.layout.galaxyline.colors')
local my_provider = require('plugins.layout.galaxyline.my_gl_provider')
local gl_util = require('plugins.layout.galaxyline.gl_util')

local gls = galaxyline.section
galaxyline.short_line_list = {'NvimTree', 'packager', 'vista'}

local function create_cell(provider_name, content)
  return {
    [provider_name] = content
  }
end

local diagnostics_provider = require('galaxyline.provider_diagnostic')

local diagnosticCondition = function ()
  local hint = diagnostics_provider.get_diagnostic_info()
  local error = diagnostics_provider.get_diagnostic_error()
  local warn = diagnostics_provider.get_diagnostic_warn()
  local info = diagnostics_provider.get_diagnostic_info()

  local has_hint = hint ~= '' and hint ~= nil
  local has_error = error ~= '' and error ~= nil
  local has_warn = warn ~= '' and warn ~= nil
  local has_info = info ~= '' and info ~= nil

  -- debug
  -- vim.cmd('echo "hint: ' .. tostring(has_hint) .. ', error: ' .. tostring(has_error) .. ', warn: ' .. tostring(has_warn) .. ', info: ' .. tostring(has_info) .. '"')

  -- vim.cmd('echo "' .. tostring(hint) .. ', ' .. tostring(error) .. ', ' .. tostring(warn) .. ', ' .. tostring(info) .. '"')

  -- local _,dia_info = pcall(vim.api.nvim_buf_get_var,0,'coc_diagnostic_info')
  -- vim.cmd('echo "' .. tostring(dia_info['warning']) .. '"')

  -- return true
  -- return has_hint or has_error or has_warn or has_info
  return true -- 泣
end

-- components
local function SectionStart(condition_)
  return create_cell('SectionStart', {
    provider = function () return "" end,
    condition = condition_,
    highlight = {colors.bg, colors.section_bg},
  })
end

local function SectionStartUpsideDown(condition_)
  return create_cell('SectionStartUpsideDown', {
    provider = function () return "" end,
    condition = condition_,
    highlight = {colors.section_bg, colors.bg},
  })
end

local function SectionEnd(condition_)
  return create_cell('SectionEnd', {
    provider = function() return '' end,
    condition = condition_,
    highlight = {colors.bg, colors.section_bg},
  })
end

local function SectionEndUpsideDown(condition_)
  return create_cell('SectionEndUpsideDown', {
    provider = function() return '' end,
    condition = condition_,
    highlight = {colors.section_bg, colors.bg},
  })
end

local function SpaceOfSection(condition_)
  return create_cell('SpaceOfSection', {
    provider = function () return " " end,
    condition = condition_,
    highlight = {colors.bg, colors.section_bg},
  })
end

local function SpaceInSection(condition_)
  return create_cell('SpaceInSection', {
    provider = function () return " " end,
    condition = condition_,
    highlight = {colors.bg, colors.bg},
  })
end


-- Left side
gls.left = {
  create_cell('ViMode', {
    provider = my_provider.ViMode_provider,
    highlight = {colors.bg, colors.bg, 'bold'},
    separator = '',
  }),
  SectionEnd(),

  SpaceOfSection(),
  SpaceOfSection(),

  create_cell('FileIcon', {
    provider = 'FileIcon',
    highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color, colors.section_bg}
  }),
  create_cell('FileName', {
    provider = 'FileName',
    highlight = {colors.fg, colors.section_bg},
  }),

  SpaceOfSection(),

  -- git status start
  SectionStart(condition.check_git_workspace),
  create_cell('GitBranch', {
    icon = '   ',
    provider = function()
      local vcs = require('galaxyline.provider_vcs')
      local branch_name = vcs.get_git_branch()
      if (string.len(branch_name) > 28) then
        return string.sub(branch_name, 1, 25) .. "..."
      end
      return branch_name .. " "
    end,
    condition = condition.check_git_workspace,
    highlight = {gl_util.get_git_status_color(), colors.bg, 'bold'},
  }),
  create_cell('DiffAdd', {
    provider = 'DiffAdd',
    condition = condition.check_git_workspace,
    icon = '  ',
    highlight = {colors.green, colors.bg}
  }),
  create_cell('DiffModified', {
    provider = 'DiffModified',
    condition = condition.check_git_workspacesection_bgbg,
    icon = '  ',
    highlight = {colors.orange, colors.bg}
  }),
  create_cell('DiffRemove', {
    provider = 'DiffRemove',
    condition = condition.check_git_workspace,
    icon = '  ',
    highlight = {colors.red, colors.bg}
  }),
  SectionEnd(condition.check_git_workspace),
  -- git status end

  SectionStartUpsideDown(),
  create_cell('GetLspClient', {
    provider = 'GetLspClient',
    icon = '   ',
    highlight = {colors.blue, colors.bg, 'bold'},
  }),
  create_cell('SpaceInSection', {
    provider = function () return " " end,
    highlight = {colors.bg, colors.bg},
  }),
  SectionEndUpsideDown(),

  -- diagnostic start
  SectionStart(diagnosticCondition),
  create_cell('DiagnosticError', {
    provider = 'DiagnosticError',
    icon = '   ',
    condition = diagnosticCondition,
    highlight = {colors.red, colors.bg}
  }),
  create_cell('DiagnosticWarn', {
    provider = 'DiagnosticWarn',
    icon = '   ',
    condition = diagnosticCondition,
    highlight = {colors.orange, colors.bg}
  }),
  create_cell('DiagnosticHint', {
    provider = 'DiagnosticHint',
    icon = '   ',
    condition = diagnosticCondition,
    highlight = {colors.blue, colors.bg}
  }),
  create_cell('DiagnosticInfo', {
    provider = 'DiagnosticInfo',
    condition = diagnosticCondition,
    icon = '   ',
    highlight = {colors.green, colors.bg},
  }),
  SpaceInSection(diagnosticCondition),
  SectionEnd(diagnosticCondition),
}

-- Right side
gls.right = {
  SectionStart(),
  SpaceInSection(),
  create_cell('FileEncode', {
    provider = 'FileEncode',
    highlight = {colors.fg, colors.bg},
  }),
  SpaceInSection(),
  SectionEnd(),

  SectionStartUpsideDown(),
  SpaceInSection(),
  create_cell('LinePercent', {
    provider = 'LinePercent',
    highlight = {colors.green, colors.bg},
  }),
  SpaceInSection(),
  create_cell('LineColumn', {
    provider = 'LineColumn',
    highlight = {colors.fg, colors.bg},
  }),
  SectionEndUpsideDown(),

  SectionStart(),
  create_cell('FileFormat', {
    provider = function() return vim.bo.filetype end,
    highlight = 'GalaxyViMode',
    separator = '',
    separator_highlight = 'ViModeSeparator',
  }),
}

-- Short status line
gls.short_line_left[1] = {
  BufferType = {
    provider = 'FileTypeName',
    highlight = {colors.fg, colors.section_bg},
    separator = ' ',
    separator_highlight = {colors.section_bg, colors.bg}
  }
}

gls.short_line_right[1] = {
  BufferIcon = {
    provider = 'BufferIcon',
    highlight = {colors.yellow, colors.section_bg},
    separator = '',
    separator_highlight = {colors.section_bg, colors.bg}
  }
}

-- Force manual load so that nvim boots with a status line
galaxyline.load_galaxyline()
