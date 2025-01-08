{ config, lib, ... }:
let
  cfg = config.nuqor.nvim.render-markdown;
in
{
  options = {
    nuqor.nvim.render-markdown.enable = lib.mkEnableOption "Enable Neovim plugin: render-markdown";
  };

  config = lib.mkIf cfg.enable {
    plugins = {
      render-markdown.enable = true;
    };
  };
}
