{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.nuqor.nvim.nui;
in
{
  options = {
    nuqor.nvim.nui.enable = lib.mkEnableOption "Enable Neovim plugin: nui";
  };

  config = lib.mkIf cfg.enable {
    extraPlugins = with pkgs.vimPlugins; [
      nui-nvim
    ];
  };
}
