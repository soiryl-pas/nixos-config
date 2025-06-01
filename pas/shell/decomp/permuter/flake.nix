{
  description = "Nix flake development shell for a decomp permuter: https://github.com/simonlindholm/decomp-permuter";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixpkgs-new.url = "github:NixOS/nixpkgs/nixos-25.05";
    devkitNix.url = "github:bandithedoge/devkitNix";
  };

  outputs = { self, nixpkgs, nixpkgs-new, devkitNix }:
  let
    name = "decomp-permuter-shell";
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages."${system}";
    pkgs-new = import nixpkgs-new {
      inherit system;
      overlays = [devkitNix.overlays.default];
    };
    devkitarm = pkgs-new.devkitNix.devkitARM;
    DEVKITPRO = "${devkitarm}/opt/devkitpro";
    DEVKITARM = "${DEVKITPRO}/devkitARM";
  in {
    devShells."${system}".default = pkgs.mkShell {
      inherit name DEVKITPRO DEVKITARM;

      packages = with pkgs-new; [
	devkitarm
	git
	bashInteractive
	gcc-arm-embedded
	libpng
	pkg-config
      ] ++ [
	(pkgs.python3.withPackages (pypkgs: with pypkgs; [
	  pycparser pynacl toml levenshtein
	]))
      ];
    };
  };
}
