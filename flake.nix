{
  description = "Jack's dotfiles (Home Manager + devShell + Darwin config)";

  inputs = {
    nixpkgs.url = "https://channels.nixos.org/nixpkgs-unstable/nixexprs.tar.xz";

    flake-parts = {
      type = "github";
      owner = "hercules-ci";
      repo = "flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    home-manager = {
      type = "github";
      owner = "nix-community";
      repo = "home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    darwin = {
      type = "github";
      owner = "LnL7";
      repo = "nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    treefmt-nix = {
      type = "github";
      owner = "numtide";
      repo = "treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin = {
      type = "github";
      owner = "catppuccin";
      repo = "nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    evergarden = {
      type = "github";
      owner = "everviolet";
      repo = "nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    tgirlpkgs = {
      type = "github";
      owner = "tgirlcloud";
      repo = "pkgs";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    izvim = {
      type = "github";
      owner = "isabelroses";
      repo = "nvim";
    };

    ivy = {
      type = "github";
      owner = "comfysage";
      repo = "ivy";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs:
    let
      flake = inputs.flake-parts.lib.mkFlake {
        inherit inputs;
        systems = [ "aarch64-darwin" ]; # ✅ This line fixes 'systems' undefined
      } {
        imports = [ ./modules/flake ];
      };
    in
    flake // {
      darwinConfigurations.jack = inputs.darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        modules = [
          ./modules/base
          inputs.home-manager.darwinModules.home-manager
          {
            home-manager.users.jackgaarkeuken = import ./home/jackgaarkeuken;
          }
        ];
      };
    };
}
