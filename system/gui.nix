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
      xkb = {
        layout = "gb";
        variant = "";
      };
    };
  };

  # System packages
  environment.systemPackages = with pkgs; [
    dconf
    firefox
    gnome.gnome-terminal
  ];

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

  # Remove NixOS manual
  documentation.nixos.enable = false;
}