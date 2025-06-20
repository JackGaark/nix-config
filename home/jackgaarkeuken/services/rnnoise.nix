{
  lib,
  pkgs,
  config,
  ...
}:
let
  inherit (lib) mkIf;
in
{
  # Temporarily disabled to test recursion
  # config = mkIf (true && pkgs.stdenv.hostPlatform.isLinux) { # config.garden.profiles.graphical.enable && pkgs.stdenv.hostPlatform.isLinux
  #   xdg.configFile."pipewire/pipewire.conf.d/99-input-denoising.conf".text = builtins.toJSON {
  #     "context.modules" = [
  #       {
  #         "name" = "libpipewire-module-filter-chain";
  #         "args" = {
  #           "node.description" = "Noise Canceling source";
  #           "media.name" = "Noise Canceling source";
  #           "filter.graph" = {
  #             "nodes" = [
  #               {
  #                 "type" = "ladspa";
  #                 "name" = "rnnoise";
  #                 "plugin" = "${pkgs.rnnoise-plugin}/lib/ladspa/librnnoise_ladspa.so";
  #                 "label" = "noise_suppressor_stereo";
  #                 "control" = {
  #                   "VAD Threshold (%)" = 30.0;
  #                 };
  #               }
  #             ];
  #           };
  #           "audio.position" = [
  #             "FL"
  #             "FR"
  #           ];
  #           "capture.props" = {
  #             "node.name" = "effect_input.rnnoise";
  #             "node.passive" = true;
  #           };
  #           "playback.props" = {
  #             "node.name" = "effect_output.rnnoise";
  #             "media.class" = "Audio/Source";
  #           };
  #         };
  #       }
  #     ];
  #   };
  # };
}
