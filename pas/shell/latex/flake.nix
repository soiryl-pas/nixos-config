{
  description = "Nix-Flake based Tex Environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
  };

  outputs = inputs@{self, nixpkgs, ...}:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages."${system}";
  in {
    devShells."${system}".default = pkgs.mkShell {
      packages = with pkgs; [
	(texliveBasic.withPackages (ps: with texlivePackages; [
	  beamer ucs babel-german multirow listings ulem times
	))]
      ];
    };
  };
}
