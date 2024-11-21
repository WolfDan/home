{ config, pkgs, ... }:

{
  programs = {
    # git source control
    git = {
      enable = true;
      extraConfig = {
        credential = {
          helper = "/mnt/c/Program\\ Files/Git/mingw64/bin/git-credential-manager.exe";
          "github.com" = {
            usehttppath = true;
          };
        };
      };
    };
  };
}
