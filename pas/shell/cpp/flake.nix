{
  description = "A Nix-Flake-based C++-Environment-Shell";

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
          export PS1="\n \e[1;34m== CPP: \w ==\n $\e[m "
          echo "clang++ `${pkgs.clang}/bin/clang++ --version`"
        '';
      };
  };
}
