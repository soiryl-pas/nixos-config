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
	mono
	wineWowPackages.full
      ] ++ [
	dotnet-sdk
      ];
      LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath (with pkgs; [
	icu
	freetype
	libGL
	pulseaudio
	xorg.libX11
	xorg.libXrandr
	dotnet-sdk
      ]);
      DOTNET_ROOT = "${dotnet-sdk}/share/dotnet";
    };
  };
}
