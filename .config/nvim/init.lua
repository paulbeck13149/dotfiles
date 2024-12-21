-- Bootstraps base editor setup and plugin system

-- Get the config directory path
local config_path = vim.fn.stdpath('config')

-- Add it to the Lua package path
package.path = config_path .. '/?.lua;' .. config_path .. '/?/init.lua;' .. package.path

-- Loads and initializes core configuration
require("core.options")
require("core.mappings")

-- Loads and initializes plugin manager
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

require("lazy").setup({
    -- Core plugins
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    { 
        "nvim-treesitter/nvim-treesitter", 
        build = ":TSUpdate",
        config = function()
            require('nvim-treesitter.configs').setup({
                ensure_installed = { "lua" },
                highlight = { enable = true },
            })
        end
    },
    "neovim/nvim-lspconfig",
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
        },
    },
    "nvim-tree/nvim-tree.lua",
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    -- Add the Modus theme
    {
        "miikanissi/modus-themes.nvim",
        priority = 1000,
        config = function()
            require('modus-themes').setup({
                variant = "vivendi", -- Forces the dark variant
                dim_inactive = false,
                styles = {
                    comments = { italic = true },
                    keywords = { italic = true },
                    functions = {},
                    variables = {},
                },
            })
            vim.cmd([[colorscheme modus]])
        end,
    },
})
