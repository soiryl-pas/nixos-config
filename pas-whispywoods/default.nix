{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../global/default-small.nix
  ];

  networking.hostName = "pas-whispywoods";
  system.stateVersion = "26.05"; # Do not change

  environment.systemPackages = with pkgs; [
    maliit-keyboard
    squeekboard
  ];

  hardware.sensor.iio.enable = true;
  systemd = {
    user.extraConfig = ''
      DefaultTimeoutStopSec=15s
    '';
  };
}
