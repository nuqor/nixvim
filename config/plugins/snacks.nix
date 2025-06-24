{ config, lib, ... }:

let
  cfg = config.nuqor.nvim.snacks;
in

{

  options = {
    nuqor.nvim.snacks.enable = lib.mkEnableOption "Enable Neovim plugin: snacks";
  };

  config = lib.mkIf cfg.enable {
    plugins.snacks = {
      enable = true;
      settings.statuscolumn.enable = true;
    };
  };

}
