{ inputs, config, lib, ... }:

{
  imports = [
    inputs.izvim.homeModules.default
  ];

  # Disable neovim for now
  # garden.programs.neovim.enable = lib.mkForce false;

  programs.izvim = {
    enable = true;
    includePerLanguageTooling = false; # config.garden.profiles.workstation.enable or false;
    gui.enable = true; # config.garden.profiles.graphical.enable or false;
  };
}
