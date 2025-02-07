{
  description = "A Nix-Flake-based C++-Environment-Shell";

  outputs = {
    self,
    nixpkgs,
    nvf,
    home-manager,
    ...
  }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {inherit system;};
  in {
    devShells."${system}".default = pkgs.mkShell {
      packages = with pkgs; [
        clang
      ];

      shellHook = ''
        export PS1="\n \[\e[1;34m\]== CPP: \w ==\n $\[\e[m\] "
        alias cpp="clang++ -Wall -Wextra -std=c++17 -O3 -pedantic-errors -fsanitize=address -fsanitize=undefined -fno-sanitize-recover=all"
        echo -e "\nclang++ `${pkgs.clang}/bin/clang++ --version`"
      '';
    };
    homeConfigurations."pas" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      modules = [
      ];
    };
  };
}
