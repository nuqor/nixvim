{ config, lib, ... }:

let
  cfg = config.nuqor.nvim.wezterm;
in

{

  options = {
    nuqor.nvim.wezterm.enable = lib.mkEnableOption "Enable Neovim plugin: wezterm";
  };

  config = lib.mkIf cfg.enable {
    plugins = {
      wezterm.enable = true;
    };
  };

}
