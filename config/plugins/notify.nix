{ config, lib, ... }:
let
  cfg = config.nuqor.nvim.notify;
in
{
  options = {
    nuqor.nvim.notify.enable = lib.mkEnableOption "Enable Neovim plugin: notify";
  };

  config = lib.mkIf cfg.enable {
    plugins = {
      notify.enable = true;
    };
  };
}
