{
  imports = [
    ./cli # command line interface app confurations
    ./gui # graphical interface app confurations
    ./system # important system environment config
    ./services # system services, organized by display protocol
    ./themes # Application themeing
    ./tui # terminal interface app confurations
    ./packages.nix # a top-level list of packages
  ];

  home.stateVersion = "24.11";
}
