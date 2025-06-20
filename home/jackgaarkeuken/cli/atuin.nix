{ config, ... }:
{
  programs.atuin = {
    enable = true;

    flags = [ "--disable-up-arrow" ];
    settings = {
      dialect = "uk";
      show_preview = true;
      inline_height = 30;
      style = "compact";
      update_check = false;
      sync_address = "https://atuin.jackroses.com";
      sync_frequency = "5m";
    };
  };
}
