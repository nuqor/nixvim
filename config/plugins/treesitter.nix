{ config, lib, ... }:
let
  cfg = config.nuqor.nvim.treesitter;
in
{
  options = {
    nuqor.nvim.treesitter.enable = lib.mkEnableOption "Enable Neovim plugin: treesitter";
  };

  config = lib.mkIf cfg.enable {
    plugins.treesitter = {
      enable = true;
      settings = {
        highlight.enable = true;
        indent.enable = true;
      };
    };
  };
}
