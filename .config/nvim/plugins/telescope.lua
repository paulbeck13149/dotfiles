-- Sets up fuzzy finder and pickers
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })

require("telescope").setup({
	defaults = {
		file_ignore_patterns = { "node_modules", ".git/" },
		layout_strategy = "horizontal",
	},
})