{ config, pkgs, inputs, ... }:

{
  home = {
    username = "pas";
    homeDirectory = "/home/pas";
    stateVersion = "24.11"; # Do not change
  };

  manual.manpages.enable = true;

  i18n.inputMethod.fcitx5.settings.inputMethod = {
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
  };

  imports = [
    ./programs
    ./shell
    ./gui
  ];
}
