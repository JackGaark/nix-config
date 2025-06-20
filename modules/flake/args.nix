{ inputs, ... }:
{
  perSystem = { system, ... }: {
    _module.args.pkgs = import inputs.nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };

    # These stubs must be non-empty attribute sets:
    packages = { default = null; };
    apps = { default = { type = "app"; program = "${inputs.nixpkgs}/bin/true"; }; };
    devShells = { default = inputs.nixpkgs.legacyPackages.${system}.mkShell { }; };
    checks = {};
  };
}
