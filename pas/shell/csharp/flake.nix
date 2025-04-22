{
  description = "Nix-Flake dotnet runtime";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = inputs@{self, nixpkgs, ...}:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages."${system}";
    dotnet-sdk = pkgs.dotnetCorePackages.dotnet_8.sdk;
  in {
    devShells."${system}".default = pkgs.mkShell {
      packages = with pkgs; [
	libGL
	glew
      ] ++ [
	dotnet-sdk
      ];
      DOTNET_ROOT = "${dotnet-sdk}/share/dotnet";
      /*
      NIX_LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath ([
	pkgs.stdenv.cc.cc
      ]);
      NIX_LD = "${pkgs.stdenv.cc.libc_bin}/bin/ld.so";
      */
    };
  };
}
