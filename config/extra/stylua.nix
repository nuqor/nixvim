{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.nuqor.nvim.stylua;
in

{

  options = {
    nuqor.nvim.stylua.enable = lib.mkEnableOption "Enable extra package: stylua";
  };

  config = lib.mkIf cfg.enable {
    extraPackages = [
      pkgs.stylua
    ];
  };

}
