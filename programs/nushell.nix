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

        $env.NIX_USER_PROFILE_DIR = $"/nix/var/nix/profiles/per-user/($env.USER)"

        $env.NIX_PROFILES = [
            "/nix/var/nix/profiles/default"
            "/run/current-system/sw"
            $"/etc/profiles/per-user/($env.USER)"
            $"($env.HOME)/.nix-profile"
        ]

        if ($"($env.HOME)/.nix-defexpr/channels" | path exists) {
            $env.NIX_PATH = ($env.NIX_PATH | split row (char esep) | append $"($env.HOME)/.nix-defexpr/channels")
        }

        if (false in (ls -l `/nix/var/nix`| where type == dir | where name == "/nix/var/nix/db" | get mode | str contains "w")) {
            $env.NIX_REMOTE = "daemon"
        }
      '';
      shellAliases = {
        nrs = "sudo nixos-rebuild switch --flake ~/.config/home-manager";
      };
    };
  };
}
