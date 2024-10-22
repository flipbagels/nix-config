{
  # Nix
  cf = "cd /etc/nixos/nix-config";
  cfv = "cd ~/.config/nvim/nixvim-config";
  df = "df -h";
  nano = "nvim";
  ngc = "sudo nix-env --delete-generations --profile /nix/var/nix/profiles/system old && nix-collect-garbage -d";
  nrun = "nix run .# --";
  rb = "sudo nixos-rebuild switch --flake /etc/nixos/nix-config";
  rbv = "sudo nix flake lock --update-input nixvim /etc/nixos/nix-config && sudo nixos-rebuild switch --flake /etc/nixos/nix-config"; # update nixvim
  v = "nvim";
  vi = "nix run ~/.config/nvim/nixvim-config/";
  vim = "nvim";

  # Darwin
  dcf = "cd ~/.config/nix-config";
  drb = "darwin-rebuild switch --flake ~/.config/nix-config";
  drbv = "nix flake lock --update-input nixvim ~/.config/nix-config && darwin-rebuild switch --flake ~/.config/nix-config";

  # Git
  ga = "git add";
  gc = "git commit";
  gd = "git diff";
  gg = "git pull";
  gp = "git push";
  gr = "git reset";
  gs = "git status";

  # Development
  sv = "source venv/bin/activate";
  dv = "deactivate";

  # Remote
  oxvpn = ''sudo echo \"Sudo first\" && openconnect https://vpn.ox.ac.uk --useragent=AnyConnect --cookieonly | sudo openconnect https://vpn.ox.ac.uk --useragent=AnyConnect --gnutls-priority="NORMAL:-VERS-ALL:+VERS-TLS1.2:+RSA:+AES-128-CBC:+SHA1" --cookie-on-stdin'';
  mhydra = "bash ${./mhydra.sh}";
  umhydra = "fusermount -u ~/mnt/hydra && echo 'Successfully unmounted ~/mnt/hydra/'";
  hydra = "cd ~/mnt/hydra";
  KILLhydra = "kill $(ps aux | grep [h]ydra.physics.ox.ac.uk | awk '{print $2}')";
}
