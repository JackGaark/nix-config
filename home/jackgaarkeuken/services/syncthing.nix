{
  lib,
  pkgs,
  config,
  ...
}:
let
  inherit (lib) mkIf;
in
{
  config = mkIf true {
    services.syncthing = {
      enable = true;

      tray = {
        enable = pkgs.stdenv.hostPlatform.isLinux;
        command = "syncthingtray --wait";
      };
    };
  };
}
