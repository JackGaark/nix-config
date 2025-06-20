{ config, ... }:
{
  programs.lazygit.enable = config.garden.profiles.workstation.enable;
}