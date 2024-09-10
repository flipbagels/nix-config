{ config, pkgs, ... }:

{
  # Enable gnome and gdm
  services.xserver = {
    enable = true;
    displayManager.gdm = {
      enable = true;
      wayland = true;
    };
    desktopManager.gnome = {
      enable = true;
    };
  };

  programs.dconf.enable = true;

  # Exclude following packages
  environment.gnome.excludePackages = (with pkgs; [
    gedit # text editor
    gnome-connections
    gnome-console
    gnome-photos
    gnome-tour
  ]) ++ (with pkgs.gnome; [
    cheese # webcam tool
    epiphany # web browser
    evince # document viewer
    gnome-calendar
    gnome-characters
    gnome-clocks
    gnome-contacts
    gnome-maps
    gnome-music
    gnome-weather
    geary # email reader
    yelp # Help guide
  ]);

  # Configure keymap
  services.xserver.xkb = {
    layout = "gb";
    variant = "";
  };
}