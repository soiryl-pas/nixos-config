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

  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-mozc
      kdePackages.fcitx5-qt
      kdePackages.fcitx5-chinese-addons
      fcitx5-tokyonight
    ];
    fcitx5.waylandFrontend = true;
    fcitx5.ignoreUserConfig = true;

    fcitx5.settings.inputMethod = {
      GroupOrder."0" = "EU";
      GroupOrder."1" = "DE";

      "Groups/0" = {
        Name = "DE";
        "Default Layout" = "de-e1";
        DefaultIM = "mozc";
      };
      "Groups/0/Items/0".Name = "keyboard-de-e1";
      "Groups/0/Items/1".Name = "mozc";
      "Groups/0/Items/2".Name = "pinyin";
      
      "Groups/1" = {
        Name = "EU";
        "Default Layout" = "eu";
        DefaultIM = "mozc";
      };
      "Groups/1/Items/0".Name = "keyboard-eu";
      "Groups/1/Items/1".Name = "mozc";
      "Groups/1/Items/2".Name = "pinyin";
      "Groups/1/Items/3".Name = "keyboard-de";
    };
  };
}
