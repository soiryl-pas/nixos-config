{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../global/default-small.nix
    ../global/sddm-virtual-keyboard.nix
  ];

  networking.hostName = "pas-whispywoods";
  system.stateVersion = "26.05"; # Do not change

  environment.systemPackages = with pkgs; [
    maliit-keyboard
    kdePackages.qtvirtualkeyboard
  ];

  hardware.sensor.iio.enable = true;
}
