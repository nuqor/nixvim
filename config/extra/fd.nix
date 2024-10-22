{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.nuqor.nvim.fd;
in
{
  options = {
    nuqor.nvim.fd.enable = lib.mkEnableOption "Enable extra package: fd";
  };

  config = lib.mkIf cfg.enable {
    extraPackages = [
      pkgs.fd
    ];
  };

}
