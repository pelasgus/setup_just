# just.nix
# Author: D.A.Pelasgus

let
  # Unstable Channel | Rolling Release
  pkgs = import (fetchTarball("channel:nixpkgs-unstable")) { 
  };

  packages = with pkgs; [
    curl
    jq
    just
    bash
  ];
in
pkgs.mkShell {
  buildInputs = packages;

  shellHook = ''
    export PATH="${pkgs.just}/bin:$PATH"  # Ensure just is in the PATH  
  '';
}
