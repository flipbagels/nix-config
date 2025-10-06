{ config, pkgs, pkgs-unstable, lib, ... }:

let 
  gnomeExtensionsList = (with pkgs.gnomeExtensions; [
    appindicator
    blur-my-shell
    compiz-windows-effect
    custom-accent-colors
    unblank
    user-themes
    tiling-assistant
  ]) ++ (with pkgs-unstable.gnomeExtensions; [
    rounded-window-corners-reborn
  ]);
in
{
  home.packages = with pkgs; [
    gnome-remote-desktop
    ]
    ++ gnomeExtensionsList;

  dconf.settings = {
    "org/gnome/shell".enabled-extensions =
      map (extension: extension.extensionUuid) gnomeExtensionsList;

    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      show-battery-percentage = true;

      # gtk-theme = "Nordic;
    };

    "org/gnome/mutter" = {
      edge-tiling = true;
    };

    "org/gnome/desktop/peripherals/mouse" = {
      speed = 0.0;
      natural-scroll = false;
    };

    "org/gnome/desktop/input-sources" = {
      xkb-options = "caps:swapescape";
    };

    "org/gnome/shell/extensions/com/github/hermes83/compiz-windows-effect" = {
      friction = 4.0;
      spring-k = 5.0;
      speedup-factor-divider = 5.0;
      mass = 75.0;
    };

    "org/gnome/shell/extensions/tiling-assingstant" = {
      enable-tiling-popup = false;
      window-gap = 8.0;
      single-screen-gap = 8.0;
      maximize-with-gap = true;
    };

    "org/gnome/shell/extensions/user-theme" = {
      # name = "nordic";
    };

    
    "org/gnome/desktop/background" =
      let wallpaper = "orange_blue.jpg";
      in {
        picture-uri = "file:///etc/nixos/nix-config/global/wallpapers/${wallpaper}";
        picture-uri-dark = "file:///etc/nixos/nix-config/global/wallpapers/${wallpaper}";
      };
  };
}
