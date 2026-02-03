{ config, pkgs, ... }:


{
  services = {
    xserver.enable = true;
    libinput.enable = true; # Enable touchpad support
    # displayManager.sddm = {
    #   enable = true;
    # };
  };


  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  environment.sessionVariables.NIXOS_OZONE_WL = "1"; # This variable fixes electron apps in wayland

  environment.systemPackages = with pkgs; [
    brightnessctl
    fuzzel
    hyprcursor
    hypridle
    hyprlock
    hyprpaper
    hyprpicker
    kitty
    networkmanager
    networkmanagerapplet
    swww
    swaynotificationcenter
    waybar
    xfce.thunar
  ];
}
