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
  in {
    devShells."${system}".default = pkgs.mkShell {
      packages = (with pkgs; [
	qtcreator
	libGL
      ]) ++ [ qt ];
      
      shellHook = ''
	#export LD_LIBRARY_PATH="/run/opengl-driver/lib:/run/opengl-driver-32/lib"
      '';
    };

    apps."${system}".qtcreator = {
      type = "app";
      program = "${pkgs.qtcreator}/bin/qtcreator";
    };
  };
}
