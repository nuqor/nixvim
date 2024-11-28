{
  description = "A nixvim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixvim.url = "github:nix-community/nixvim";
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
        "aarch64-darwin"
      ];
      nixvimModule = eachSystem (system: {
        pkgs = nixpkgs.legacyPackages.${system};
        extraSpecialArgs = { };
        module = import ./config;
      });
    in
    {
      packages = eachSystem (system: {
        default = nixvim.legacyPackages.${system}.makeNixvimWithModule nixvimModule.${system};
      });

      checks = eachSystem (system: {
        default = nixvim.lib.${system}.check.mkTestDerivationFromNixvimModule nixvimModule.${system};
      });

      formatter = eachSystem (system: nixpkgs.legacyPackages.${system}.nixfmt-rfc-style);
    };
}
