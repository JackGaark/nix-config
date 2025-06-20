{
  lib,
  config,
  ...
}:
let
  inherit (lib) elem mkIf;
in
{
  config = mkIf (elem "jack" config.garden.system.users) {
    users.users.jack = {
      isNormalUser = true;
      group = "jack";
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAECxvJM+CyBoPNtVcNZodtJuxUqPiZLEyfUI+pI5clv jack.gaarkeuken@gmail.com"
      ];
    };
    users.groups.jack = {};
  };
}
