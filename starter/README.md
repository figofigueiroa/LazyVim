# LazyVim (lazier) starter

A starter template for [LazyVim](https://github.com/figofigueiroa/LazyVim)
bootstrapped through
[lazier.nvim](https://github.com/figofigueiroa/lazier.nvim) (branch
`lazyvim-v2`), which wraps `lazy.nvim` to delay its start until after the
first rendered frame and to compile your spec and config into a single
bytecode bundle.

## Getting started

```sh
git clone https://github.com/figofigueiroa/LazyVim ~/.config/nvim --depth 1 && \
  cp -r ~/.config/nvim/starter/. ~/.config/nvim/ && \
  rm -rf ~/.config/nvim/.git && \
  nvim
```

The first start installs the plugins, compiles the bundle and is slower.
From the second start on, the editor renders its first frame before
`lazy.nvim` starts (~2x faster to first frame than the stock bootstrap,
with plugins and the colorscheme applied from the compiled cache).

See `:h lazyvim-lazier` for details and caveats.
