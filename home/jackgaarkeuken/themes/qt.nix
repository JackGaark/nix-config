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
  # Disable qt theme on Darwin since it's for Linux
  # config = mkIf (config.garden.profiles.graphical.enable && pkgs.stdenv.hostPlatform.isLinux) {
  #   qt = {
  #     enable = true;
  #     platformTheme.name = "kvantum";
  #     style.name = "kvantum";
  #   };

  #   catppuccin.kvantum.apply = true;

  #   home.sessionVariables = {
  #     # scaling - 1 means no scaling
  #     QT_AUTO_SCREEN_SCALE_FACTOR = "1";

  #     # use wayland as the default backend, fallback to xcb if wayland is not available
  #     QT_QPA_PLATFORM = "wayland;xcb";

  #     # disable window decorations everywhere
  #     QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";

  #     # remain backwards compatible with qt5
  #     DISABLE_QT5_COMPAT = "0";

  #     # tell calibre to use the dark theme
  #     CALIBRE_USE_DARK_PALETTE = "1";
  #   };
  # };
}
