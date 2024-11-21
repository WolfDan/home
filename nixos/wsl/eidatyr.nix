{ pkgs, ... }:
{
  system = {
    stateVersion = "24.05";
  };

  # enable nushell as default on the nixos system
  users.users.eidatyr = {
    shell = pkgs.nushell;
  };

  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
      use-xdg-base-directories = true;
      warn-dirty = false;
    };
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

  # enable dynamic loading
  # this is mostly for vscode :p
  programs.nix-ld.enable = true;
}
