{
  lib,
  pkgs,
  config,
  ...
}:
let
  inherit (lib) mkForce;

  # Set ghostty config directly instead of using config.garden.programs.ghostty
  cfg = {
    enable = true;
    package = pkgs.ghostty;
  };
in
{
  programs.ghostty = {
    inherit (cfg) enable;

    # FIXME: ghostty is broken on darwin
    package = if pkgs.stdenv.hostPlatform.isLinux then cfg.package else null;

    settings = {
      command = "/etc/profiles/per-user/jackgaarkeuken/bin/fish --login";

      theme = mkForce "cuddlefish";

      background-opacity = 0.95;
      cursor-style = "bar";
      window-padding-x = "4,4";
      window-decoration = toString pkgs.stdenv.hostPlatform.isDarwin;
      gtk-titlebar = false;

      window-save-state = "always";

      # Set fonts directly instead of using config.garden.style.fonts
      font-family = "JetBrains Mono";
      font-family-bold = "JetBrains Mono Bold";
      font-family-italic = "JetBrains Mono Italic";
      font-family-bold-italic = "JetBrains Mono Bold Italic";
      font-size = 13;
    };
  };
}
