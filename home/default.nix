{
  lib,
  self,
  self',
  config,
  inputs,
  inputs',
  ...
}:
let
  inherit (lib) genAttrs;
in
{
  home-manager = {
    verbose = true;
    useUserPackages = true;
    useGlobalPkgs = true;
    backupFileExtension = "bak";

    users =
      # For the jack system, we explicitly only want to configure jackgaarkeuken
      # Ignore any other users that might be in the default list
      if config.networking.hostName == "jack" then {
        jackgaarkeuken = {
          imports = [ ./jackgaarkeuken ];
        };
      } else
        # For other systems, use the normal behavior
        let
          availableUsers = builtins.filter (user:
            builtins.pathExists (./. + "/${user}")
          ) config.garden.system.users;
        in
        genAttrs availableUsers (name: {
          imports = [ ./${name} ];
        });

    extraSpecialArgs = {
      inherit
        self
        self'
        inputs
        inputs'
        ;
    };

    # Temporarily disabled to avoid circular dependency
    # sharedModules = [ ../modules/home/default.nix ];
  };
}
