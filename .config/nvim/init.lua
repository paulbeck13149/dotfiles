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
<<<<<<< HEAD
=======
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
    -- LSP Support
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",  -- Lua
                    -- Add other servers you want automatically installed
                }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        },
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
        },
    },
>>>>>>> origin
    "nvim-tree/nvim-tree.lua",
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
<<<<<<< HEAD
    -- Load all other plugin configurations
    require("plugins.editor"),
    require("plugins.git"),
    require("plugins.lsp"),
    require("plugins.theme"),
    require("plugins.treesitter"),
    require("plugins.ui"),
=======
    -- Theme
    {
        "miikanissi/modus-themes.nvim",
        priority = 1000,
        config = function()
            require('modus-themes').setup({
                variant = "vivendi",
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
>>>>>>> origin
})
