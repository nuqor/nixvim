{ config, lib, ... }:
let
  cfg = config.nuqor.nvim.commentary;
in
{
  options = {
    nuqor.nvim.commentary.enable = lib.mkEnableOption "Enable Neovim plugin: commentary";
  };

  config = lib.mkIf cfg.enable {
    plugins = {
      commentary.enable = true;
    };
  };
}
