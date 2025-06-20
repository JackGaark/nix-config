{ config, ... }:
let
  # Set zsh config directly instead of using config.garden.programs.zsh
  cfg = {
    enable = false; # Disable zsh by default
  };
in
{
  programs.zsh = {
    inherit (cfg) enable;
  };
}
