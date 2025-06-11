{ config, lib, ... }:

let
  cfg = config.nuqor.nvim.vim-slime;
in

{

  options = {
    nuqor.nvim.vim-slime.enable = lib.mkEnableOption "Enable Neovim plugin: vim-slime";
  };

  config = lib.mkIf cfg.enable {

    nuqor.nvim.wezterm.enable = lib.mkDefault true;

    plugins.vim-slime = {
      enable = true;
      settings = {
        target = "wezterm";
        bracketed_paste = 1;
        cell_delimiter = "^#\\s\\=%%";
        cells_highlight_from = "Comment";
      };
    };

  };

}
