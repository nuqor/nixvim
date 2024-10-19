{ config, lib, ... }:
let
  cfg = config.nuqor.nvim.lualine;
in
{
  options = {
    nuqor.nvim.lualine.enable = lib.mkEnableOption "Enable Neovim plugin: lualine";
  };

  config = lib.mkIf cfg.enable {
    nuqor.nvim.web-devicons.enable = lib.mkDefault true;

    # TODO: Remove dependency and create a conditional
    # lualine config instead.
    nuqor.nvim.noice.enable = lib.mkDefault true;

    plugins = {
      lualine = {
        enable = true;
        settings.sections.lualine_x = [
          {
            __unkeyed-1.__raw = "require('noice').api.statusline.mode.get";
            cond.__raw = "require('noice').api.statusline.mode.has";
            color = {
              # catppuccin macchiato peach
              fg = "#f5a97f";
            };
          }
          "encoding"
          "fileformat"
          "filetype"
        ];
      };
    };
  };
}
