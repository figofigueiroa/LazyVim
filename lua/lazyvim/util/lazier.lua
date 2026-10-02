---@tag lazyvim.lazier
---@config-entry ["lazier"]

-- The lazier.nvim bootstrap
-- =====================================================================
--
-- This fork of LazyVim boots through https://github.com/figofigueiroa/lazier.nvim
-- (a patched fork of jake-stewart/lazier.nvim, branch `lazyvim-v2`), which wraps
-- lazy.nvim to:
--  * delay starting lazy.nvim until after the first rendered frame
--  * compile your plugin spec and config into a single bytecode bundle
--  * apply non-lazy plugins and the colorscheme before the first frame
--
-- Users of this fork should bootstrap with the starter template in
-- `starter/` of this repository, whose `init.lua` looks like this:
--
-- >lua
-- local lazierpath = vim.fn.stdpath("data") .. "/lazier/lazier.nvim"
-- if not (vim.uv or vim.loop).fs_stat(lazierpath) then
--   local out = vim.fn.system({
--     "git",
--     "clone",
--     "--filter=blob:none",
--     "--branch=lazyvim-v2",
--     "https://github.com/figofigueiroa/lazier.nvim.git",
--     lazierpath,
--   })
--   if vim.v.shell_error ~= 0 then
--     vim.api.nvim_echo({
--       { "Failed to clone lazier.nvim:\n", "ErrorMsg" },
--       { out, "WarningMsg" },
--       { "\nPress any key to exit...", "MoreMsg" },
--     }, true, {})
--     vim.fn.getchar()
--     os.exit(1)
--   end
-- end
-- vim.opt.rtp:prepend(lazierpath)
--
-- -- Make sure to setup `mapleader` and `maplocalleader` before
-- -- booting LazyVim.
-- vim.g.mapleader = " "
-- vim.g.maplocalleader = " "
--
-- -- Specs live in `lua/plugins/`. The LazyVim distro import must be the
-- -- first user spec file, so name it `00-lazyvim.lua`.
-- require("lazier").setup("plugins", {
--   lazier = {
--     -- specs stay fully explicit: no keymap/autocmd codegen from profile runs
--     generate_lazy_mappings = false,
--   },
--   install = { colorscheme = { "habamax" } },
--   checker = { enabled = false },
--   change_detection = { notify = false },
-- })
-- <
--
-- and `lua/plugins/00-lazyvim.lua` contains the distro import:
--
-- >lua
-- return { { "figofigueiroa/LazyVim", import = "lazyvim.plugins" } }
-- <
--
-- Notes:
--  * `opts.spec` is ignored by lazier: the spec is built from the module
--    passed to `lazier.setup()` (`"plugins"`), so the distro import lives
--    in a spec file instead.
--  * The first start after any change under `lua/` (or after a plugin
--    install updates `lazy-lock.json`) recompiles the bundle and is
--    slower. Subsequent starts use the compiled bundle.
--  * Changes to `init.lua` itself are not tracked by lazier's change
--    detection: run `:LazierClear` after editing it.
--  * `:LazierUpdate` updates lazier, `:LazierClear` clears the compiled
--    cache.

---@class lazyvim.util.lazier
local M = {}

--- Returns `true` when the editor was bootstrapped through lazier.nvim.
---@return boolean
function M.enabled()
  return package.loaded["lazier"] ~= nil
end

--- Returns the detected lazier version, if any.
---@return string?
function M.version()
  local ok, lazier = pcall(require, "lazier")
  if ok and lazier then
    local okv, version = pcall(require, "lazier.version")
    if okv and type(version) == "string" then
      return version
    end
  end
end

return M
