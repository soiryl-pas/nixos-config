{
  # Modelled after https://github.com/pret/pmd-sky/blob/main/flake.nix
  # This build only works for x86_64-linux systems, as devkitnix is only available as such
  # The nixpkgs flake from the local nix registry will be used

  # Some tools require /bin/bash to be present, which is not the case per default on NixOS.
  # This can be resolved with two methods:
  # 1) Symlink with `ln -s /run/current-system/sw/bin/bash /bin/bash`
  # 2) Add to your nixos-configuration:
  # 	* "services.envfrs.enable = true;"
  #	* "environment.shellInit = export ENVFS_RESOLVE_ALWAYS=1"
  # This is unfortunately not possible to capture in this flake, as far as I know

  description = "Nix flake development shell for Kirby and the amazing mirror decompilation";
  inputs = {
    devkitnix.url = "github:knarkzel/devkitnix";
    devkitnix.inputs.nixpkgs.follows = "nixpkgs";
  };
  
  outputs = { self, nixpkgs, devkitnix }:
  let
    name = "katam-shell";
    system = "x86_64-linux";
    devkitarm = devkitnix.packages.${system}.devkitARM;
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    devShells."${system}".default = pkgs.mkShell {
      inherit name;

      packages = with pkgs; [
	git
	perl
	libpng
	devkitarm
	bashInteractive
	mgba
	gcc-arm-embedded
      ];

      DEVKITPRO = "${devkitarm}";
      DEVKITARM = "${devkitarm}/devkitARM";
    };
  };
}
