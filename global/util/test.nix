{
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

  spawn-at-startup = "waybar";

  binds = {
    "Mod+T" = "foo";
  };
}
