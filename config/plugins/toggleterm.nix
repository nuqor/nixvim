{ config, lib, ... }:
let
  cfg = config.nuqor.nvim.toggleterm;
in
{
  options = {
    nuqor.nvim.toggleterm.enable = lib.mkEnableOption "Enable Neovim plugin: toggleterm";
  };

  config = lib.mkIf cfg.enable {
    plugins = {
      toggleterm.enable = true;
    };
  };
}
