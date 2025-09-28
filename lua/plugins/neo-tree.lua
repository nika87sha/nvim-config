return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x', -- Assegura't d'utilitzar la branca estable
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- Opcional, però molt recomanable per les icones
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree', -- Carrega només quan es crida l'ordre
  keys = {
    -- Si vols un mapping específic per a Neo-tree, pots definir-lo aquí
    -- Altrament, utilitzarem Which-key (veure punt 2)
  },
  config = function()
    require('neo-tree').setup({
      close_if_last_window = true, -- Tanca Neovim si Neo-tree és l'única finestra
      popup_border_style = 'rounded',
      enable_git_status = true,
      enable_diagnostics = true,
      default_component_configs = {
        indent = {
          indent_size = 2,
          padding = 1,
        },
        git_status = {
          symbols = {
            -- Canvia els símbols de Git a un estil modern
            unstaged = '', -- Unstaged changes (M)
            staged = '',   -- Staged changes (A/M)
            untracked = '', -- Untracked files (?)
            deleted = '',  -- Deleted files (D)
            ignored = '',  -- Ignored files (I)
          },
        },
      },
      window = {
        position = 'left',
        width = 30,
        mapping_options = {
          -- No remapeja les dreceres per defecte de Neovim
          noremap = true,
          nowait = true,
        },
      },
      filesystem = {
        filtered_items = {
          visible = true, -- Oculta fitxers com .git, node_modules etc.
          hide_dotfiles = false,
          hide_git_ignored = false,
          hide_hidden = false,
        },
        follow_current_file = {
          enabled = true, -- Segueix automàticament el fitxer actual
          leaf_only = false,
        },
        group_empty_dirs = false,
        bind_to_cwd = false,
      },
      buffers = {
        bind_to_cwd = true,
        show_unloaded = true,
      },
      git_status = {
        bind_to_cwd = true,
      },
    })
  end,
}
