{ config, pkgs, ... }:

{
  imports = [
    ./nvim.nix
  ];

  home.packages = with pkgs; [
    neofetch
  ];

  programs = {
    git = {
      enable = true;
      userName = "Someone0123-pas";
      userEmail = "Someone0123@gmx.at";
      extraConfig = {
	advice.addIgnoredFile = false;
      };
    };
    htop.enable = true;
    firefox = {
      enable = true;
    };
  };
}
