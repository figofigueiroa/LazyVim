return {
  recommended = function()
    return LazyVim.extras.wants({
      ft = { "cs", "vb", "fsharp" },
      root = { "*.sln", "*.csproj", "*.fsproj", "omnisharp.json", "function.json", "paket.dependencies", "paket.lock" },
    })
  end,
  {
    "GustavEikaas/easy-dotnet.nvim",
  },
}
