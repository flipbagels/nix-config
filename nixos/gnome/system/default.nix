{ config, pkgs, ... }:

{
  # Enable gnome and gdm
  services = {
    libinput.enable = true; # Enable touchpad support
    xserver = {
      enable = true;
      displayManager.gdm = {
        enable = true;
        wayland = true;
      };
      desktopManager.gnome = {
        enable = true;
      };
    };
  };

  # UK keyboard layout
  services.xserver.xkb = {
    layout = "gb";
    variant = "";
  };

  # System packages
  environment.systemPackages = with pkgs; [
    dconf
    firefox
    gnome-terminal
  ];

  # Exclude following packages
  environment.gnome.excludePackages = (with pkgs; [
    cheese # webcam tool
    epiphany # web browser
    evince # document viewer
    geary # email reader
    gedit # text editor
    gnome-calendar
    gnome-characters
    gnome-clocks
    gnome-contacts
    gnome-connections
    gnome-console
    gnome-maps
    gnome-music
    gnome-photos
    gnome-tour
    gnome-weather
    yelp # Help guide
  ]) ++ (with pkgs.gnome; [
  ]);

  # Remove NixOS manual
  documentation.nixos.enable = false;
}
