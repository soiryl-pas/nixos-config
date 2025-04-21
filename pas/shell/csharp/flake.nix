{
  description = "Nix-Flake dotnet runtime";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = inputs@{self, nixpkgs, ...}:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages."${system}";
  in {
    devShells."${system}".default = pkgs.mkShell {
      packages = with pkgs; [
	dotnetCorePackages.dotnet_9.sdk
      ];
    };
  };
}
