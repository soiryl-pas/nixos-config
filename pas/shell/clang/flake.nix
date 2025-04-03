{
  description = "Nix-Flake based C and C++ Environment with Clang";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
  };

  outputs = inputs@{self, nixpkgs, ...}:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
    PS1 = ''\n \[\e[1;34m\]== CLANG: \w ==\n $\[\e[m\] '';
  in {
    devShells."${system}".default = pkgs.mkShell.override {
      stdenv = pkgs.clangStdenv;
    } {
      packages = with pkgs; [
	clang-tools
	cmake
      ];

      shellHook = ''
	export PS1="${PS1}"
	alias clang++="clang++ -Wall -Wextra -std=c++17 -O3 -pedantic-errors -fsanitize=address -fsanitize=undefined -fno-sanitize-recover=all"
	echo -e "\n\e[1;34mCLANG:\e[m `${pkgs.clang}/bin/clang --version`"
      '';
    };
  };
}
