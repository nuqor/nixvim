{ config, lib, ... }:

let
  cfg = config.nuqor.nvim.python;
in

{

  options = {
    nuqor.nvim.python = {
      enable = lib.mkEnableOption "Enable language: Python";
      formatOnSave = lib.mkOption {
        type = lib.types.bool;
        default = false;
      };
      formatKeymap = lib.mkOption {
        type = lib.types.str;
        default = "<leader>cf";
      };
    };
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
            local function format()
              vim.lsp.buf.code_action({
                context = { only = { "source.organizeImports" } },
                apply = true,
              })
              vim.wait(100)
              vim.lsp.buf.format {async = false, id = client.id }
            end
            vim.api.nvim_create_autocmd("BufWritePre", {
              buffer = bufnr,
              callback = function()
                local format_on_save = vim.b[bufnr].format_on_save
                if format_on_save == nil then
                  format_on_save = ${lib.boolToString cfg.formatOnSave}
                end
                if format_on_save then
                  format()
                end
              end,
            })
            vim.keymap.set("n", "${cfg.formatKeymap}", format, { noremap = true, buffer = bufnr })
          '';
        };

        # Use Pyright without linting (diagnostics)
        pyright = {
          enable = true;
          onAttach.function = ''
            -- Disable all diagnostics because it is already handled by ruff
            client.handlers['textDocument/publishDiagnostics'] = function(...) end
            vim.lsp.completion.enable(true, client.id, bufnr, {
              autotrigger = true,
              convert = function(item)
                return { abbr = item.label:gsub("%b()", "") }
              end,
            })
          '';
        };

      };
    };

  };

}
