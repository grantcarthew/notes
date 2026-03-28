# Neovim <!-- omit from toc -->

Neovim configuration and plugin setup notes.

- [References](#references)
- [Config Structure](#config-structure)
- [Plugin Manager](#plugin-manager)
- [Plugins](#plugins)
  - [Markdown](#markdown)

## References

- [lazy.nvim](https://lazy.folke.io/): Modern plugin manager for Neovim
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter): Treesitter configurations and abstraction layer for Neovim
- [render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim): Plugin to improve viewing Markdown files in Neovim
- [neovimcraft](https://neovimcraft.com/): Curated list of Neovim plugins

## Config Structure

`~/.config/nvim`:

```txt
> nvim
├── > init.lua
├── > lazy-lock.json
└── > lua
    ├── > config
    │   └── > lazy.lua
    └── > plugins
        └── > markdown.lua
```

## Plugin Manager

Plugins are managed with [lazy.nvim](https://lazy.folke.io/). Each plugin has its own file under `lua/plugins/`.

`init.lua`:

```lua
require("config.lazy")
```

`lua/config/lazy.lua`:

```lua
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
  install = { colorscheme = { "habamax" } },
  checker = { enabled = true },
})
```

## Plugins

### Markdown

Renders styled markdown in normal mode (coloured headings, code blocks, tables) and reverts to raw syntax in insert mode. Only loads for `.md` files.

`lua/plugins/markdown.lua`:

```lua
return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").setup({
        ensure_installed = { "markdown", "markdown_inline" },
      })
    end,
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    ft = { "markdown" },
    opts = {},
  },
}
```

Descriptions:

- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter): Provides the `markdown` and `markdown_inline` parsers for syntax awareness
- [render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim): Renders styled markdown in normal mode, raw syntax in insert mode
