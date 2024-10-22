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
  nuqor.nvim.bufferline.enable = true;
  nuqor.nvim.lint.enable = true;
  nuqor.nvim.lualine.enable = true;
  nuqor.nvim.markdown-preview.enable = true;
  nuqor.nvim.neo-tree.enable = true;
  nuqor.nvim.noice.enable = true;
  nuqor.nvim.notify.enable = true;
  nuqor.nvim.nui.enable = true;
  nuqor.nvim.plenary.enable = true;
  nuqor.nvim.treesitter.enable = true;
  nuqor.nvim.toggleterm.enable = true;
  nuqor.nvim.web-devicons.enable = true;

  # Languages
  nuqor.nvim.markdown.enable = true;
  nuqor.nvim.nix.enable = true;
  nuqor.nvim.python.enable = true;

  colorschemes.catppuccin = {
    enable = true;
    settings.flavour = "macchiato";
  };

}
