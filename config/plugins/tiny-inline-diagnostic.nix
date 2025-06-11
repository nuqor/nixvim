{ config, lib, ... }:
let
  cfg = config.nuqor.nvim.tiny-inline-diagnostic;
in
{
  options = {
    nuqor.nvim.tiny-inline-diagnostic.enable = lib.mkEnableOption "Enable Neovim plugin: tiny-inline-diagnostic";
  };

  config = lib.mkIf cfg.enable {
    plugins = {
      tiny-inline-diagnostic.enable = true;
    };
  };
}
