# Minimal home configuration for jack user
# This user should not actually be created on the system
# The configuration is only here to satisfy home-manager requirements

{ ... }:
{
  # Minimal home-manager configuration
  programs.home-manager.enable = true;
  
  # Do not set home directory or username overrides that might conflict
  # Let the system handle the user mapping naturally
}

