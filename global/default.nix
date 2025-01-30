{ config, lib, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./gui.nix
  ];

###
# Custom Options
  custom = {
    defaultDisplayManager = "greetd";
  };
#
###


  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;

    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
  };

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  networking = {
    hostName = "pas-nixos";
    networkmanager.enable = true;
  };

  time.timeZone = "Europe/Vienna";

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true;
  };

  services = {

    xserver = {
      xkb = {
	layout = "de";
	options = "eurosign:e,caps:escape";
      };
    };

    pipewire = {
      enable = true;
      pulse.enable = true;
    };

  };



  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    configure.customRC = ''
      set shiftwidth=2
    '';
  };
  programs.vim.enable = true;

  users.users.pas = {
    isNormalUser = true;
    extraGroups = [ "wheel" "input" "networkmanager" "vboxsf" ];
  };

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.11"; # Did you read the comment?

}

