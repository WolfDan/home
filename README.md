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

## Configure home manager

this is important, as long you don't need changes in NixOS itself you can use home-manager
is way faster than recompiling NixOS from scratch and the result is basically the same

```
rm -rf ~/.config/home-manager
git clone https://github.com/WolfDan/home.git ~/.config/home-manager
nix run home-manager/master -- init --switch
home-manager switch
```

## rebuild NixOS when doing changes inside NixOS

In the case that you did a change to NixOS directly use the following command
to rebuild NixOS


```
sudo nixos-rebuild switch --flake .config/home-manager
```
