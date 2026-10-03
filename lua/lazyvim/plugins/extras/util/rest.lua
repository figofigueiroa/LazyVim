vim.filetype.add({
  extension = {
    ["http"] = "http",
  },
})
return {
  {
    "figofigueiroa/rest.nvim",
    ft = "http",
    keys = {
      { "<leader>R", "", desc = "+Rest" },
      { "<leader>Re", "<cmd>Rest env select<cr>", desc = "Select environment", ft = "http" },
      { "<leader>Ro", "<cmd>Rest open<cr>", desc = "Open result pane", ft = "http" },
      { "<leader>Rr", "<cmd>Rest run<cr>", desc = "Send the request", ft = "http" },
      { "<leader>RR", "<cmd>Rest last<cr>", desc = "Replay the last request", ft = "http" },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "http", "graphql" },
    },
  },
}
