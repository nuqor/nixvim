{ config, lib, ... }:
let
  cfg = config.nuqor.nvim.web-devicons;
in
{
  options = {
    nuqor.nvim.web-devicons.enable = lib.mkEnableOption "Enable Neovim plugin: web-devicons";
  };

  config = lib.mkIf cfg.enable {
    plugins = {
      web-devicons.enable = true;
    };
  };
}
