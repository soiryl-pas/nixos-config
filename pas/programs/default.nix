{ config, pkgs, inputs, system, ... }:

{
  imports = [
    ./kitty.nix
    ./vscodium.nix
  ];

  home.packages = with pkgs; [
    neofetch
    onlyoffice-desktopeditors
    discord
    element-desktop
    geogebra6

    dolphin-emu
    melonDS
    mgba
    mesen
    mdbook
    mangohud
    aseprite
    godot_4-mono
    okteta
    ghidra
    rizin
    (conan.overrideAttrs (final: prev: {
      version = "2.19.1";
      src = pkgs.fetchFromGitHub {
        owner = "conan-io";
        repo = "conan";
        tag = final.version;
        hash = "sha256-ojBw8SIZSzKT3j0nQw7ZEPOeGucdnwg4lpc4MG81K/I=";
      };
      disabledTestPaths = prev.disabledTestPaths ++ [ "test/functional/command/test_new.py" ];
    }))

    prismlauncher
    yt-dlp
    clang-manpages
    kdePackages.kfind
    kdePackages.kmail
    haruna
    vlc
    fluidsynth
    (callPackage ./musescore.nix {})
    (callPackage ./lmms.nix {})
    rosegarden

    cdrtools
    kooha
    foliate
    gimp3
    zotero
  ] ++ [
    inputs.zen-browser.packages."${system}".default
  ];

  programs = {
    git = {
      enable = true;
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

  xdg.desktopEntries.lmms = {
    name = "LMMS";
    comment = "Digital audio workstation";
    icon = ./lmms.png;
    exec = "lmms %U";
    mimeType = [
      "audio/midi"
    ];
    categories = [
      "Audio" "Midi"
    ];
  };
}
