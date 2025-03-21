{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./kitty.nix
  ];

  home.packages = with pkgs; [
    neofetch
  ];

  programs = {
    git = {
      enable = true;
      userName = "Someone0123-pas";
      userEmail = "Jemand0123@protonmail.at";
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
