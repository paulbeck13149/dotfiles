-- Configures syntax highlighting
require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"lua",
		"vim",
		"vimdoc", -- Neovim basics
		"javascript",
		"typescript", -- Web basics
		"python",
		"rust", -- Common languages
	},
	highlight = { enable = true },
	indent = { enable = true },
})