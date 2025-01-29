{ config, pkgs, ... }:

{
  # Configure automatically generated files
  # To set configuration: Run xdg-user-dirs-update
# xdg.configFile."user-dirs.dirs".text = ''
#   XDG_DESKTOP_DIR="$HOME/desktop"
#   XDG_DOWNLOAD_DIR="$HOME/"
#   XDG_TEMPLATES_DIR="$HOME/"
#   XDG_PUBLICSHARE_DIR="$HOME/"
#   XDG_DOCUMENTS_DIR="$HOME/docs"
#   XDG_MUSIC_DIR="$HOME/music"
#   XDG_PICTURES_DIR="$HOME/pictures"
#   XDG_VIDEOS_DIR="$HOME/"
# '';

  xdg.configFile."test.txt" = {
    enable = true;
    text = ''
      Hello world
    '';
  };
}
