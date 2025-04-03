{ lib, fetchFromGitHub, buildGhidraExtension, ... }:

let 
    pname = "Ghidra-GBA-Loader";
    version = "1.0.2";
    owner = "pudii";
    repo = "gba-ghidra-loader";
in buildGhidraExtension {
  inherit pname;
  inherit version;

  src = fetchFromGitHub {
    inherit owner;
    inherit repo;
    rev = version;
  };

  meta = {
    description = "Loader for GameBoy Advance ROM files";
    homepage = "https://github.com/${owner}/${repo}";
    downloadPage = "https://github.com/${owner}/${repo}/releases/tag/${version}";
  };
}
