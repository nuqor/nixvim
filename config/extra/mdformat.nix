{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.nuqor.nvim.mdformat;
in
{
  options = {
    nuqor.nvim.mdformat.enable = lib.mkEnableOption "Enable extra package: mdformat";
  };

  config = lib.mkIf cfg.enable {
    extraPackages = [
      pkgs.mdformat
    ];
  };

}
