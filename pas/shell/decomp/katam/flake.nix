{
  # Modelled after https://github.com/pret/pmd-sky/blob/main/flake.nix
  # This build was tested on an x86_64 system. If you use a different one, make sure to change that attribute
  # DevkitNix is system agnostic, so it could work for other systems as well, but this hasn't been tested yet for this repository

  # Some tools require /bin/bash to be present, which is not the case per default on NixOS.
  # This can be resolved with two methods:
  # 1) Symlink with `ln -s /run/current-system/sw/bin/bash /bin/bash`
  # 2) Add to your nixos-configuration:
  # 	* "services.envfrs.enable = true;"
  #	* "environment.shellInit = export ENVFS_RESOLVE_ALWAYS=1"

  description = "Nix flake development shell for Kirby and the amazing mirror decompilation";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nixpkgs-old.url = "github:NixOS/nixpkgs/nixos-24.11";
    devkitNix.url = "github:bandithedoge/devkitNix";
  };
  
  outputs = { self, nixpkgs, nixpkgs-old, devkitNix }:
  let
    name = "katam-shell";
    system = "x86_64-linux";
    pkgs-old = nixpkgs-old.legacyPackages."${system}";
    pkgs = import nixpkgs {
      inherit system;
      overlays = [devkitNix.overlays.default];
    };
    devkitarm = pkgs.devkitNix.devkitARM;
    DEVKITPRO = "${devkitarm}/opt/devkitpro";
    DEVKITARM = "${DEVKITPRO}/devkitARM";
  in {
    devShells."${system}".default = pkgs.mkShell {
      inherit name DEVKITPRO DEVKITARM;

      packages = with pkgs; [
	devkitarm
	git
	bc
	perl
	libpng
	bashInteractive
	mgba
	clang-tools
      ] ++ [
	pkgs-old.gcc-arm-embedded-10 # This gdb version just works with VSCode C-Cpp-Extension breakpoints, so we'll keep it
      ];
    };
  };
}
