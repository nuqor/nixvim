{
  description = "Color scheme override";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixpkgs-unstable";
    nixvim = {
      url = "path:../..";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      nixvim,
      ...
    }:
    let
      eachSystem = nixpkgs.lib.attrsets.genAttrs [
        "x86_64-linux"
        "x86_64-darwin"
        "aarch64-linux"
        "aarch64-darwin"
      ];
    in
    {
      packages = eachSystem (system: {
        default = nixvim.packages.${system}.override {
          colorschemes.catppuccin = {
            enable = true;
            settings.flavour = nixpkgs.lib.mkForce "latte";
          };
        };
      });
    };
}
