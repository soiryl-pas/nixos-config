{
  description = "Nix flake development shell for Kirby and the amazing mirror decompilation";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
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
        libGL
        vulkan-loader
      ] ++ [
	pkgs-old.gcc-arm-embedded-10 # This gdb version just works with VSCode C-Cpp-Extension breakpoints, so we'll keep it
      ];

      LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath (with pkgs; [
        freetype fontconfig wayland libxkbcommon vulkan-loader
      ]);
    };
  };
}
