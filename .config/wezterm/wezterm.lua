local wezterm = require("wezterm")

local config = {
	font_size = 13,
	font = wezterm.font("MonoLisa Nerd Font"),
	-- freetype_render_target = "HorizontalLcd",
	freetype_load_flags = "NO_HINTING",
	color_scheme = "Catppuccin Mocha",

	use_fancy_tab_bar = false,
	hide_tab_bar_if_only_one_tab = true,
	window_decorations = "RESIZE",
	show_new_tab_button_in_tab_bar = false,
	-- window_background_opacity = 0.9,
	-- macos_window_background_blur = 70,

	-- text_background_opacity = 0.9,
	adjust_window_size_when_changing_font_size = false,

	window_padding = {
		left = 20,
		right = 20,
		top = 20,
		bottom = 5,
	},
}

return config
