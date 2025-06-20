{ config, ... }:
{
  programs.izrss.enable = config.garden.profiles.workstation.enable;
}