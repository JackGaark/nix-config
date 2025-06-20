{ config, ... }:
let
  # inherit (config.age) secrets;
in
{
  programs.ssh = {
    enable = true;
    hashKnownHosts = true;
    compression = true;

    # Age secrets are managed at system level, not in Home Manager
    # includes = [
    #   secrets.uni-ssh.path
    # ];

    matchBlocks = {
      # git clients
      "aur.archlinux.org" = {
        user = "aur";
        hostname = "aur.archlinux.org";
        # identityFile = secrets.keys-aur.path;
      };

      "github.com" = {
        user = "git";
        hostname = "github.com";
        # identityFile = secrets.keys-gh.path;
      };

      "gitlab.com" = {
        user = "git";
        hostname = "gitlab.com";
      };

      "git.jackroses.com" = {
        user = "git";
        hostname = "git.jackroses.com";
        port = 2222;
      };

      "git.auxolotl.org" = {
        user = "forgejo";
        hostname = "git.auxolotl.org";
      };

      # ORACLE vps'
      "openvpn" = {
        hostname = "132.145.55.42";
        user = "openvpnas";
        # identityFile = secrets.keys-openvpn.path;
      };

      "amity" = {
        hostname = "143.47.240.116";
        # identityFile = secrets.keys-amity.path;
      };

      "skadi".hostname = "141.147.73.185";

      # hetzner cloud vps
      "minerva".hostname = "91.107.198.173";
      "hestia".hostname = "116.203.57.153";

      # my local servers / clients
      "athena".hostname = "192.168.86.3";
      "tatsumaki".hostname = "192.168.1.217";
    };
  };
}
