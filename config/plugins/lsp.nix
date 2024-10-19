{ config, lib, ... }:
let
  cfg = config.nuqor.nvim.lsp;
in
{
  options = {
    nuqor.nvim.lsp.enable = lib.mkEnableOption "Enable Neovim plugin: lsp";
  };

  config = lib.mkIf cfg.enable {
    plugins = {
      lsp.enable = true;
    };
  };
}
