{
  lib,
  pkgs,
  config,
  ...
}:
let
  inherit (lib) mkIf getExe;
in
{
  # Temporarily disabled to test recursion
  # config = mkIf true { # config.garden.profiles.graphical.enable
  #   systemd.user.services.cliphist = {
  #     Unit.Description = "Clipboard history service";
  #     Service = {
  #       ExecStart = "${pkgs.wl-clipboard}/bin/wl-paste --watch ${getExe pkgs.cliphist} store";
  #       Restart = "always";
  #     };
  #   };
  # };
}
