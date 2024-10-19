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
      mode = [
        "n"
        "t"
      ];
      key = "<C-j>";
      action = "<Cmd>ToggleTerm<CR>";
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
    {
      mode = [
        "n"
        "t"
      ];
      key = "<A-h>";
      action = "<Cmd>wincmd h<CR>";
      options.silent = true;
    }
    {
      mode = [
        "n"
        "t"
      ];
      key = "<A-j>";
      action = "<Cmd>wincmd j<CR>";
      options.silent = true;
    }
    {
      mode = [
        "n"
        "t"
      ];
      key = "<A-k>";
      action = "<Cmd>wincmd k<CR>";
      options.silent = true;
    }
    {
      mode = [
        "n"
        "t"
      ];
      key = "<A-l>";
      action = "<Cmd>wincmd l<CR>";
      options.silent = true;
    }

  ];
}
