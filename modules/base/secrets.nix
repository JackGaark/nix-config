{
  lib,
  _class,
  pkgs,
  inputs,
  config,
  ...
}:
let
  inherit (lib) mkIf getExe;
  isDarwin = _class == "darwin";
in
{
  # Temporarily disabled to test system build
  # imports = [ inputs.agenix.nixosModules.default ];

  # age = {
  #   ageBin = getExe pkgs.rage;
  #   secretsDir = mkIf isDarwin "/private/tmp/agenix";
  #   secretsMountPoint = mkIf isDarwin "/private/tmp/agenix.d";

  #   secrets = {
  #     wakatime = {
  #       file = ./secrets/jack/wakatime.age;
  #       path = "/Users/jackgaarkeuken/.config/wakatime/.wakatime.cfg";
  #       mode = "600";
  #       owner = "jackgaarkeuken";
  #     };

  #     nix-auth-tokens = {
  #       file = ./secrets/jack/nix-auth-tokens.age;
  #       mode = "600";
  #       owner = "jackgaarkeuken";
  #     };

  #     # git ssh keys
  #     keys-gh = {
  #       file = ./secrets/keys/gh.age;
  #       mode = "600";
  #       owner = "jackgaarkeuken";
  #     };
  #     keys-gh-pub = {
  #       file = ./secrets/keys/gh-pub.age;
  #       mode = "644";
  #       owner = "jackgaarkeuken";
  #     };
  #     keys-aur = {
  #       file = ./secrets/keys/aur.age;
  #       mode = "600";
  #       owner = "jackgaarkeuken";
  #     };
  #     keys-aur-pub = {
  #       file = ./secrets/keys/aur-pub.age;
  #       mode = "644";
  #       owner = "jackgaarkeuken";
  #     };

  #     # extra uni stuff
  #     uni-gitconf = {
  #       file = ./secrets/uni/gitconf.age;
  #       mode = "600";
  #       owner = "jackgaarkeuken";
  #     };
  #     uni-ssh = {
  #       file = ./secrets/uni/ssh.age;
  #       mode = "600";
  #       owner = "jackgaarkeuken";
  #     };
  #     uni-central = {
  #       file = ./secrets/uni/central.age;
  #       path = "/Users/jackgaarkeuken/.ssh/uni-central";
  #       mode = "600";
  #       owner = "jackgaarkeuken";
  #     };

  #     # ORACLE vps'
  #     keys-openvpn = {
  #       file = ./secrets/keys/openvpn.age;
  #       mode = "600";
  #       owner = "jackgaarkeuken";
  #     };
  #     keys-amity = {
  #       file = ./secrets/keys/amity.age;
  #       mode = "600";
  #       owner = "jackgaarkeuken";
  #     };

  #     # All nixos machines
  #     keys-nixos = {
  #       file = ./secrets/keys/nixos.age;
  #       path = "/Users/jackgaarkeuken/.ssh/id_ed25519";
  #       mode = "600";
  #       owner = "jackgaarkeuken";
  #     };
  #     keys-nixos-pub = {
  #       file = ./secrets/keys/nixos-pub.age;
  #       path = "/Users/jackgaarkeuken/.ssh/id_ed25519.pub";
  #       mode = "644";
  #       owner = "jackgaarkeuken";
  #     };
  #   };
  # };
}
