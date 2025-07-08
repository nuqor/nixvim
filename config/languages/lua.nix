{ config, lib, ... }:

let
  cfg = config.nuqor.nvim.lua;
in

{

  options = {
    nuqor.nvim.lua.enable = lib.mkEnableOption "Enable language: Lua";
  };

  config = lib.mkIf cfg.enable {

    nuqor.nvim.conform.enable = lib.mkDefault true;
    nuqor.nvim.stylua.enable = lib.mkDefault true;

    plugins.conform-nvim.settings.formatters_by_ft = {
      lua = [ "stylua" ];
    };

    autoCmd = [
      {
        event = "FileType";
        pattern = "lua";
        callback.__raw = ''
          function()
            vim.api.nvim_create_autocmd("BufWritePre", {
              callback = function()
                require("conform").format()
              end,
            })
          end
        '';
      }
    ];

  };

}
