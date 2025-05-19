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
    desmume
    mgba
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
