return {
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
}
