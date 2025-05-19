{ appimageTools, fetchurl }:

appimageTools.wrapType2 {
  pname = "musescore";
  version = "4.5.2";
  src = fetchurl {
    url = "https://github.com/musescore/MuseScore/releases/download/v4.5.2/MuseScore-Studio-4.5.2.251141401-x86_64.AppImage";
    hash = "sha256-0BC2Rkx4tNojB3608Jb5Sa5ousTICaiwCKDPv0jiYKU=";
  };
}
