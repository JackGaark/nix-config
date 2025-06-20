{
  imports = [
    ./programs
    ./packages
    ./checks
  ];

  flake = { config, inputs, ... }: {
    # Remove the duplicate darwinConfigurations definition
    # The main flake.nix already defines darwinConfigurations.jack
  };
}
