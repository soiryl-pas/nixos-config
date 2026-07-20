{
  lib,
  pkgs,
  system,
  inputs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    tree
    kitty
    man-pages
    man-pages-posix
    inputs.nix-alien.packages."${system}".nix-alien
    qemu_full
    wineWow64Packages.waylandFull
    winetricks
    distrobox
    wireguard-tools
    manix
    playerctl
  ];

  nix = {
    settings = {
      experimental-features = ["nix-command" "flakes"];
      auto-optimise-store = true;
      warn-dirty = false;
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
    extraOptions = ''
    '';
  };

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  networking = {
    networkmanager.enable = true;
    wireguard.enable = true;
  };

  time.timeZone = "Europe/Vienna";

  i18n = {
    defaultLocale = "en_GB.UTF-8";
    extraLocaleSettings = lib.attrsets.genAttrs [
      "LC_NUMERIC"
      "LC_TIME"
      "LC_MONETARY"
      "LC_PAPER"
      "LC_NAME"
      "LC_ADDRESS"
      "LC_TELEPHONE"
      "LC_MEASUREMENT"
    ] (locale: "de_AT.UTF-8");
  };

  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true;
  };

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    unifont
    unifont_upper
    font-awesome
  ];
  fonts.enableDefaultPackages = true;

  services = {
    xserver = {
      xkb = {
        layout = "eu";
      };

      desktopManager.runXdgAutostartIfNone = true; # for Fcitx5 to work in WMs
    };

    pipewire = {
      enable = true;
      pulse.enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      jack.enable = true;
      wireplumber.extraConfig = {
        "11-bluetooth-policy" = {
          "wireplumber.settings" = {
            "bluetooth.autoswitch-to-headset-profile" = false;
          };
        };
      };
    };

    stirling-pdf = {
      enable = true;
      environment = { SERVER_PORT = 8081; };
    };

    #blueman.enable = true;
    envfs.enable = true;

    # systemd-resolved
    resolved.enable = true;

    keyd = {
      enable = true;
      keyboards.default = {
        ids = ["*"];
        settings = {
          main = {
            capslock = "esc";
            esc = "capslock";
          };
        };
      };
    };
  };

  # For envfs
  environment.shellInit = ''
    export ENVFS_RESOLVE_ALWAYS=1
  '';

  programs = {
    neovim = {
      enable = true;
      defaultEditor = true;
      configure.customRC = ''
	set shiftwidth=2
	set number
	set expandtab
      '';
      viAlias = true;
    };
    vim.enable = true;

    partition-manager.enable = true;

    appimage = {
      enable = true;
      binfmt = true;
    };

    nix-ld.enable = true;
    git = {
      enable = true;
      prompt.enable = true;
      config = {
        init.defaultBranch = "main";
      };
    };

    gnupg.agent.enable = true;

    nix-index.enable = true;
  };

  virtualisation = {
    docker.enable = true;
    podman = {
      enable = true;
    };
  };

  users.users.pas = {
    isNormalUser = true;
    extraGroups = [ "wheel" "input" "networkmanager" "vboxsf" "docker" "kvm" ];
  };

  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
    graphics = {
      enable = true;
      enable32Bit = true;
    };
  };

  # For PipeWire performance
  security.rtkit.enable = true;

  documentation.dev.enable = true;
}
