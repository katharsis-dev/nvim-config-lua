local opts = { noremap = true, silent = true }
require('neogen').setup {
    enabled = true,             --if you want to disable Neogen
    input_after_comment = false, -- (default: true) automatic jump (with insert mode) on inserted annotation
    -- jump_map = "<C-e>"       -- (DROPPED SUPPORT, see [here](#cycle-between-annotations) !) The keymap in order to jump in the annotation fields (in insert mode)
    languages = {
        python = {
            template = {
                annotation_convention = "reST", -- for a full list of annotation_conventions, see supported-languages below,
                -- for more template configurations, see the language's configuration file in configurations/{lang}.lua
            }
        },
    }
}
vim.api.nvim_set_keymap("n", "<Leader>c", ":lua require('neogen').generate()<CR>", opts)
