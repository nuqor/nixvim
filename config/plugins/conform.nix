{ config, lib, ... }:
let
  cfg = config.nuqor.nvim.conform;
in
{
  options = {
    nuqor.nvim.conform.enable = lib.mkEnableOption "Enable Neovim plugin: conform";
  };

  config = lib.mkIf cfg.enable {
    plugins.conform-nvim = {
      enable = true;
      settings = {
        format_on_save = {
          lsp_format = "never";
          timeout_ms = 1000;
        };
      };
    };
  };
}
