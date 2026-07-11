{ ... }:
{
  programs.fuzzel.enable = true;
  programs.fuzzel.settings = {
    colors = {
      background = "350c44d0";
      text = "d997dbff";
      message = "d997dbff";
      prompt = "d997dbff";
      placeholder = "f0c9f2ff";
      input = "d997dbff";
      match = "4d41bfff";
      selection = "440c3bd0";
      selection-text = "db97bcff";
      selection-match = "5a41bfff";
      border = "180028ff";
    };

    main = {
      font = "Unifont:size=14";
      width = 45;
    };
  };
}
