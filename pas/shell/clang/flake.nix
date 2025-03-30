{
  description = "Nix-Flake based C++-Environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = inputs@{self, nixpkgs, ...}:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
  in {
    devShells."${system}".default = pkgs.mkShellNoCC {
      packages = with pkgs; [
	clang
      ];

      shellHook = ''
	export PS1="\n \[\e[1;34m\]== CLANG: \w ==\n $\[\e[m\] "
	alias cpp="clang++ -Wall -Wextra -std=c++17 -O3 -pedantic-errors -fsanitize=address -fsanitize=undefined -fno-sanitize-recover=all"
	echo -e "\n\e[1;34mCLANG:\e[m `${pkgs.clang}/bin/clang --version`"
      '';
    };
  };
}
