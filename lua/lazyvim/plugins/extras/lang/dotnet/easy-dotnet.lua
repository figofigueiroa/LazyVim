return {
  { -- lazy.nvim
    "GustavEikaas/easy-dotnet.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "folke/snacks.nvim" },
    config = function()
      require("easy-dotnet").setup()
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "c_sharp", "fsharp" } },
  },
}
