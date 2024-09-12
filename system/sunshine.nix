{ config, pkgs, ... }:

{
  services.sunshine = {
    enable = true;

    settings = {
      output_name = 1;
    };
  };

  security.wrappers.sunshine = {
      owner = "root";
      group = "root";
      capabilities = "cap_sys_admin+p";
      source = "${pkgs.sunshine}/bin/sunshine";
  };

  networking.firewall.allowedTCPPorts = [ 47984 47989 47990 48010 ];
  networking.firewall.allowedUDPPorts = [ 47998 47999 48000 ];
}