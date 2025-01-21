{ config, lib, ... }:
let
  cfg = config.nuqor.nvim.smart-splits;
in
{
  options = {
    nuqor.nvim.smart-splits.enable = lib.mkEnableOption "Enable Neovim plugin: smart-splits";
  };

  config = lib.mkIf cfg.enable {
    plugins.smart-splits = {
      enable = true;
      settings = {
        at_edge = "stop";
      };
    };
    keymaps = [
      {
        mode = [
          "n"
          "t"
        ];
        key = "<A-h>";
        action = "<Cmd>lua require('smart-splits').move_cursor_left()<CR>";
        options.silent = true;
      }
      {
        mode = [
          "n"
          "t"
        ];
        key = "<A-j>";
        action = "<Cmd>lua require('smart-splits').move_cursor_down()<CR>";
        options.silent = true;
      }
      {
        mode = [
          "n"
          "t"
        ];
        key = "<A-k>";
        action = "<Cmd>lua require('smart-splits').move_cursor_up()<CR>";
        options.silent = true;
      }
      {
        mode = [
          "n"
          "t"
        ];
        key = "<A-l>";
        action = "<Cmd>lua require('smart-splits').move_cursor_right()<CR>";
        options.silent = true;
      }
      {
        mode = [
          "n"
          "t"
        ];
        key = "<C-A-h>";
        action = "<Cmd>lua require('smart-splits').resize_left()<CR>";
        options.silent = true;
      }
      {
        mode = [
          "n"
          "t"
        ];
        key = "<C-A-j>";
        action = "<Cmd>lua require('smart-splits').resize_down()<CR>";
        options.silent = true;
      }
      {
        mode = [
          "n"
          "t"
        ];
        key = "<C-A-k>";
        action = "<Cmd>lua require('smart-splits').resize_up()<CR>";
        options.silent = true;
      }
      {
        mode = [
          "n"
          "t"
        ];
        key = "<C-A-l>";
        action = "<Cmd>lua require('smart-splits').resize_right()<CR>";
        options.silent = true;
      }
    ];
  };
}
