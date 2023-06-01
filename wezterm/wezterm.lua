local wezterm = require 'wezterm'
local mux = wezterm.mux
local wsl_domains = wezterm.default_wsl_domains()
local act = wezterm.action

for idx, dom in ipairs(wsl_domains) do
  dom.default_prog = { "zsh" }
end

local config = {
  wsl_domains = wsl_domains,
  default_domain = "WSL:Ubuntu",
  -- color_scheme = 'Ocean Dark (Gogh)',
  color_scheme = 'Solarized (dark) (terminal.sexy)',
  enable_tab_bar = true,
  tab_bar_at_bottom = true,
  window_padding = { left = 2, right = 0, top = 3, bottom = 0 },
  font_size = 10.5,
  leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 },
  keys = {
    -- Panes
    {
      key = ',',
      mods = 'LEADER',
      action = act.SplitPane { direction = 'Right', size = { Percent = 50 } },
    },
    {
      key = '-',
      mods = 'LEADER',
      action = act.SplitVertical { domain = 'CurrentPaneDomain' },
    },
    {
      key = 'x',
      mods = 'LEADER',
      action = act.CloseCurrentPane { confirm = false },
    },
    {
      key = 'h',
      mods = 'CTRL|SHIFT',
      action = act.ActivatePaneDirection 'Left',
    },
    {
      key = 'l',
      mods = 'CTRL|SHIFT',
      action = act.ActivatePaneDirection 'Right',
    },
    {
      key = 'k',
      mods = 'CTRL|SHIFT',
      action = act.ActivatePaneDirection 'Up',
    },
    {
      key = 'j',
      mods = 'CTRL|SHIFT',
      action = act.ActivatePaneDirection 'Down',
    },
    {
      key = 'z',
      mods = 'LEADER',
      action = act.TogglePaneZoomState,
    },

    -- Tabs
    {
      key = 'c',
      mods = 'LEADER',
      action = act.SpawnTab 'CurrentPaneDomain',
    },
    {
      key = 'q',
      mods = 'LEADER',
      action = act.CloseCurrentTab { confirm = true }
    },
    {
      key = 'n',
      mods = 'LEADER',
      action = act.ActivateTabRelative(1),
    },
    {
      key = 'p',
      mods = 'LEADER',
      action = act.ActivateTabRelative(-1),
    },
  },
}

-- if wezterm.config_builder then
--   config = wezterm.config_builder()
-- end

wezterm.on('gui-startup', function(cmd)
  local tab, pane, window = mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)

return config
