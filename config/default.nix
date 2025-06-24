{ pkgs, ... }:

{
  imports = [
    ./autocmd.nix
    ./keymaps.nix
    ./options.nix
    ./plugins
    ./languages
    ./extra
  ];

  # Plugins
  # nuqor.nvim.bufferline.enable = true;
  nuqor.nvim.commentary.enable = true;
  nuqor.nvim.lint.enable = true;
  nuqor.nvim.lualine.enable = true;
  nuqor.nvim.markdown-preview.enable = true;
  nuqor.nvim.neo-tree.enable = true;
  nuqor.nvim.noice.enable = true;
  nuqor.nvim.notify.enable = true;
  nuqor.nvim.nui.enable = true;
  nuqor.nvim.plenary.enable = true;
  nuqor.nvim.render-markdown.enable = true;
  nuqor.nvim.smart-splits.enable = true;
  nuqor.nvim.telescope.enable = true;
  nuqor.nvim.tiny-inline-diagnostic.enable = true;
  nuqor.nvim.toggleterm.enable = true;
  nuqor.nvim.treesitter.enable = true;
  nuqor.nvim.vim-slime.enable = true;
  nuqor.nvim.web-devicons.enable = true;
  nuqor.nvim.wezterm.enable = true;
  nuqor.nvim.gitsigns.enable = true;

  # Languages
  nuqor.nvim.markdown.enable = true;
  nuqor.nvim.nix.enable = true;
  nuqor.nvim.python = {
    enable = true;
    formatOnSave = true;
  };

  colorschemes.catppuccin = {
    enable = true;
    settings.flavour = "macchiato";
  };

  editorconfig = {
    enable = true;
    properties = {
      format_on_save = ''
        function(bufnr, val)
          assert(
            val == 'true' or val == 'false',
            'format_on_save must be either "true" or "false"'
          )
          vim.b[bufnr].format_on_save = val=='true' and true or false
        end
      '';
    };
  };
}
