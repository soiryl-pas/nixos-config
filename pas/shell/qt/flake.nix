{
  description = "Nix-Flake based Qt6 Development";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = inputs@{self, nixpkgs, ...}:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages."${system}";
    qt = with pkgs.qt6; env "qt-${qtbase.version}" [
      qtwayland
      qtdeclarative
    ];
  in {
    devShells."${system}".default = pkgs.mkShell {
      packages = (with pkgs; [
	libGL
	gdb
	cmake
	bashInteractive
      ]) ++ [ qt ];
    };

/*
    apps."${system}".qtcreator = {
      type = "app";
      program = "${pkgs.qtcreator}/bin/qtcreator";
      xdgData = "${pkgs.qtcreator}/share";
    };
    */
  };
}
