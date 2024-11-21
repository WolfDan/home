{ config, pkgs, ... }:

{
  programs = {
    # caparace autocompletion
    carapace = {
      enable = true;
      enableNushellIntegration = true;
    };
  };
}
