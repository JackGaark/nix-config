{
  lib,
  pkgs,
  config,
  ...
}:
{
  # pointer / cursor theming
  home.pointerCursor = {
    enable = pkgs.stdenv.hostPlatform.isLinux && true;
    size = 24;
    dotIcons.enable = false;
    gtk.enable = true;
    # this adds extra deps, so lets only enable it on wayland
    x11.enable = false;
  };
}
