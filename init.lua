vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.errorbells = false
vim.opt.visualbell = true
vim.opt.mouse = 'a'
vim.opt.title = true
vim.opt.background = 'dark'

-- Code Folding Options
vim.opt.foldmethod = 'indent'
vim.opt.foldnestmax = 3
vim.opt.foldenable = false

-- Miscellaneous Options
vim.opt.autoread = true
vim.opt.backspace = { 'indent', 'eol', 'start' }
vim.opt.backupdir = vim.fn.expand('~/.cache/vim')
vim.opt.confirm = true
vim.opt.directory = vim.fn.expand('~/.cache/vim')
vim.opt.formatoptions:append('j')
vim.opt.hidden = true
vim.opt.history = 1000
vim.opt.modeline = false
vim.opt.swapfile = false
vim.opt.nrformats:remove('octal')
vim.opt.shell = vim.o.shell
vim.opt.spell = true
vim.opt.wildignore:append({'.pyc', '.swp', '*.o', '*.out', '*.obj', '.git', '*.rbc', '*.class', '.svn', '*.gem', '*.zip', '*.tar.gz', '*.tar.bz2', '*.rar', '*.tar.xz', '*/vendor/gems/*', '*/vendor/cache/*', '*/vendor/ruby/*', '*/.bundle/*', '*/.sass-cache/*', '*/.bin/*', '*/doc/*', '*/.yardoc/*', '*/.idea/*', '*/node_modules/*', '*/target/*', '*/.stack-work/*', '*/sorbet/rbi/*'})

-- Custom tabs spacing
vim.api.nvim_create_autocmd("FileType", { pattern = "dart", command = "setlocal expandtab tabstop=2 shiftwidth=2" })
vim.api.nvim_create_autocmd("FileType", { pattern = "javascript", command = "setlocal expandtab tabstop=2 shiftwidth=2" })
vim.api.nvim_create_autocmd("FileType", { pattern = "make", command = "setlocal noexpandtab tabstop=4 shiftwidth=4" })
vim.api.nvim_create_autocmd("FileType", { pattern = "python", command = "setlocal tabstop=8 shiftwidth=4 softtabstop=4 foldmethod=syntax" })
vim.api.nvim_create_autocmd("FileType", { pattern = "rust", command = "setlocal expandtab tabstop=4 shiftwidth=4" })

-- Custom Key Mapping 
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Disable arrow keys
vim.api.nvim_set_keymap('n', '<Up>', '<NOP>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Down>', '<NOP>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Left>', '<NOP>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Right>', '<NOP>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('i', '<Up>', '<NOP>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<Down>', '<NOP>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<Left>', '<NOP>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<Right>', '<NOP>', { noremap = true, silent = true })

-- Copy and paste to/from Vim and the clipboard
vim.api.nvim_set_keymap('n', '<C-y>', '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-y>', '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-p>', '"+P', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-p>', '"+P', { noremap = true, silent = true })

-- Access system clipboard
vim.opt.clipboard = 'unnamed'

-- Swapfiles location
vim.opt.backupdir = '/tmp//'
vim.opt.directory = '/tmp//'

-- Lazy.nvim configuration
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- add your plugins here
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"}
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})


-- Setting colorscheme
require("catppuccin").setup()
vim.cmd.colorscheme "catppuccin"

-- Setting telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- Setting tree-siter
local config = require("nvim-treesitter.configs")
config.setup({
    ensure_installed = require'nvim-treesitter.parsers'.available_parsers(),
    sync_install = false,
    highlight = { enable = true },
    indent = { enable = true },  
})


