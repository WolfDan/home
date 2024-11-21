{ config, pkgs, ... }:

{
  programs = {
    # Nushell
    nushell = {
      enable = true;
      # Add executables to path
      # Setup nixos paths
      extraEnv = ''
        $env.PATH = (
          $env.PATH | split row (char esep)
            | append ($env.HOME | path join .nix-profile bin)
            | append /nix/var/nix/profiles/default/bin 
            | append /usr/local/bin
            | uniq # filter so the paths are unique
        )

        $env.NIX_SSL_CERT_FILE = "/etc/ssl/certs/ca-certificates.crt"

        $env.XDG_DATA_DIRS = [
          "/usr/local/share"
          "/usr/share"
          $"($env.HOME)/.nix-profile/share"
          "/nix/var/nix/profiles/default/share"
        ]

        $env.NIX_PROFILES = [
          "/nix/var/nix/profiles/default"
          $"($env.HOME)/.nix-profile"
        ]
      '';
    };
  };
}
