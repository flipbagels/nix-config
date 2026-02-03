{ config, pkgs, ... }:

{
  services.hyprpaper = {
    enable = true;
    settings =
      let wallpaper = "forest-road.jpg";
      in {
        ipc = "on";
        splash = false;
        preload = [ "/etc/nixos/nixos-config/images/${wallpaper}" ];
        wallpaper = [ "/etc/nixos/nixos-config/images/${wallpaper}" ];
      };
  };
}
