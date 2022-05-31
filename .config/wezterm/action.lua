local wezterm = require 'wezterm';

local action = {}

action.ActivateLeftTab = wezterm.action({ ActivateTabRelative = -1 })

action.ActivateRightTab = wezterm.action({ ActivateTabRelative = 1 })

action.SpawnDefaultDomainTab = wezterm.action({ SpawnTab = "DefaultDomain" })

action.SpawnCurrendPaneDomainTab = wezterm.action({ SpawnTab = "CurrentPaneDomain" })

action.CloseCurrentTab = wezterm.action({
  CloseCurrentTab = { confirm = true }
})

action.CopyToClipboard = wezterm.action({ CopyTo = "Clipboard" })

action.QuitApplication = "QuitApplication"

action.PasteFromClipboard = wezterm.action({ PasteFrom = "Clipboard" })

action.ReloadConfiguration = "ReloadConfiguration"

action.SpawnWindow = "SpawnWindow"

action.ToggleFullScreen = "ToggleFullScreen"

action.IncreaseFontSize = "IncreaseFontSize"

action.DecreaseFontSize = "DecreaseFontSize"

action.SplitCurrentPaneDomainHorizontal = wezterm.action({
  SplitHorizontal = { domain = "CurrentPaneDomain" }
})

action.SplitCurrentPaneDomainVertical = wezterm.action({
  SplitVertical = { domain = "CurrentPaneDomain" }
})

action.Search = wezterm.action({
  Search = { CaseSensitiveString = ""}
})

action.fn = {}

action.fn.SendString = function (str)
  return wezterm.action({ SendString = str })
end

action.fn.ActivateTab = function (num)
  return wezterm.action({ ActivateTab = num })
end

return action
