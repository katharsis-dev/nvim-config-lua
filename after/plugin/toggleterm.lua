require('toggleterm').setup {
    open_mapping = [[<c-\>]],
    share_filetypes = {},
    shade_terminals = false,
    close_on_exit = true,
    direction = "horizontal",
    size = 15,
    highlights = {
        -- highlights which map to a highlight group name and a table of it's values
        -- NOTE: this is only a subset of values, any group placed here will be set for the terminal window split
        Normal = {
            guifg = "#FFC0CB",
        }
    }
}


-- Custom Lazy Git Terminal
local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true , direction = "float"})

function _lazygit_toggle()
    lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})

-- Floating Terminal
local FTerminal  = require('toggleterm.terminal').Terminal
local fterm = FTerminal:new({hidden = true , direction = "float"})

function _fterm_toggle()
    fterm:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>t", "<cmd>lua _fterm_toggle()<CR>", {noremap = true, silent = true})


function _G.set_terminal_keymaps()
    local opts = {buffer = 0}
    vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
    vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
    vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
    vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
    vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
    vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
