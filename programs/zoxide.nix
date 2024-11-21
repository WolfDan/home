{ config, pkgs, ... }:

{
  programs = {
    # Type `z <pat>` to cd to some directory
    zoxide = {
      enable = true;
      enableNushellIntegration = true;
    };
  };
}
