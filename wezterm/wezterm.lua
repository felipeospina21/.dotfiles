local wezterm = require("wezterm")
local mux = wezterm.mux
local act = wezterm.action
local tab_bg = "#00495c"
local tab_fg_active = "#ea9a97"
local tab_fg_inactive = "#808080"
local cwd = "~/projects"

local config = {
	-- color_scheme = 'Ocean Dark (Gogh)',
	color_scheme = "Solarized (dark) (terminal.sexy)",
	enable_tab_bar = true,
	tab_bar_at_bottom = true,
	use_fancy_tab_bar = false,
	send_composed_key_when_left_alt_is_pressed = false,
	send_composed_key_when_right_alt_is_pressed = false,
	window_padding = { left = 2, right = 0, top = 3, bottom = 0 },
	font_size = 10.5,
	leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 },
	keys = {
		-- Panes
		{
			key = ",",
			mods = "LEADER",
			action = act.SplitPane({ direction = "Right", size = { Percent = 50 } }),
		},
		{
			key = "-",
			mods = "LEADER",
			action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
		},
		{
			key = "x",
			mods = "LEADER",
			action = act.CloseCurrentPane({ confirm = false }),
		},
		{
			key = "h",
			mods = "CTRL|SHIFT",
			action = act.ActivatePaneDirection("Left"),
		},
		{
			key = "l",
			mods = "CTRL|SHIFT",
			action = act.ActivatePaneDirection("Right"),
		},
		{
			key = "k",
			mods = "CTRL|SHIFT",
			action = act.ActivatePaneDirection("Up"),
		},
		{
			key = "j",
			mods = "CTRL|SHIFT",
			action = act.ActivatePaneDirection("Down"),
		},
		{
			key = "z",
			mods = "LEADER",
			action = act.TogglePaneZoomState,
		},

		-- Tabs
		{
			key = "c",
			mods = "LEADER",
			action = act.SpawnTab("CurrentPaneDomain"),
		},
		{
			key = "q",
			mods = "LEADER",
			action = act.CloseCurrentTab({ confirm = true }),
		},
		{
			key = "n",
			mods = "LEADER",
			action = act.ActivateTabRelative(1),
		},
		{
			key = "p",
			mods = "LEADER",
			action = act.ActivateTabRelative(-1),
		},

		{
			key = "m",
			mods = "LEADER",

			action = act.PromptInputLine({
				description = wezterm.format({
					{ Attribute = { Intensity = "Bold" } },
					{ Foreground = { AnsiColor = "Fuchsia" } },
					{ Text = "Enter project folder name" },
				}),
				action = wezterm.action_callback(function(window, pane, line)
					local mux_window = window:mux_window()
					local dir = cwd

					-- check https://wezfurlong.org/wezterm/config/lua/ExecDomain.html

					if line then
						dir = "~/projects/" .. line
					end

					act.SpawnCommandInNewWindow({
						label = "List all the files!",

						args = { "ls", "-al" },
					})
					local _, new_pane, _ = mux_window:spawn_tab({ cwd = dir })
					new_pane:split({ size = 0.5, cwd = dir })
				end),
			}),
		},
	},
}

wezterm.on("format-tab-title", function(tab)
	local background = "transparent"
	local foreground = tab_fg_inactive

	if tab.is_active then
		background = tab_bg
		foreground = tab_fg_active
	end

	return {
		{ Attribute = { Intensity = "Bold" } },
		{ Background = { Color = background } },
		{ Foreground = { Color = foreground } },
		{ Text = "  " .. tab.tab_index .. "  " },
	}
end)

if wezterm.target_triple == "x86_64-pc-windows-msvc" then
	-- Configs for Windows only
	local wsl_domains = wezterm.default_wsl_domains()
	for idx, dom in ipairs(wsl_domains) do
		dom.default_prog = { "zsh" }
	end
	config.wsl_domains = wsl_domains
	config.default_domain = "WSL:Ubuntu"
	-- default_prog = { "wsl.exe", "~", "-d", "Ubuntu-20.04" }
	--
	wezterm.on("gui-startup", function(cmd)
		local _, _, window = mux.spawn_window(cmd or { cwd = cwd })
		window:gui_window():maximize()
		-- local _, pane, _ = window:spawn_tab({ cwd = cwd })
		-- pane:split({ size = 0.5, cwd = cwd })
	end)
end

if wezterm.target_triple == "x86_64-apple-darwin" then
	-- Configs for OSX only
	config.font_size = 14.5
	config.command_palette_font_size = 18
end

return config
