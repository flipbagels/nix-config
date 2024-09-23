{
  config,
  pkgs,
  ...
}: {
  programs.bash = {
    enable = true;

    shellAliases = {
      cf = "cd /etc/nixos/nixos-config";
      cfv = "cd /etc/nixos/nixvim-config";
      df = "df -h";
      ga = "git add";
      gc = "git commit";
      gd = "git diff";
      gg = "git pull";
      gp = "git push";
      gr = "git reset";
      gs = "git status";
      ngc = "sudo nix-env --delete-generations --profile /nix/var/nix/profiles/system old && nix-collect-garbage -d";
      nrun = "nix run .# --";
      oxvpn = ''sudo echo \"Sudo first\" && openconnect https://vpn.ox.ac.uk --useragent=AnyConnect --cookieonly | sudo openconnect https://vpn.ox.ac.uk --useragent=AnyConnect --gnutls-priority="NORMAL:-VERS-ALL:+VERS-TLS1.2:+RSA:+AES-128-CBC:+SHA1" --cookie-on-stdin'';
      rb = "sudo nixos-rebuild switch --flake /etc/nixos/nixos-config";
      uvim = "nix flake lock --update-input nixvim && sudo nixos-rebuild switch --flake /etc/nixos/nixos-config"; # update nixvim
      vi = "nvim";
      vim = "nvim";
    };
  };
}
