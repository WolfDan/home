# Home

This is my nixos/home manager configuration for WSL 

# Instructions

```
sudo (which nix) run .#nixosConfigurations.nixos.config.system.build.tarballBuilder
```

This will generate a tar file which you'll install with nixoswsl

# on nixos

```
rm -rf ~/.config/home-manager
git clone https://github.com/WolfDan/home.git ~/.config/home-manager
```
