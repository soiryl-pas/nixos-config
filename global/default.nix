{
  pkgs,
  ...
}: {
  imports = [
    ./base.nix
    ./gui.nix
    ./ccache.nix
    ../pas/shell/scripts.nix
  ];

  services = {
    stirling-pdf = {
      enable = true;
      environment = { SERVER_PORT = 8081; };
    };
  };

  programs = {
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      extraCompatPackages = with pkgs; [
        proton-ge-bin
      ];
    };
  };
}
