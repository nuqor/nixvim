{ config, lib, ... }:
let
  cfg = config.nuqor.nvim.nix;
in
{
  options = {
    nuqor.nvim.nix.enable = lib.mkEnableOption "Enable language: Nix";
  };

  config = lib.mkIf cfg.enable {

    nuqor.nvim.lsp.enable = lib.mkDefault true;
    nuqor.nvim.nixfmt-rfc-style.enable = lib.mkDefault true;

    plugins.lsp = {
      servers = {
        nixd = {
          enable = true;
          settings.formatting.command = [ "nixfmt" ];
          onAttach.function = ''
            vim.api.nvim_create_autocmd("BufWritePre", {
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format {async = false, id = client.id }
              end,
            })
          '';
        };
      };
    };

    autoCmd = [
      {
        event = "FileType";
        pattern = "nix";
        command = "setlocal tabstop=2 softtabstop=2 shiftwidth=2";
      }
    ];

  };

}
