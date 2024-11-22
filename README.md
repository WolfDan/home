# Home

This is my NixOS/home-manager configuration for WSL 

# Instructions

Install NixOS on the home machine (non-NixOS) to compile the system, I like to use Determinate Systems installer

```
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | \
  sh -s -- install
```

Generate the WSL tarball

```
sudo (which nix) run .#nixosConfigurations.nixos.config.system.build.tarballBuilder
```

This will generate a tar file which you'll install with nixoswsl

Google how to install a custom WSL tarball :P or follow the main repo instructions
https://github.com/nix-community/nixos-wsl

# On NixOS


## When doing changes to any nix file

If you do changes to NixOS or home manager you need to apply them

```
sudo nixos-rebuild switch --flake ~/.config/home-manager
```

or using the nushell alias

```
nrs
```

Keep in mind that if you modify NixOS specific files it will build the whole OS
otherwise it will only do home-manager related tasks which are fast
