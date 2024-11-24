{pkgs, ...}: let
  user = "eidatyr";
in {
  system = {
    stateVersion = "24.05";
  };

  # enable nushell as default on the nixos system
  users.users.${user} = {
    shell = pkgs.nushell;
  };

  nix = {
    gc = {
      automatic = true;
      options = "--delete-older-than 1d";
    };
    settings = {
      auto-optimise-store = true;
      accept-flake-config = true;
      experimental-features = ["nix-command" "flakes"];
      warn-dirty = false;
      trusted-users = ["${user}"];
    };
  };

  wsl = {
    enable = true;
    defaultUser = "${user}";

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
