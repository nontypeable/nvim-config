-- line numbering
vim.opt.number = true -- absolute numbering
vim.opt.relativenumber = true -- relative numbering

-- tabs & indentation
vim.opt.tabstop = 4 -- 4 spaces for tabs
vim.opt.softtabstop = 4 -- 4 spaces to display tabs
vim.opt.shiftwidth = 4 -- 4 spaces for indentation
vim.opt.expandtab = true -- replacing tabs with spaces
vim.opt.autoindent = true -- copy indent the current line when starting a new line

-- search settings
vim.opt.ignorecase = true -- ignore case when searching
vim.opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- visual design
vim.opt.termguicolors = true -- terminal color support
vim.opt.background = "dark" -- colorschemes that can be light or dark will be made dark
vim.opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- clipboard
vim.opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- pop-up windows
vim.opt.pumheight = 3 -- maximum 3 values in the pop-up window

-- split windows
vim.opt.splitright = true -- split vertical window to the right
vim.opt.splitbelow = true -- split horizontal window to the bottom

-- editor control
vim.opt.mouse = "a" -- mouse is enabled
vim.opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- turn off swapfile
vim.opt.swapfile = false

-- 10 lines indent when scrolling the page
vim.opt.scrolloff = 10

-- file encoding in utf-8
vim.opt.encoding = "utf-8"

-- file change history
vim.opt.undofile = true

-- long line break disabled
vim.opt.wrap = false
