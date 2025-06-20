{
  lib,
  _class,
  pkgs,
  inputs,
  ...
}:
let
  inherit (lib) mkIf getExe;
  isDarwin = _class == "darwin";
in
{
  # Temporarily disabled until agenix is added back to flake
  # imports = [ inputs.agenix.nixosModules.default ];

  # age = {
  #   ageBin = getExe pkgs.rage;
  #   secretsDir = mkIf isDarwin "/private/tmp/agenix";
  #   secretsMountPoint = mkIf isDarwin "/private/tmp/agenix.d";
  # };
}
