-- https://github.com/mfussenegger/nvim-jdtls
-- Installation Steps:
-- Install Install eclipse.jdt.ls and add that to this file
-- Add JDTLS_PATH to the path to the executable

local jdtls_path = os.getenv("JDTLS_PATH")

local config = {
    cmd = {jdtls_path},
    root_dir = vim.fs.dirname(vim.fs.find({'.gradlew', '.git', 'mvnw'}, { upward = true })[1]),
}
require('jdtls').start_or_attach(config)

-- For remapping the :Ex command to <leader>pd
vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
vim.keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>")
