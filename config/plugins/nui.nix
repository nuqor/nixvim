{
  config,
  lib,
  ...
}:
let
  cfg = config.nuqor.nvim.nui;
in
{
  options = {
    nuqor.nvim.nui.enable = lib.mkEnableOption "Enable Neovim plugin: nui";
  };

  config = lib.mkIf cfg.enable {
    plugins.nui.enable = true;
  };
}
