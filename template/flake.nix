{
  description = "A flake for building an example package.";
  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs?ref=nixos-22.11;
  };

  outputs = {
    self,
    nixpkgs,
  }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {localSystem = {inherit system;};};
  in {
    packages.${system} = {
      default = pkgs.callPackage ./default.nix {};
    };
  };
}
