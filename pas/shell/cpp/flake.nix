{
  description = "A Nix-Flake-based C++-Environment-Shell";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
  };

  outputs = {
    self,
    nixpkgs,
    ...
  }: let
    system = "x86_64-linux";
  in {
    devShells."${system}".default = let
      pkgs = import nixpkgs {inherit system;};
    in
      pkgs.mkShell {
        packages = with pkgs; [
          clang
        ];

        shellHook = ''
          echo "clang++ `${pkgs.clang}/bin/clang++ --version`"
        '';
      };
  };
}
