{ ... }:

{

  diagnostic.settings = {
    signs.text.__raw = ''
      {
        [vim.diagnostic.severity.ERROR] = " "; -- Nerd Fonts: \u{ea87}
        [vim.diagnostic.severity.WARN] = " ";  -- Nerd Fonts: \u{ea6c}
        [vim.diagnostic.severity.INFO] = " ";  -- Nerd Fonts: \u{ea74}
        [vim.diagnostic.severity.HINT] = "󰌶 ";  -- Nerd Fonts: \u{db80}\u{df36}
      }
    '';
  };

}
