local is_windows = vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1
local vault = vim.fs.normalize(is_windows and "~/vault" or "~/Documents/notes/vault")

return {
  "obsidian-nvim/obsidian.nvim",
  cmd = "Obsidian",
  lazy = true,
  event = {
    "BufReadPre " .. vault .. "/**.md",
    "BufNewFile " .. vault .. "/**.md",
  },
  keys = {
    -- grupo principal
    { "<leader>o", group = "obsidian" },

    -- navegação / busca
    { "<leader>of", "<cmd>ObsidianFollowLink<cr>", desc = "follow link" },
    { "<leader>ob", "<cmd>ObsidianBacklinks<cr>", desc = "backlinks" },
    { "<leader>oo", "<cmd>ObsidianOpen<cr>", desc = "open in app" },

    -- notas
    { "<leader>on", "<cmd>ObsidianNew<cr>", desc = "new note" },
    { "<leader>oN", "<cmd>ObsidianNewFromTemplate<cr>", desc = "new from template" },

    -- busca
    { "<leader>os", "<cmd>ObsidianSearch<cr>", desc = "search" },
    { "<leader>oq", "<cmd>ObsidianQuickSwitch<cr>", desc = "quick switch" },

    -- tags / links
    { "<leader>ot", "<cmd>ObsidianTags<cr>", desc = "tags" },
    { "<leader>ol", "<cmd>ObsidianLinks<cr>", desc = "links" },
    { "<leader>oi", "<cmd>ObsidianPasteImg<cr>", desc = "paste image" },

    -- modo visual — para criar links a partir de seleção
    { "<leader>ol", "<cmd>ObsidianLink<cr>", desc = "link selection", mode = "v" },
    { "<leader>on", "<cmd>ObsidianLinkNew<cr>", desc = "link to new note", mode = "v" },
  },
  version = "*", -- use latest release, remove to use latest commit
  ---@module 'obsidian'
  ---@type obsidian.config
  opts = {
    legacy_commands = false, -- this will be removed in the next major release
    workspaces = {
      {
        name = "personal",
        path = vault,
      },
    },
  },
}
