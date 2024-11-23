{
  config,
  lib,
  ...
}: let
  cfg = config.programs.mise;
in {
  programs = {
    # mise
    mise = {
      enable = true;
    };

    # Nushell
    nushell = {
      # enable mise and add executables to path
      extraEnv = ''
        $env.config = ($env | default {} config).config
        $env.config = ($env.config | default {} hooks)
        $env.config = ($env.config | update hooks ($env.config.hooks | default {} env_change))
        $env.config = ($env.config | update hooks.env_change ($env.config.hooks.env_change | default [] PWD))

        let mise_cache = "${config.xdg.cacheHome}/mise"
        if not ($mise_cache | path exists) {
          mkdir $mise_cache
        }

        ${lib.getExe cfg.package} activate nu | save --force ${config.xdg.cacheHome}/mise/init.nu
      '';
      extraConfig = ''
        use ${config.xdg.cacheHome}/mise/init.nu
      '';
    };
  };
}
