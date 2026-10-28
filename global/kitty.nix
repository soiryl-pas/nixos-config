{ lib, ... }:

{
  options = {
    custom.kitty-font-size = lib.mkOption {
      type = lib.types.int;
      default = 12;
      description = "Sets kitty font size.";
    };
  };
}
