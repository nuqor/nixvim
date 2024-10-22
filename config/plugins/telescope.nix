{ config, lib, ... }:
let
  cfg = config.nuqor.nvim.telescope;
in
{
  options = {
    nuqor.nvim.telescope.enable = lib.mkEnableOption "Enable Neovim plugin: telescope";
  };

  config = lib.mkIf cfg.enable {
    nuqor.nvim.web-devicons.enable = lib.mkDefault true;
    nuqor.nvim.plenary.enable = lib.mkDefault true;
    nuqor.nvim.ripgrep.enable = lib.mkDefault true;
    nuqor.nvim.treesitter.enable = lib.mkDefault true;
    nuqor.nvim.fd.enable = lib.mkDefault true;

    plugins = {
      telescope = {
        enable = true;
        extensions = {
          fzf-native.enable = true;
        };
      };
    };
  };
}
