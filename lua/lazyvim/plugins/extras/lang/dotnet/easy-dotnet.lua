return {
  recommended = function()
    return LazyVim.extras.wants({
      ft = { "cs", "vb", "fsharp" },
      root = { "*.sln", "*.csproj", "*.fsproj", "omnisharp.json", "function.json", "paket.dependencies", "paket.lock" },
    })
  end,

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
