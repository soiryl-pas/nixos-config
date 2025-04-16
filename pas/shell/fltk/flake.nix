{
  description = "Nix-flake based C++ FLTK Projects with stdenv";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = inputs@{nixpkgs, ...}:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages."${system}";
    customfltk = (pkgs.fltk.overrideAttrs (finalAttrs: previousAttrs: {
      version = "1.4.2";
      rev = "release-${finalAttrs.version}";
      sha256 = "sha256-sh0bu/bdb4WBM3m6D0t4UaZuL08zuqITvzV+ej7B79s=";
      src = pkgs.fetchFromGitHub {
	inherit (previousAttrs.src) owner repo;
	inherit (finalAttrs) rev sha256;
      };
    })).override { withDocs = false; };
  in {
    devShells."${system}".default = pkgs.mkShell {
      packages = with pkgs; [
	cmake
	pkg-config
	libGL
	libxkbcommon
	wayland
      ] ++ [
	customfltk
      ];
    };
  };
}
