{ lib, ... }:

{
  autoCmd = [
    {
      event = "VimEnter";
      command = "call chansend(v:stderr, \"\\033]1337;SetUserVar=remove_padding=MQ==\\007\")";
    }
    (lib.mkIf lib.nixvim.enableExceptInTests {
      event = "VimLeave";
      command = "call chansend(v:stderr, \"\\033]1337;SetUserVar=reset_padding=MQ==\\007\")";
    })
    {
      event = "FileType";
      pattern = "nix";
      command = "setlocal tabstop=2 softtabstop=2 shiftwidth=2";
    }
  ];
}
