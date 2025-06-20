{ lib, ... }:
let
  inherit (lib) mkOption;
  inherit (lib.types) submodule;
in
{
  options.garden = mkOption {
    type = submodule { };
    default = { };
    description = "Garden configuration options";
  };

  imports = [
    ./packages.nix
    ./profiles.nix
  ];
}
