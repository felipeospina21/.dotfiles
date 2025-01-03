-- rose pine colors
-- base00: "#191724"
-- base01: "#1f1d2e"
-- base02: "#26233a"
-- base03: "#6e6a86"
-- base04: "#908caa"
-- base05: "#e0def4"
-- base06: "#e0def4"
-- base07: "#524f67"
-- base08: "#eb6f92"
-- base09: "#f6c177"
-- base0A: "#ebbcba"
-- base0B: "#31748f"
-- base0C: "#9ccfd8"
-- base0D: "#c4a7e7"
-- base0E: "#f6c177"
-- base0F: "#524f67"

local wezterm = require("wezterm")
local mux = wezterm.mux
local act = wezterm.action
-- local solarized_bg = "#00495c"
-- local solarized_fg_active = "#ea9a97"
local rose_pine_bg = "#1f1d2e"
local rose_pine_fg_active = "#9ccfd8"
local tab_fg_inactive = "#808080"
local cwd = ""

local config = {
	color_scheme = "astrodark",
	-- color_scheme = "rose-pine",
	-- color_scheme = "Solarized (dark) (terminal.sexy)",
	-- TODO: Remove after wezterm is updated with latest Nerd Icon Font
	font = wezterm.font_with_fallback({ "JetBrains Mono", "Symbols Nerd Font" }),
	window_background_opacity = 0.85,
	inactive_pane_hsb = { saturation = 0.7, brightness = 0.6 },
	window_padding = { left = 4, right = 0, top = 2, bottom = 0 },
	warn_about_missing_glyphs = false,
	enable_tab_bar = true,
	tab_bar_at_bottom = true,
	tab_max_width = 32,
	use_fancy_tab_bar = false,
	send_composed_key_when_left_alt_is_pressed = false,
	send_composed_key_when_right_alt_is_pressed = false,
	font_size = 10.5,
	command_palette_font_size = 12,
	leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 },
	skip_close_confirmation_for_processes_named = {
		"bash",
		"sh",
		"zsh",
		"fish",
		"tmux",
		"nu",
		"cmd.exe",
		"pwsh.exe",
		"powershell.exe",
	},
	colors = {
		tab_bar = {
			background = "transparent",
			new_tab = {
				bg_color = "transparent",
				fg_color = "#eb6f92",
				intensity = "Bold",
			},
		},
	},
	keys = {
		-- Panes
		{
			key = ",",
			mods = "LEADER",
			action = act.SplitPane({ direction = "Right", size = { Percent = 50 } }),
		},
		{
			key = "t",
			mods = "LEADER",
			action = act.SplitPane({ direction = "Right", size = { Percent = 35 } }),
		},
		{
			key = "-",
			mods = "LEADER",
			action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
		},
		{
			key = "x",
			mods = "LEADER",
			action = act.CloseCurrentPane({ confirm = true }),
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
		{
			key = "m",
			mods = "CTRL|SHIFT",
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
			action = wezterm.action_callback(function(window)
				local home = os.getenv("HOME")
				local mux_window = window:mux_window()

				-- check https://wezfurlong.org/wezterm/config/lua/ExecDomain.html
				mux_window:spawn_tab({ cwd = home .. "/projects/" })
			end),
		},
		-- Spawns new tab & execut glabt cmd
		{
			key = "g",
			mods = "LEADER",
			action = wezterm.action_callback(function(window)
				local home = os.getenv("HOME")
				local mux_window = window:mux_window()
				local _, pane = mux_window:spawn_tab({ cwd = home })
				pane:send_text("glabt\n")
			end),
		},
		-- Spawns new tab & navigates to .Dotfiles through zoxide
		{
			key = "d",
			mods = "LEADER",
			action = wezterm.action_callback(function(window)
				local home = os.getenv("HOME")
				local mux_window = window:mux_window()
				local _, pane = mux_window:spawn_tab({ cwd = home })
				pane:send_text("z dot && nvim .\n")
			end),
		},
		-- Rename current tab
		{
			key = "r",
			mods = "LEADER",
			action = act.PromptInputLine({
				description = "Enter new name for tab",
				action = wezterm.action_callback(function(window, pane, line)
					-- line will be `nil` if they hit escape without entering anything
					-- An empty string if they just hit enter
					-- Or the actual line of text they wrote
					if line then
						window:active_tab():set_title(line)
					end
				end),
			}),
		},
		{
			key = "w",
			mods = "LEADER",
			action = wezterm.action_callback(function(window, pane)
				local home = os.getenv("HOME")
				local tab = window:active_tab()
				local mux_window = window:mux_window()
				local spTab, spPane, _ = mux_window:spawn_tab({ cwd = home })
				spPane:send_text("z spellbook\n")
				spTab:set_title("spellbook")

				pane:send_text("z rad\n")
				pane:send_text("nvim .\n")
				tab:activate()
			end),
		},
	},
}

-- function basename(s)
-- 	return string.gsub(s, "(.*[/\\])(.*)", "%2")
-- end

wezterm.on("format-tab-title", function(tab, _, _, _, _, max_width)
	local background = "transparent"
	local foreground = tab_fg_inactive

	if tab.is_active then
		background = rose_pine_bg
		foreground = rose_pine_fg_active
	end

	local title = (tab.tab_title and #tab.tab_title > 0) and tab.tab_title or tab.active_pane.title

	-- NOTE: It looks for the [No Name] like string
	local noName = title:match("^%[(.-)%]")
	if noName == "No Name" then
		-- NOTE: It looks what is after hyphens (-)
		title = title:match("(%S+)$")
	else
		-- NOTE: this regex captures the first part before an empty space(process) & the part after (other)
		local input, _ = title:match("^(%S+)%s*%-?%s*%s*(.*)$")
		if input ~= nil then
			title = input:match("^(.-)%s*:?%s*$")
		end
	end

	local text = " " .. string.lower(title) .. " "
	title = wezterm.truncate_right(text, max_width - 2)

	-- TODO: check if these lines have a high perf cost
	-- local pane = tab.active_pane
	-- local title = basename(pane.foreground_process_name)
	-- title = wezterm.truncate_right(title, max_width - 2)
	return {
		{ Attribute = { Intensity = "Bold" } },
		{ Background = { Color = background } },
		{ Foreground = { Color = foreground } },
		{ Text = " [" .. tab.tab_index + 1 .. "]:" .. title .. " " },
	}
end)

if wezterm.target_triple == "x86_64-pc-windows-msvc" then
	-- Configs for Windows only
	local wsl_domains = wezterm.default_wsl_domains()
	for _, dom in ipairs(wsl_domains) do
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

	-- wezterm.on("gui-startup", function(cmd)
	-- 	local home = os.getenv("HOME")
	--
	-- 	-- allow `wezterm start -- something` to affect what we spawn
	-- 	-- in our initial window
	-- 	local args = {}
	-- 	if cmd then
	-- 		args = cmd.args
	-- 	end
	--
	-- 	local mainTab, mainPane, window = mux.spawn_window({
	-- 		workspace = "Disney",
	-- 		cwd = home .. "/projects/radar/",
	-- 		args = args,
	-- 	})
	--
	-- 	local spTab, spPane, _ = window:spawn_tab({
	-- 		workspace = "Disney",
	-- 		args = args,
	-- 	})
	-- 	spPane:send_text("z spellbook\n")
	-- 	spTab:set_title("spellbook")
	--
	-- 	mainPane:send_text("nvim .\n")
	-- 	mainTab:set_title("radar")
	-- 	mainTab:activate()
	-- end)
end

return config
