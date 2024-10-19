{ config, lib, ... }:
let
  cfg = config.nuqor.nvim.markdown-preview;
in
{
  options = {
    nuqor.nvim.markdown-preview.enable = lib.mkEnableOption "Enable Neovim plugin: markdown-preview";
  };

  config = lib.mkIf cfg.enable {

    plugins = {
      markdown-preview = {
        enable = true;
      };
    };
  };
}
