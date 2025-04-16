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
    ];
    qtcreator = pkgs.qtcreator.override { inherit (pkgs.qt6) wrapQtAppsHook; };
  in {
    devShells."${system}".default = pkgs.mkShell {
      packages = (with pkgs; [
	libGL
      ]) ++ [ qt qtcreator ];
    };

    apps."${system}".qtcreator = {
      type = "app";
      program = "${pkgs.qtcreator}/bin/qtcreator";
      xdgData = "${pkgs.qtcreator}/share";
    };
  };
}
