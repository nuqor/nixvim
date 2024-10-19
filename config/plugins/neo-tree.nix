{ config, lib, ... }:
let
  cfg = config.nuqor.nvim.neo-tree;
in
{
  options = {
    nuqor.nvim.neo-tree.enable = lib.mkEnableOption "Enable Neovim plugin: neo-tree";
  };

  config = lib.mkIf cfg.enable {
    nuqor.nvim.plenary.enable = lib.mkDefault true;
    nuqor.nvim.web-devicons.enable = lib.mkDefault true;
    plugins = {
      neo-tree.enable = true;
    };
  };
}
