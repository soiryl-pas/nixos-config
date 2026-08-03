{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../global/default-small.nix
    ../global/sddm-with-virtual-keyboard.nix
  ];

  networking.hostName = "pas-whispywoods";
  system.stateVersion = "26.05"; # Do not change

  environment.systemPackages = with pkgs; [
    maliit-keyboard
    maliit-framework
  ];

  hardware = {
    enableAllFirmware = true;
    sensor.iio.enable = true;
    graphics.extraPackages = with pkgs; [
      # Necessary such that /run/opengl-driver/lib/dri/iHD_drv_video.so is used for va-api
      # Check with `vainfo`
      intel-media-driver
      intel-vaapi-driver
      libva-vdpau-driver
      libvdpau-va-gl
    ];
  };

  systemd = {
    settings.Manager = {
      DefaultTimeoutStopSec = "15s";
    };
    user.extraConfig = ''
      DefaultTimeoutStopSec=15s
    '';
  };
}
