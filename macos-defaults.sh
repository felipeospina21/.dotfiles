#!/bin/bash

# macOS Preferences
# ─────────────────────────────────────────────────────────────────────────────
# dock autohide              → Dock hides automatically, appears on hover
# dock tilesize 55           → Dock icon size 55px (default 48)
# dock mru-spaces false      → Spaces stay in fixed order, no auto-rearrange
# finder FXPreferredViewStyle → Finder opens in list view by default
# AppleInterfaceStyle Dark   → System-wide dark mode
# swipescrolldirection false → Traditional scroll (down=down), affects both trackpad & mouse
# screencapture location     → Screenshots save to ~/Documents/
# mouse.scaling 1.5          → Mouse tracking speed (default ~1.0)
# hotkey 60 disabled         → Frees Ctrl+Space for IDE autocomplete
# hotkey 61 disabled         → Frees Cmd+Option+Space
# hotkeys 15-26 disabled     → Frees Ctrl+1-12 for editor tab/panel switching
# killall Dock Finder        → Restarts both so changes take effect immediately
# ─────────────────────────────────────────────────────────────────────────────

# Dock
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock tilesize -int 55
defaults write com.apple.dock mru-spaces -bool false

# Finder
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Global
defaults write NSGlobalDomain AppleInterfaceStyle -string "Dark"
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# Screenshots
defaults write com.apple.screencapture location-last -string "~/Documents/"

# Mouse
defaults write NSGlobalDomain com.apple.mouse.scaling -float 1.5

# Keyboard shortcuts — disable input source switching (conflicts with IDE autocomplete)
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 60 '{ enabled = 0; }'
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 61 '{ enabled = 0; }'

# Keyboard shortcuts — disable Switch to Desktop 1-12 (conflicts with editor shortcuts)
for id in $(seq 15 26); do
	defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add "$id" '{ enabled = 0; }'
done

# Restart affected apps
killall Dock Finder
