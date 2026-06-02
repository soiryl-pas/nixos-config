{
  pkgs,
  inputs,
  system,
  ...
}: {
  imports = [
    ./kitty.nix
    ./nixvim
  ];

  home.packages = with pkgs; [
    nixfmt
    nixd
    hyfetch
    onlyoffice-desktopeditors
    discord
    element-desktop
    geogebra6
    xournalpp

    mgba
    mdbook
    aseprite
    okteta
    ghidra

    yt-dlp
    clang-manpages
    kdePackages.kfind
    kdePackages.kmail
    vlc

    kooha
    foliate
    zotero
  ] ++ [
    inputs.zen-browser.packages."${system}".default
  ];

  programs = {
    git = {
      enable = true;
      settings = {
        advice.addIgnoredFile = false;
	pull.rebase = false;
      };
    };

    htop.enable = true;
  };
}
