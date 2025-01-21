{ self, ... }:

{
  globals = {
    mapleader = " ";
    maplocalleader = "\\";
  };

  keymaps = [
    {
      mode = "n";
      key = "<C-b>";
      action = "<Cmd>Neotree filesystem reveal left<CR>";
      options.silent = true;
    }
    {
      mode = "i";
      key = "jk";
      action = "<Esc>";
      options.silent = true;
    }
    {
      mode = "n";
      key = "<leader>w";
      action = "<Cmd>w<CR>";
      options.silent = true;
    }
    # Telescope
    {
      mode = "n";
      key = "<C-p>";
      action.__raw = "require('telescope.builtin').find_files";
    }
    {
      mode = "n";
      key = "<leader>fg";
      action.__raw = "require('telescope.builtin').live_grep";
    }
    {
      mode = "n";
      key = "<leader>fb";
      action.__raw = "require('telescope.builtin').buffers";
    }
    {
      mode = "n";
      key = "<leader>fh";
      action.__raw = "require('telescope.builtin').help_tags";
    }

    # LSP
    {
      mode = "n";
      key = "K";
      action = "vim.lsp.buf.hover()";
    }
  ];
}
