# Home

This is my nixos/home manager configuration for WSL 

# Instructions

```
sudo (which nix) run .#nixosConfigurations.nixos.config.system.build.tarballBuilder
```

This will generate a tar file which you'll install with nixoswsl
