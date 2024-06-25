local wta = require 'wezterm'.action

local mod = 'CTRL|WIN'
local Smod = 'CTRL|WIN|SHIFT'
local Amod = 'CTRL|WIN|ALT'

local kmp = {

    { key = 'c', mods = mod,
      action = wta.CopyTo "ClipboardAndPrimarySelection" },
    { key = 'v', mods = mod,
      action = wta.PasteFrom "Clipboard" },
    { key = 'x', mods = mod,
      action = wta.ActivateCopyMode, },
    { key = 'Enter', mods = mod,
      action = wta.QuickSelect, },
    { key = 'y', mods = mod,
      action = wta.CompleteSelectionOrOpenLinkAtMouseCursor 'Clipboard', },

    { key = 't', mods = mod,
      action = wta.SpawnTab "CurrentPaneDomain" },
    { key = 'w', mods = mod,
      action = wta.SpawnWindow, },
    { key = 'v', mods = mod,
      action = wta.SplitHorizontal{domain='CurrentPaneDomain'}, },
    { key = 'b', mods = mod,
      action = wta.SplitVertical{domain='CurrentPaneDomain'}, },
    { key = 'q', mods = mod,
      action = wta.CloseCurrentPane{confirm = false}, },

    { key = 'u', mods = mod,
      action = wta.CharSelect },

    { key = 'PageUp', mods = mod,
      action = wta.ScrollByPage(-1), },
    { key = 'PageDown', mods = mod,
      action = wta.ScrollByPage(1), },
    { key = '/', mods = mod,
      action = wta.Search{CaseInSensitiveString=""}, },

	  { key = 'h', mods = mod,
      action = wta.ActivatePaneDirection 'Left', },
    { key = 'j', mods = mod,
      action = wta.ActivatePaneDirection 'Down', },
	  { key = 'k', mods = mod,
      action = wta.ActivatePaneDirection 'Up', },
    { key = 'l', mods = mod,
      action = wta.ActivatePaneDirection 'Right', },

	  { key = 'h', mods = Smod,
      action = wta.AdjustPaneSize {'Left', 1},},
    { key = 'j', mods = Smod,
      action = wta.AdjustPaneSize {'Down', 1},},
	  { key = 'k', mods = Smod,
      action = wta.AdjustPaneSize {'Up', 1},},
    { key = 'l', mods = Smod,
      action = wta.AdjustPaneSize {'Right', 1},},

	  { key = ';', mods = mod,
      action = wta.ActivateTabRelative(1) },
	  { key = ':', mods = Smod,
      action = wta.ActivateTabRelative(1) },
    { key = "'", mods = mod,
      action = wta.ActivateTabRelative(-1) },

    { key = 'n', mods = mod,
      action = wta.SpawnCommandInNewTab {
        args = {'nvim'}, }, },
}
return kmp
