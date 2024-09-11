{ config, pkgs, ... }:

{
  programs.bash = {
    enable = true;

    shellAliases = {
      cf = "cd /etc/nixos";
      oxvpn = ''sudo echo \"Sudo first\" && openconnect https://vpn.ox.ac.uk --useragent=AnyConnect --cookieonly | sudo openconnect https://vpn.ox.ac.uk --useragent=AnyConnect --gnutls-priority="NORMAL:-VERS-ALL:+VERS-TLS1.2:+RSA:+AES-128-CBC:+SHA1" --cookie-on-stdin'';
      rb = "sudo nixos-rebuild switch";
    };
  };
}