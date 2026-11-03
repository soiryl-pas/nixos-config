{
  description = "5250 Telnet Protocol implementation";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
  };

  outputs = { nixpkgs, ... }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };

    tn5250-version = "0.18.0";
    tn5250 = pkgs.stdenv.mkDerivation {
      pname = "tn5250";
      version = tn5250-version;

      src = pkgs.fetchFromGitHub {
        owner = "tn5250";
        repo = "tn5250";
        rev = "v${tn5250-version}";
        hash = "sha256-CafjJDN4CXOJvHiEcnJJzl3sTFILUBgajYDnT1gE/iw=";
      };

      nativeBuildInputs = with pkgs; [
        autoreconfHook
        ncurses6
        openssl
      ];

      configureFlags = [
        "--with-ssl=${pkgs.openssl.dev}"
      ];
    };
  in {
    packages.${system}.default = tn5250;
    overlays.default = { inherit tn5250; };
  };
}
