{ config, pkgs, ... }:

{
  programs = {
    # starship shell display/theme
    starship = {
      enable = true;
      enableNushellIntegration = true;
    };
  };
}
