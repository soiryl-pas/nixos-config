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
    (musescore.overrideAttrs (finalAttrs: prevAttrs: {
      version = "4.5";
      src = pkgs.fetchFromGitHub {
	inherit (prevAttrs.src) owner repo;
	rev = "v${finalAttrs.version}";
	sha256 = "sha256-7sD9AAuuDT0+VycKLL19DYdmuSLmt0Uy2NmoKQ1+c3A=";
      };
      postInstall = "";
    }))
    lmms
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
}
