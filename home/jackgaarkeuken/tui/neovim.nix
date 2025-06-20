{ inputs, config, lib, ... }:

{
  imports = [
    inputs.izvim.homeModules.default
  ];

  garden.programs.neovim.enable = lib.mkForce false;

  programs.izvim = {
    enable = true;
    includePerLanguageTooling = config.garden.profiles.workstation.enable or false;
    gui.enable = config.garden.profiles.graphical.enable or false;
  };
}