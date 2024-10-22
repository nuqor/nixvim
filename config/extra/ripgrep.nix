{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.nuqor.nvim.ripgrep;
in
{
  options = {
    nuqor.nvim.ripgrep.enable = lib.mkEnableOption "Enable extra package: ripgrep";
  };

  config = lib.mkIf cfg.enable {
    extraPackages = [
      pkgs.ripgrep
    ];
  };

}
