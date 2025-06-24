{ lib, ... }:

{

  lsp.keymaps = [
    {
      key = "gD";
      lspBufAction = "references";
    }
    {
      key = "gt";
      lspBufAction = "type_definition";
    }
    {
      key = "gi";
      lspBufAction = "implementation";
    }
    {
      key = "K";
      lspBufAction = "hover";
    }
    {
      action = lib.nixvim.mkRaw "require('telescope.builtin').lsp_definitions";
      key = "gd";
    }
  ];

}
