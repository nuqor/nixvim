{ config, lib, ... }:

let
  cfg = config.nuqor.nvim.gitsigns;
in

{

  options = {
    nuqor.nvim.gitsigns.enable = lib.mkEnableOption "Enable Neovim plugin: gitsigns";
  };

  config = lib.mkIf cfg.enable {
    plugins = {
      gitsigns.enable = true;
    };
  };

}
