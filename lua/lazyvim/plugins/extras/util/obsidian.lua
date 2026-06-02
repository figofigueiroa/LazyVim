return {
  "obsidian-nvim/obsidian.nvim",
  ft = "markdown",
  lazy = true,
  event = {
    -- só dispara quando editar um .md dentro de um vault
    "BufReadPre *.md",
    "BufNewFile *.md",
  },
  cond = function()
    local vault = vim.fn.getcwd() .. "/.obsidian"
    return vim.fn.isdirectory(vault) == 1
  end,
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
        path = "~/Documents/notes",
      },
    },
  },
}
