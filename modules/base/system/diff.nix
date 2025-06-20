{
  lib,
  pkgs,
  config,
  ...
}:
let
  inherit (lib)
    mkIf
    mkMerge
    mkAfter
    mkEnableOption;
in
{
  options.garden.system.activation.diff.enable = mkEnableOption "Enable a system diff" // {
    default = true;
  };

  config = mkIf config.garden.system.activation.diff.enable (mkMerge [
    {
      # ⚠️ Removed the diff script because lix-diff is gone
      # Feel free to keep other logic if you have alternatives.
    }

    (mkIf pkgs.stdenv.hostPlatform.isLinux {
      system.activationScripts.diff.supportsDryActivation = true;
    })

    (mkIf pkgs.stdenv.hostPlatform.isDarwin {
      # no-op if diff is removed
    })
  ]);
}
