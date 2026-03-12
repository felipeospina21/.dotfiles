return {
  "CopilotC-Nvim/CopilotChat.nvim",
  enabled = false,
  opts = {
    window = {
      layout = "vertical",
      width = 0.3,
      border = "solid", -- 'single', 'double', 'rounded', 'solid'
    },
    headers = {
      user = "👤 You",
      assistant = "🤖 Copilot",
      tool = "🔧 Tool",
    },
    --
    separator = "---",
    --   auto_fold = true, -- Automatically folds non-assistant messages
  },
}
