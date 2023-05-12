local wezterm = require('wezterm')

local config = {}

config.initial_cols = 160
config.initial_rows = 50

config.font = wezterm.font("Hack Nerd Font")
config.colors = {
	background = "#24283b",
}


return config

