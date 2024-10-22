{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.nuqor.nvim.nixfmt-rfc-style;
in
{
  options = {
    nuqor.nvim.nixfmt-rfc-style.enable = lib.mkEnableOption "Enable extra package: nixfmt-rfc-style";
  };

  config = lib.mkIf cfg.enable {
    extraPackages = [
      pkgs.nixfmt-rfc-style
    ];
  };

}
