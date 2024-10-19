{ config, lib, ... }:
let
  cfg = config.nuqor.nvim.bufferline;
in
{
  options = {
    nuqor.nvim.bufferline.enable = lib.mkEnableOption "Enable Neovim plugin: bufferline";
  };

  config = lib.mkIf cfg.enable {
    nuqor.nvim.web-devicons.enable = lib.mkDefault true;

    plugins = {
      bufferline.enable = true;
    };
  };
}
