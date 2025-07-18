{ config, pkgs, inputs, system, ... }:

{
  imports = [
    ./kitty.nix
    ./vscodium.nix
  ];

  home.packages = with pkgs; [
    neofetch
    discord
    dolphin-emu
    melonDS
    mgba
    mesen
    aseprite
    godot_4-mono
    onlyoffice-desktopeditors
    ghidra
    mangohud
    geogebra6
    prismlauncher
    mdbook
    yt-dlp
    clang-manpages
    okteta
    kdePackages.kfind
    kdePackages.kmail
    haruna
    vlc
    cdrtools
    zotero
    lmms
    (callPackage ./musescore.nix {})
    kooha
    foliate
    gimp3
  ] ++ [
    inputs.zen-browser.packages."${system}".default
  ];

  programs = {
    git = {
      enable = true;
      userName = "Someone0123-pas";
      userEmail = "Jemand0123@protonmail.com";
      extraConfig = {
        advice.addIgnoredFile = false;
	pull.rebase = false;
      };
    };
    htop.enable = true;
    firefox = {
      enable = true;
    };
  };

	
  /* When switching to nixos-25.05
  i18n.inputMethod.fcitx5.settings.inputMethod = {
    GroupOrder."0" = "Default";
    "Groups/0" = {
      Name = "Default";
      "Default Layout" = "de-e1";
      DefaultIM = "mozc";
    };
    "Groups/0/Items/0".Name = "keyboard-de-e1";
    "Groups/0/Items/1".Name = "mozc";
    "Groups/0/Items/2".Name = "pinyin";
  };
  */
  

  xdg.desktopEntries.musescore = {
    name = "MuseScore 4";
    comment = "Music Notation Application";
    icon = ./musescore.png;
    exec = "musescore %U";
    mimeType = [
      "application/x-musescore"
      "x-scheme-handler/musescore"
      "application/x-sf2"
      "application/x-sf3"
    ];
    categories = [
      "Audio" "Midi" "Qt"
    ];
  };
}
