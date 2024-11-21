{ pkgs, ... }:
{
  system = {
    stateVersion = "24.05";
  };

  # enable nushell as default on the nixos system
  users.users.eidatyr = {
    shell = pkgs.nushell;
  };

  wsl = {
    enable = true;
    defaultUser = "eidatyr";

    docker-desktop = {
      enable = true;
    };
  };

  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
    autoPrune.enable = true;
  };
}
