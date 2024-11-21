{ config, pkgs, ... }:

{
  programs = {
    # atuin shell history
    atuin = {
      enable = true;
      enableNushellIntegration = true;
    };
  };
}
