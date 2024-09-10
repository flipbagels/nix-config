{ config, pkgs, ... }:

{
  users.users.lukas = {
    isNormalUser = true;
    description = "Lukas";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    ];
  };
}