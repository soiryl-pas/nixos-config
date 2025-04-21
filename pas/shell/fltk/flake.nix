{
  description = "Nix-flake based C++ FLTK Projects with stdenv";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = inputs@{self, nixpkgs, ...}:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages."${system}";
    fltk = self.packages."${system}".fltk;
    /*
    nixpkgs-repo = pkgs.fetchFromGitHub {
      owner = "nixos";
      repo = "nixpkgs";
      inherit (inputs.nixpkgs) rev;
      sha256 = inputs.nixpkgs.narHash;
    };
    customfltk-lambda = import "${nixpkgs-repo}/pkgs/development/libraries/fltk/common.nix" rec {
      version = "1.4.2";
      rev = "release-${version}";
      sha256 = "sha256-sh0bu/bdb4WBM3m6D0t4UaZuL08zuqITvzV+ej7B79s=";
    };
    customfltk = pkgs.callPackage customfltk-lambda {
      inherit (pkgs) ApplicationServices Carbon Cocoa OpenGL;
    };
    */
  in {
    packages."${system}".fltk = (pkgs.fltk.overrideAttrs (finalAttrs: previousAttrs: {
      version = "1.4.2";  
      src = pkgs.fetchFromGitHub {
	inherit (previousAttrs.src) owner repo;
	rev = "release-${finalAttrs.version}";
	sha256 = "sha256-sh0bu/bdb4WBM3m6D0t4UaZuL08zuqITvzV+ej7B79s=";
      };
      cmakeFlags = previousAttrs.cmakeFlags ++ [
	"-DFLTK_OPTION_STD=ON"
	#"-DOPTION_BUILD_HTML_DOCUMENTATION=ON"
	#"-DOPTION_INSTALL_HTML_DOCUMENTATION=ON"
      ];
      propagatedBuildInputs = previousAttrs.propagatedBuildInputs ++ [
	pkgs.libxkbcommon
	pkgs.wayland
	pkgs.wayland-protocols
	pkgs.wayland-scanner
      ];
    })).override {
      withDocs = false;
      withPango = true;
    };

    devShells."${system}".default = pkgs.mkShell {
      packages = with pkgs; [
	cmake
	pkg-config
	libGL
	libGLU
	glew
	gtk3
	valgrind-light
      ] ++ [
	fltk
      ];

      FLTKPATH = "${fltk}";
    };
  };
}
