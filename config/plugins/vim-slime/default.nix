{ config, lib, ... }:

let
  cfg = config.nuqor.nvim.vim-slime;
in

{

  options = {
    nuqor.nvim.vim-slime = {
      enable = lib.mkEnableOption "Enable Neovim plugin: vim-slime";
      figureRelativeWidth = lib.mkOption {
        type = lib.types.ints.u8;
        default = 80;
        description = "Relative width in percent (%) for matplotlib figures";
      };
    };
  };

  config = lib.mkIf cfg.enable {

    nuqor.nvim.wezterm.enable = lib.mkDefault true;

    plugins.vim-slime = {
      enable = true;
      settings = {
        target = "wezterm";
        bracketed_paste = 1;
        cell_delimiter = "^#\\s\\=%%";
        cells_highlight_from = "Comment";
      };
    };

    userCommands =
      let
        ipythonCommand = builtins.concatStringsSep " " [
          ''PYTHONPATH="${./mpl_backends}:''${PYTHONPATH}"''
          ''MPLBACKEND="module://wezterm"''
          ''MPLBACKEND_WEZTERM_FIGURE_RELATIVE_WIDTH=${builtins.toString cfg.figureRelativeWidth}''
          ''ipython --no-banner''
        ];
        startRepl = direction: ''
          function()
            local mux = require('smart-splits.mux').get()

            -- Split terminal, get wezterms pane id and return to original pane
            mux.split_pane("${direction}")
            local terminal_pane_id = mux.current_pane_id()
            vim.fn.system { 'wezterm', 'cli', 'activate-pane-direction', 'Prev' }

            -- Configure slime with wezterms pane id
            local slime_config = vim.b[0].slime_config or {}
            slime_config.pane_id = terminal_pane_id
            vim.b[0].slime_config = slime_config

            -- Send command to start ipyhton and clear terminal
            vim.fn.system { 'wezterm', 'cli', 'send-text', '--pane-id', tostring(terminal_pane_id), '--no-paste', '${ipythonCommand}\r'}
            vim.fn.system { 'wezterm', 'cli', 'send-text', '--pane-id', tostring(terminal_pane_id), '--no-paste', '\x0c'}
          end
        '';
      in
      {
        ReplStartRight.command.__raw = startRepl "right";
        ReplStartLeft.command.__raw = startRepl "left";
      };

  };

}
