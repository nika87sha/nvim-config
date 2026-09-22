--~/.config/nvim/lua/plugins/which-key.lua
return {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    opts = {
        preset = 'modern',
        delay = 200,
        icons = {
            breadcrumb = '»',
            separator = '➜',
            group = '',
        },
        win = {
            border = 'rounded',
            padding = { 1, 2 },
        },
    },
    config = function(_, opts)
        local wk = require('which-key')
        local local_cfg = require('config.local')
        wk.setup(opts)

        -- =========================================================
        -- REGISTRO DE GRUPOS (NO MAPPINGS REALES)
        -- =========================================================
        wk.add({
            -- =====================================================
            -- FILES / FIND
            -- =====================================================
            { '<leader>f', group = '󰱼 Find / Files' },
            { '<leader>ff', desc = 'Find files' },
            { '<leader><space>', desc = 'Smart picker' },
            { '<leader>ft', desc = 'Toggle file explorer' },
            { '<leader>fn', desc = 'Reveal file in explorer' },
            { '<leader>fc', desc = 'Find config files' },
            { '<leader>fe', desc = 'Edit nvim config (init.lua)' },
            { '<leader>fE', desc = 'Find nvim config files' },
            { '<leader>fd', desc = 'Find Docker files' },
            { '<leader>fk', desc = 'Find K8s files' },
            { '<leader>fT', desc = 'Find Terraform files' },
            { '<leader>fp', desc = 'Find projects (Telescope)' },

            -- =====================================================
            -- BUFFERS
            -- =====================================================
            { '<leader>b', group = '󰓩 Buffers' },
            { '<leader>bb', desc = 'Switch buffer' },
            { '<leader>bd', desc = 'Delete buffer' },
            { '<leader>bn', desc = 'Next buffer' },

            -- =====================================================
            -- GIT
            -- =====================================================
            { '<leader>g', group = '󰊢 Git' },
            { '<leader>gg', desc = 'LazyGit' },

            -- =====================================================
            -- LSP
            -- =====================================================
            { '<leader>l', group = '󰒋 LSP' },
            { '<leader>lr', desc = 'Rename symbol' },
            { '<leader>la', desc = 'Code action' },
            { '<leader>ld', desc = 'Go to definition' },
            { '<leader>lD', desc = 'Go to declaration' },
            { '<leader>li', desc = 'Go to implementation' },
            { '<leader>lh', desc = 'Hover documentation' },
            { '<leader>ls', desc = 'Signature help' },
            { '<leader>lf', desc = 'Format buffer' },

            -- =====================================================
            -- SNACKS / UI
            -- =====================================================
            { '<leader>s', group = '󰙵 Snacks / UI' },
            { '<leader>sx', desc = 'Scratch buffer' },
            { '<leader>sz', desc = 'Zen mode' },

            -- =====================================================
            -- PLUGINS / SYSTEM
            -- =====================================================
            { '<leader>p', group = '󰏖 Plugins' },
            { '<leader>pp', desc = 'Lazy plugin manager' },

            -- =====================================================
            -- DIAGNOSTICS & REST API
            -- =====================================================
            { '<leader>x', group = '󰒡 Diagnostics / REST' },
            { '<leader>xx', desc = 'Buffer diagnostics (quickfix)' },
            { '<leader>xw', desc = 'Workspace diagnostics' },
            { '<leader>xd', desc = 'Document diagnostics' },
            { '<leader>xq', desc = 'Quickfix list' },
            { '<leader>xl', desc = 'Loclist' },
            { '<leader>xt', desc = 'TODO comments (Telescope)' },

            -- REST API (vim-rest-console)
            { '<leader>xr', desc = 'Run REST query' },
            -- =====================================================
            -- FILE ACTIONS
            -- =====================================================
            { '<leader>w', desc = 'Save file' },
            { '<leader>q', desc = 'Quit' },

            -- =====================================================
            -- TERMINALS
            -- =====================================================
            { '<leader>t', group = '󰆍 Terminals' },
            { '<leader>tb', desc = 'Bash terminal' },
            { '<leader>tp', desc = 'Python REPL' },
            { '<leader>tn', desc = 'Node REPL' },
            { '<leader>tg', desc = 'LazyGit (toggleterm)' },

            -- =====================================================
            -- TASKS / RUN (Overseer)
            -- =====================================================
            { '<leader>r', group = '󰑮 Tasks / Run' },
            { '<leader>rr', desc = 'Run task (Overseer)' },
            { '<leader>rl', desc = 'Task list toggle' },
            { '<leader>ra', desc = 'Task action' },
            { '<leader>rb', desc = 'Build project' },
            { '<leader>rL', desc = 'Load last task' },
            { '<leader>rs', desc = 'Run shell command' },
            { '<leader>rq', desc = 'Quick run (output bottom)' },
            { '<leader>rp', desc = 'Run Python file' },
            { '<leader>rP', desc = 'Run Python with args' },
            { '<leader>rx', desc = 'Execute file (auto-detect)' },

            -- =====================================================
            -- OIL / REMOTE
            -- =====================================================
            { '<leader>o', group = '󰉋 Oil / Remote' },
            { '<leader>or', desc = 'Oil RPi (' .. local_cfg.servers.rpi .. ')' },
            { '<leader>on', desc = 'Oil NAS (' .. local_cfg.servers.nas .. ')' },
            { '<leader>oe', desc = 'Oil RPi /etc' },
            { '<leader>od', desc = 'Oil NAS /mnt/datos' },
            { '<leader>fh', desc = 'Toggle hidden (oil)' },

            -- =====================================================
            -- SEARCH / GREP
            -- =====================================================
            { '<leader>s', group = '󰍉 Search' },
            { '<leader>sg', desc = 'Live grep' },
            { '<leader>sw', desc = 'Grep word under cursor' },
            { '<leader>sf', desc = 'Find files' },
            { '<leader>sr', desc = 'Recent files' },
            { '<leader>sh', desc = 'Help tags' },
            { '<leader>sc', desc = 'Commands' },
            { '<leader>ss', desc = 'LSP symbols' },
            { '<leader>sR', desc = 'LSP references' },
            -- Spectre (search & replace masivo)
            { '<leader>sX', desc = 'Spectre: Search & Replace' },
            { '<leader>sW', desc = 'Spectre: Search word' },
            { '<leader>sP', desc = 'Spectre: Search in file' },

            -- =====================================================
            -- GIT (extendido)
            -- =====================================================
            { '<leader>g', group = '󰊢 Git' },
            { '<leader>gg', desc = 'LazyGit' },
            { '<leader>gd', desc = 'Diffview open' },
            { '<leader>gD', desc = 'Diffview close' },
            { '<leader>gh', desc = 'File history' },
            { '<leader>gH', desc = 'File history (current)' },

            -- =====================================================
            -- HARPOON / PROJECT
            -- =====================================================
            { '<leader>h', group = '󱡀 Harpoon' },
            { '<leader>ha', desc = 'Harpoon add file' },
            { '<leader>hm', desc = 'Harpoon menu' },
            { '<leader>h1', desc = 'Harpoon file 1' },
            { '<leader>h2', desc = 'Harpoon file 2' },
            { '<leader>h3', desc = 'Harpoon file 3' },
            { '<leader>h4', desc = 'Harpoon file 4' },
            { '<leader>hp', desc = 'Harpoon prev' },
            { '<leader>hn', desc = 'Harpoon next' },

            { '<leader>fp', desc = 'Find projects (Telescope)' },

            -- =====================================================
            -- TODO COMMENTS
            -- =====================================================
            { '<leader>xt', desc = 'TODO comments (Telescope)' },
        })
    end,
}