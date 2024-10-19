{ config, lib, ... }:
let
  cfg = config.nuqor.nvim.noice;
in
{
  options = {
    nuqor.nvim.noice.enable = lib.mkEnableOption "Enable Neovim plugin: noice";
  };

  config = lib.mkIf cfg.enable {
    nuqor.nvim.notify.enable = lib.mkDefault true;
    nuqor.nvim.nui.enable = lib.mkDefault true;
    plugins = {
      noice.enable = true;
    };
  };
}
