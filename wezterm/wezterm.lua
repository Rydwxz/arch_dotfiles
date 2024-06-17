local wt = require 'wezterm'

local cfg = {

  font = wt.font_with_fallback {
    { family = "FiraCode Nerd Font", weight="Regular", stretch="Normal", style="Normal" },
    { family = "FiraMono Nerd Font Mono", weight="Regular", stretch="Normal", style="Normal" },
    { family = "Fira Code Symbol", weight="Regular", stretch="Normal", style="Normal" },
  }, -- /usr/share/fonts/TTF/FiraCodeNerdFontMono-Light.ttf, FontConfig
  font_size = 13.8,

  enable_tab_bar = false,

  window_background_opacity = 0.75,
  window_padding = {left=2, right=2, top=2, bottom=2, },

  colors = {
    foreground = '#ffb7f8',
    -- background = '#160014',
    background = '#000000',
    cursor_bg = '#e90020', -- spaceship dir/char
    cursor_border = '#e90020', -- spaceship dir/char
    ansi = {
      '#4e596b',
      '#f34c5a',
      '#5bcc8f',
      '#ffec5a',
      '#9586f4',
      '#fb5ea3',
      '#79c8b6',
      '#91a0b1',
    },
    brights = {
      '#91a0b1',
      '#ff727f',
      '#4eed99',
      '#fdf08f',
      '#b0a4ff',
      '#ff8dbf',
      '#96f2dd',
      '#f7e3e3',
    },
    selection_fg = '#160014',
    selection_bg = '#ef4288',
    split = '#b10024', -- nice shade
  },
  force_reverse_video_cursor = true, -- disable for cool red cursor
  default_cursor_style = 'BlinkingBlock',
  cursor_blink_rate = 1000,
  cursor_blink_ease_in = 'Constant',
  cursor_blink_ease_out = 'Constant',

  window_close_confirmation = "NeverPrompt",

  leader = { key = 'z', mods = 'WIN', },
  disable_default_key_bindings = true,
  keys = require 'kmp',
  default_prog = { '/usr/bin/zsh' }, -- gets rid ugly print at startup, which is the multiplexer and deserves a better solution, but I'm not using the multiplexer atm

}
return cfg
