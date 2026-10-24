let
  inherit (util.kdl) top-level nonunique nonunique-quoted args;
in top-level {
  top-level-nodes = [
    "prefer-no-csd"
  ];

  input = {
    keyboard = [
      "numlock"
    ];
    touchpad = [
      "tap"
      "natural-scroll"
    ];
  };

  layout = {
    gaps = 12;
    default-column-width = {
      proportion = 0.5;
    };
    focus-ring = {
      width = 6;
      active-color = "#a576db";
    };
  };

  window-rule = {
    match = nonunique [
      (args {
        app-id = "^org\.gnome\.seahorse\.Application$";
      })
    ];
  };

  layer-rule = {
    match = nonunique [
      (args {
        namespace = "^notifications$";
      })
    ];
    block-out-from = "screencast";
  };

  spawn-at-startup = "waybar";

  spawn-sh-at-startup = nonunique [
    "wl-clip-persist --clipboard both"
    "wl-paste --type text --watch cliphist store"
    "wl-paste --type image --watch cliphist store"
  ];

  screenshot-path = "~/pictures/niri-screenshots/%Y-%m-%d-%H-%M-%S.png";

  output = nonunique-quoted [
    ({
      quoted = "Hewlett Packard HP ZR2440w CN4217015K";
      transform = "90";
      position = args {
        x = 0;
        y = 0;
      };
    })
    ({
      quoted = "Hewlett Packard HP ZR2440w CN422000CB";
      position = args {
        x = 1200;
        y = 0;
      };
    })
    ({
      quoted = "AU Optronics 0x21ED Unknown";
      position = args {
        x = 3120;
        y = 0;
      };
    })
    ({
      quoted = "PNP(AOC) AG275QXN VOKP7JA000489";
      mode = "2560x1440@165.000";
    })
  ];

  binds = {
    "Mod+T" = args {
      hotkey-overlay-title = "Open a Terminal: kitty";
      kdl.spawn = "kitty";
    };
    "Mod+B" = args {
      hotkey-overlay-title = "Open the clipboard history: cliphist-fuzzel-img";
      kdl.spawn = "cliphist-fuzzel-img";
    };
    "Mod+P" = args {
      hotkey-overlay-title = "Mirror current screen: wl-mirror";
      repeat = false;
      kdl.spawn-sh = "wl-mirror $(niri msg --json focused-output | jq -r .name)";
    };
    "Mod+Shift+Slash" = [
      "show-hotkey-overlay"
    ];
  };
}
