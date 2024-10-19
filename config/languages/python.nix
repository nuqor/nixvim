{ config, lib, ... }:
let
  cfg = config.nuqor.nvim.python;
in
{
  options = {
    nuqor.nvim.python.enable = lib.mkEnableOption "Enable language: Python";
  };

  config = lib.mkIf cfg.enable {

    nuqor.nvim.lsp.enable = lib.mkDefault true;

    plugins.lsp = {
      servers = {
        # Use Ruff for linting and code formatting,
        # including organizing imports
        ruff = {
          enable = true;
          onAttach.function = ''
            vim.api.nvim_create_autocmd("BufWritePre", {
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.code_action({
                  context = { only = { "source.organizeImports" } },
                  apply = true,
                })
                vim.wait(100)
                vim.lsp.buf.format {async = false, id = client.id }
              end,
            })
          '';
        };
        # Use Pyright without linting (diagnostics)
        pyright = {
          enable = true;
          # Disable all diagnostics because it is already handled by ruff
          onAttach.function = "client.handlers['textDocument/publishDiagnostics'] = function(...) end";
        };
      };
    };

  };

}
