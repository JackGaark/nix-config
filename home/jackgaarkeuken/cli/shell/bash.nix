{ config, ... }:
let
  # Set bash config directly instead of using config.garden.programs.bash
  cfg = {
    enable = false; # Disable bash by default
    package = null;
  };
in
{
  programs.bash = {
    inherit (cfg) enable package;
    enableCompletion = true;

    historyFile = "${config.xdg.stateHome}/bash/history";
    historyFileSize = 1000;
    historySize = 100;
    shellOptions = [
      "cdspell"
      "checkjobs"
      "checkwinsize"
      "dirspell"
      "globstar"
      "histappend"
      "no_empty_cmd_completion"
    ];
  };
}
