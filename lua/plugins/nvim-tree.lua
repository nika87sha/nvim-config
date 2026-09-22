return {
    'stevearc/oil.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    lazy = false,
    keys = {
        { '<leader>e', '<cmd>Oil<CR>', desc = 'Explorer toggle' },
        { '<leader>fn', '<cmd>Oil --float<CR>', desc = 'Explorer find file (float)' },
    },
    opts = {
        default_file_explorer = false,
        columns = {},  -- SIN columns - solo nombre por defecto

        prompt_save_on_select_new_entry = false,
        skip_confirm_for_simple_edits = true,

        view_options = {
            show_hidden = true,
            is_always_hidden = function(name, _)
                return name == '..' or name == '.git'
            end,
        },

        keymaps = {
            ['<CR>'] = 'actions.select',
            ['-'] = 'actions.parent',
            ['q'] = 'actions.close',
            ['<Esc>'] = 'actions.close',
            ['<C-r>'] = 'actions.refresh',
        },
        use_default_keymaps = true,
    },
    config = function(_, opts)
        require('oil').setup(opts)

        local local_cfg = require('config.local')

        vim.api.nvim_create_user_command('OilRpi', function(cmd_args)
            vim.cmd('Oil oil-ssh://' .. local_cfg.servers.rpi .. '//' .. (cmd_args.args ~= '' and cmd_args.args or ''))
        end, { nargs = '?', complete = 'dir' })

        vim.api.nvim_create_user_command('OilNas', function(cmd_args)
            vim.cmd('Oil oil-ssh://' .. local_cfg.servers.nas .. '//' .. (cmd_args.args ~= '' and cmd_args.args or ''))
        end, { nargs = '?', complete = 'dir' })

        local map = vim.keymap.set
        map('n', '<leader>or', '<cmd>OilRpi<CR>', { desc = 'Oil RPi root' })
        map('n', '<leader>on', '<cmd>OilNas<CR>', { desc = 'Oil NAS root' })
        map('n', '<leader>oe', '<cmd>OilRpi etc/<CR>', { desc = 'Oil RPi /etc' })
        map('n', '<leader>od', '<cmd>OilNas mnt/datos/<CR>', { desc = 'Oil NAS /mnt/datos' })
    end,
}
