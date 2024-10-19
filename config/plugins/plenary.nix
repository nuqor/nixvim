{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.nuqor.nvim.plenary;
in
{
  options = {
    nuqor.nvim.plenary.enable = lib.mkEnableOption "Enable Neovim plugin: plenary";
  };

  config = lib.mkIf cfg.enable {
    extraPlugins = with pkgs.vimPlugins; [
      plenary-nvim
    ];
  };
}
