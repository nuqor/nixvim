{ config, lib, ... }:
let
  cfg = config.nuqor.nvim.hydra;
in
{
  options = {
    nuqor.nvim.hydra.enable = lib.mkEnableOption "Enable Neovim plugin: hydra";
  };

  config = lib.mkIf cfg.enable {
    plugins = {
      hydra.enable = true;
    };
  };
}
