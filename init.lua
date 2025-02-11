-- General
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.cmd('filetype indent on')
vim.opt.shiftround = true
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.tabstop = 4

-- Search Options
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.smartcase = true

-- Performance Options
vim.opt.complete:remove('i')
vim.opt.lazyredraw = true
vim.opt.ttyfast = true

-- Text Rendering Options
vim.opt.display:append('lastline')
vim.opt.encoding = 'utf-8'
vim.opt.linebreak = true
vim.opt.scrolloff = 1
vim.opt.sidescrolloff = 5
vim.cmd('syntax enable')
vim.opt.wrap = true

-- User Interface Options
vim.opt.laststatus = 2
vim.opt.ruler = true
vim.opt.wildmenu = true
vim.opt.termguicolors = true
vim.opt.tabpagemax = 50
--vim.cmd('colorscheme wombat256mod')
vim.opt.cursorline = true
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


