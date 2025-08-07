{ appimageTools, fetchurl }:

appimageTools.wrapType2 {
  pname = "lmms";
  version = "1.2.2";
  src = fetchurl {
    url = "https://github.com/LMMS/lmms/releases/download/v1.2.2/lmms-1.2.2-linux-x86_64.AppImage";
    hash = "sha256-bNxFoGmbjNhSlcSbysA/zObz2P/X2iPWRtDLQliGm3Y=";
  };
}
