-- Opciones básicas de Neovim
-- Se aplican con pcall para evitar errores de opciones buffer-local durante startup

-- Opciones globales scope General
vim.g.netrw_winsize = 20
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 1
vim.g.markdown_recommended_style = 0
vim.g.maplocalleader = ' '

-- Opciones de Neovim agrupadas por categoría
local global_options = {
    -- Editor
    ai = true,
    autoindent = true,
    autowrite = true,
    backspace = 'indent,eol,start',
    backup = false,
    breakindent = true,
    clipboard = 'unnamedplus',
    cmdheight = 1,
    completeopt = 'menu,menuone,noselect',
    conceallevel = 0,
    confirm = true,
    cursorline = true,
    expandtab = true,
    fileencoding = 'utf-8',
    grepformat = '%f:%l:%c:%m',
    grepprg = 'rg --vimgrep',
    hlsearch = true,
    ignorecase = true,
    inccommand = 'split',
    laststatus = 3,
    list = true,
    listchars = { trail = '', tab = '', nbsp = '_', extends = '>', precedes = '<' },
    mouse = 'a',
    number = true,
    numberwidth = 4,
    pumblend = 10,
    pumheight = 10,
    relativenumber = true,
    scrolloff = 10,
    sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal',
    shiftround = true,
    shiftwidth = 4,
    showcmd = false,
    showmode = false,
    showtabline = 0,
    sidescrolloff = 8,
    signcolumn = 'yes',
    smartcase = true,
    smartindent = true,
    smarttab = true,
    splitbelow = true,
    splitright = true,
    swapfile = false,
    tabstop = 4,
    termguicolors = true,
    timeoutlen = 300,
    title = true,
    undofile = true,
    undolevels = 10000,
    updatetime = 50,
    wildmenu = true,
    wildmode = 'longest:full,full',
    wrap = false,
    writebackup = false,
}

-- Aplicar opciones globales
for k, v in pairs(global_options) do
    local ok, err = pcall(function()
        vim.opt[k] = v
    end)
    if not ok then
        vim.schedule(function()
            vim.opt[k] = v
        end)
    end
end

-- Opciones que necesitan append o manejo especial (se postergan al VimEnter)
vim.schedule(function()
    local ok, err = pcall(function()
        vim.opt.formatoptions = 'jlnqt'
        vim.opt.path:append({ '**' })
        vim.opt.shortmess:append({ W = true, I = true, c = true })
        vim.opt.fillchars:append({ eob = ' ' })
        vim.opt.whichwrap = '<,>,[,],h,l'
        pcall(function() vim.opt.iskeyword:append({ '-' }) end)

        -- Undercurl support (solo terminal)
        if vim.fn.has('terminal') == 1 then
            vim.cmd([[let &t_Cs = "\e[4:3m"]])
            vim.cmd([[let &t_Ce = "\e[4:0m"]])
        end
    end)
    if not ok then
        vim.notify('options.lua: alguna opción no se pudo aplicar: ' .. tostring(err), vim.log.levels.WARN)
    end
end)

-- filetype detection (se ejecuta inmediatamente, es seguro)
vim.cmd('filetype plugin indent on')
