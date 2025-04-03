{
  # Modelled after https://github.com/pret/pmd-sky/blob/main/flake.nix
  # This build only works for x86_64-linux systems, as devkitnix is only available as such.
  # The nixpkgs flake from the local nix registry will be used.

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
    pkgs = import nixpkgs { inherit system; };
  in {
    devShells."${system}".default = pkgs.mkShell {
      inherit name;

      packages = with pkgs; [
	git
	perl
	libpng
	devkitarm
      ];

      DEVKITPRO = devkitarm;
      DEVKITARM = "${devkitarm}/devkitARM";
    };
  };
}
