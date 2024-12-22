return {
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require('gitsigns').setup({
                current_line_blame = true,
                signs = {
                    add = { text = '│' },
                    change = { text = '│' },
                    delete = { text = '_' },
                    topdelete = { text = '‾' },
                },
                attach_to_untracked = true,
                preview_config = {
                    border = 'rounded',
                },
            })
        end
    },
    {
        "kdheepak/lazygit.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },
}
