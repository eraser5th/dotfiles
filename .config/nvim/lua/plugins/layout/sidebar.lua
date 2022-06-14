local sidebar = require("sidebar-nvim")

vim.keymap.set('n', '<leader>fs', sidebar.toggle)

local my_custom_section = {
    title = "Section Title",
    icon = "->",
    setup = function(ctx)
        -- called only once and if the section is being used
    end,
    update = function(ctx)
        -- hook callback, called when an update was requested by either the user of external events (using autocommands)
    end,
    draw = function(ctx)
        return "> string here\n> multiline"
    end,
    highlights = {
        groups = { MyHighlightGroup = { gui="#C792EA", fg="#ff0000", bg="#00ff00" } },
        links = { MyHighlightGroupLink = "Keyword" }
    }
}


local options = {
  disable_default_keybindings = 0,
  bindings = {
    ["q"] = function() require("sidebar-nvim").close() end,
  },
  open = false,
  side = "left",
  initial_width = 35,
  hide_statusline = false,
  update_interval = 1000,
  sections = { "datetime", "git", "diagnostics" },
  section_separator = {"", "-----", ""},
  containers = {
    attach_shell = "/bin/sh", show_all = true, interval = 5000,
  },
  datetime = { format = "%a %b %d, %H:%M", clocks = { { name = "local" } } },
  todos = { ignored_paths = { "~" } },
}

sidebar.setup(options)
