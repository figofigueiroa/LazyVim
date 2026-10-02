-- The LazyVim distro import.
-- This file must sort before your other spec files, so keep the `00-` prefix
-- (or an equivalent name that sorts first) to make your own specs override
-- the distro's.
return { { "figofigueiroa/LazyVim", import = "lazyvim.plugins" } }
