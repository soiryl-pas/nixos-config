{ config, pkgs, lib, ... }:

let
  extra-path = with pkgs; [
    dotnetCorePackages.sdk_9_0
    dotnetPackages.Nuget
    mono
    msbuild
  ];

  extra-lib = with pkgs; [
  ];

  rider = pkgs.jetbrains.rider.overrideAttrs (prev: {
    postInstall = ''
      # Extra tools and libraries for rider
      mv $out/bin/rider $out/bin/.rider-toolless
      makeWrapper $out/bin/.rider-toolless $out/bin/rider \
        --argv0 rider \
        --prefix PATH : "${lib.makeBinPath extra-path}" \
        --prefix LD_LIBRARY_PATH : "${lib.makeLibraryPath extra-lib}"
    '' + prev.postInstall or "";
  });
in {
  home.packages = [ rider ];
}
