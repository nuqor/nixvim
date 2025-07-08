{ config, lib, ... }:
let
  cfg = config.nuqor.nvim.markdown;
in
{
  options = {
    nuqor.nvim.markdown.enable = lib.mkEnableOption "Enable language: Markdown";
  };

  config = lib.mkIf cfg.enable {

    nuqor.nvim.lsp.enable = lib.mkDefault true;
    nuqor.nvim.lint.enable = lib.mkDefault true;
    nuqor.nvim.conform.enable = lib.mkDefault true;
    nuqor.nvim.markdownlint-cli.enable = lib.mkDefault true;
    nuqor.nvim.mdformat.enable = lib.mkDefault true;

    plugins.lsp = {
      servers = {
        marksman = {
          enable = true;
        };
      };
    };

    plugins.lint.lintersByFt = {
      markdown = [
        "markdownlint"
      ];
    };

    plugins.conform-nvim.settings.formatters_by_ft = {
      markdown = [ "mdformat" ];
    };

    autoCmd = [
      {
        event = "FileType";
        pattern = "markdown";
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
