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
  enable_tab_bar = false,
  keys = {
    { key='1', mods='ALT', action= wezterm.action.ShowLauncher }, 
    { key='q', mods='CTRL|SHIFT', action= act.CloseCurrentTab { confirm=true}},
  },
  window_padding = { left=2, right=0, top=3, bottom=0},
  font_size = 11,
  font_rules = {
    {
      intensity='Half',
      italic = true,
      font = wezterm.font {
        family = 'Operator Mono',
        style = 'Italic'
      }
    }
  }, 
}

wezterm.on('gui-startup', function(cmd)
  local tab, pane, window = mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)

return config
