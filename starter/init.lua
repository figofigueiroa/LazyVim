-- Bootstrap lazier.nvim (a wrapper around lazy.nvim that delays its start
-- until after the first frame and compiles your spec + config into a
-- single bytecode bundle).
-- Specs live in `lua/plugins/`; the LazyVim distro import lives in
-- `lua/plugins/00-lazyvim.lua` and must stay the first spec file.
local lazierpath = vim.fn.stdpath("data") .. "/lazier/lazier.nvim"
if not (vim.uv or vim.loop).fs_stat(lazierpath) then
  local out = vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=lazyvim-v2",
    "https://github.com/figofigueiroa/lazier.nvim.git",
    lazierpath,
  })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazier.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit...", "MoreMsg" },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazierpath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- booting LazyVim, so that mappings are correct.
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Install and start plugins via lazier.
-- The spec is built from the `lua/plugins/` module; `opts.spec` is ignored.
require("lazier").setup("plugins", {
  lazier = {
    -- specs stay fully explicit: no keymap/autocmd codegen from profile runs
    generate_lazy_mappings = false,
  },
  install = { colorscheme = { "habamax" } },
  checker = { enabled = false },
  change_detection = { notify = false },
})

-- vim: ts=2 sts=2 sw=2 et
