-- Configures custom Vim options and variables
local opt = vim.opt
local g = vim.g
g.mapleader = " "
g.maplocalleader = " "
opt.hidden = true -- Enable background buffers
opt.undofile = true -- Persistent undo
opt.backup = false -- No backup files
opt.swapfile = false -- No swap files
opt.writebackup = false -- No backup during write
opt.updatetime = 250 -- Faster updates
opt.timeoutlen = 400 -- Time for mapped sequence
opt.fileencoding = "utf-8" -- Default encoding
opt.number = true -- Line numbers
opt.splitright = true -- Horizontal splits right
opt.splitbelow = true -- Vertical splits below
opt.laststatus = 3 -- Global statusline
vim.cmd([[
    filetype plugin indent on
    syntax enable
]])
