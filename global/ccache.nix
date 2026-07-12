{
  config,
  nixpkgs,
  pkgs,
  ...
}:
{
  programs.ccache.enable = true;
  nix.settings.extra-sandbox-paths = [ config.programs.ccache.cacheDir ];

  nixpkgs.overlays = [
    (self: super: {
      ccacheWrapper = super.ccacheWrapper.override {
        extraConfig = ''
          export CCACHE_COMPRESS=1
          export CCACHE_DIR="${config.programs.ccache.cacheDir}"
          export CCACHE_UMASK=007
          if [ ! -d "$CCACHE_DIR" ]; then
            echo "=== Directory '$CCACHE_DIR' does not exist ==="
            echo "Create with"
            echo "  sudo mkdir -m0070 '$CCACHE_DIR'"
            echo "  sudo chown root:nixbld '$CCACHe_DIR'"
            exit 1
          fi
          if [ ! -w "$CCACHE_DIR" ]; then
            echo "=== Directory '$CCACHE_DIR' is not accessible for user $(whoami) ==="
          fi
        '';
      };
    })
  ];

  environment.etc."ccache.conf" = {
    text = ''
      umask = 007
      compression = true
      sloppiness = random_seed
    '';
  };
  /*
  systemd.tmpfiles.rules = [
    "L+ /var/cache/ccache/ccache.conf - - - - ${pkgs.writeText "ccache-conf" ''
    ''}"
  ];
  */
}
