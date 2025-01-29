{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    neofetch
  ];

  programs = {
    git = {
      enable = true;
      userName = "Someone0123-pas";
      userEmail = "Someone0123@gmx.at";
    };
    htop.enable = true;
  };
}
