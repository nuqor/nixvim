{ config, lib, ... }:
let
  cfg = config.nuqor.nvim.lint;
in
{
  options = {
    nuqor.nvim.lint.enable = lib.mkEnableOption "Enable Neovim plugin: lint";
  };

  config = lib.mkIf cfg.enable {
    plugins.lint = {
      enable = true;
      autoCmd = {
        callback = {
          __raw = ''
            function()
              require('lint').try_lint()
            end
          '';
        };
        event = [
          "InsertLeave"
          "BufEnter"
          "BufWritePost"
        ];
      };
    };
  };
}
