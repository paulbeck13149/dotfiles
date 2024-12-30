-- Get the config directory path
local config_path = vim.fn.stdpath('config')

-- Add it to the Lua package path
package.path = config_path .. '/?.lua;' .. config_path .. '/?/init.lua;' .. package.path

-- Loads and initializes core configuration
require("core.options")
require("core.mappings")

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Initialize lazy.nvim
require("lazy").setup({
    -- Core functionality plugins
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    -- Load all other plugin configurations
    require("plugins.editor"),
    require("plugins.git"),
    require("plugins.lsp"),
    require("plugins.theme"),
    require("plugins.treesitter"),
    require("plugins.ui"),
    require("plugins.tree"),
    require("plugins.notes"),
})
