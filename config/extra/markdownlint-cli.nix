{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.nuqor.nvim.markdownlint-cli;
in
{
  options = {
    nuqor.nvim.markdownlint-cli.enable = lib.mkEnableOption "Enable extra package: markdownlint-cli";
  };

  config = lib.mkIf cfg.enable {
    extraPackages = [
      pkgs.markdownlint-cli
    ];
  };

}
